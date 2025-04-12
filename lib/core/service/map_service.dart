import 'package:flutter/widgets.dart';

import 'package:geocoding/geocoding.dart' as geo;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import '../extension/build_context_extension.dart';

class MapService {
  final Location _location;

  MapService({required Location location}) : _location = location;

  Future<bool> checkPermission(BuildContext context) async {
    try {
      bool serviceEnabled = await _location.serviceEnabled();
      if (!serviceEnabled) {
        serviceEnabled = await _location.requestService();
        if (!serviceEnabled) {
          if (context.mounted) {
            context.showSnackBar('Location services is not available');
          }
          return false;
        }
      }

      PermissionStatus permissionGranted = await _location.hasPermission();
      if (permissionGranted == PermissionStatus.denied) {
        permissionGranted = await _location.requestPermission();
        if (permissionGranted != PermissionStatus.granted) {
          if (context.mounted) {
            context.showSnackBar('Location permission is denied');
          }
          return false;
        }
      }
    } catch (e) {
      if (context.mounted) {
        context.showSnackBar('Failed to get location permission');
      }
      return false;
    }

    return true;
  }

  Marker createMarker({
    required LatLng latLng,
    required String id,
    String? street,
    String? address,
  }) {
    return Marker(
      markerId: MarkerId(id),
      position: latLng,
      infoWindow: InfoWindow(title: street, snippet: address),
    );
  }

  Future<LocationData> getMyLocation() async => await _location.getLocation();

  Future<(geo.Placemark, String, String)> getPlacemark(LatLng point) async {
    final info = await geo.placemarkFromCoordinates(
      point.latitude,
      point.longitude,
    );
    final place = info[0];
    final street = place.street ?? '';
    final address = [
      place.subLocality,
      place.locality,
      place.postalCode,
      place.country,
    ].where((e) => e != null).join(', ');
    return (place, street, address);
  }
}

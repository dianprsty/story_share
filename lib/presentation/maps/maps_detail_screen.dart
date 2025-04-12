import 'dart:async';

import 'package:flutter/material.dart';

import 'package:geocoding/geocoding.dart' as geo;
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import '../../core/di/injection.dart';
import '../../core/extension/build_context_extension.dart';
import '../../core/config/go_router_config.dart';
import '../../core/service/map_service.dart';

import 'widget/placemark_widget.dart';

class MapsDetailScreen extends StatefulWidget {
  final String? id;
  final String? lat;
  final String? lng;
  final bool? isFromPost;
  const MapsDetailScreen({
    super.key,
    this.id,
    this.lat,
    this.lng,
    this.isFromPost = false,
  });

  @override
  State<MapsDetailScreen> createState() => _MapsDetailScreenState();
}

class _MapsDetailScreenState extends State<MapsDetailScreen> {
  late LatLng point = LatLng(
    double.parse(widget.lat ?? '-6.175389'),
    double.parse(widget.lng ?? '106.827139'),
  );
  late GoogleMapController mapController;
  final Set<Marker> markers = {};
  MapType selectedMapType = MapType.normal;
  geo.Placemark? placemark;

  @override
  void dispose() {
    mapController.dispose();
    super.dispose();
  }

  Future<void> setInitialLocation(BuildContext context) async {
    try {
      bool isPermission = await getIt<MapService>().checkPermission(context);
      if (isPermission) {
        LocationData locationData = await getIt<MapService>().getMyLocation();
        final latLng = LatLng(locationData.latitude!, locationData.longitude!);
        point = latLng;
      } else {
        if (context.mounted) {
          context.showSnackBar('Location permission is denied');
          point = LatLng(-6.175389, 106.827139);
        }
      }
    } catch (e) {
      if (context.mounted) {
        context.showSnackBar('Failed to get location');
        point = LatLng(-6.175389, 106.827139);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      if (widget.isFromPost!) {
        setInitialLocation(context);
      } else {
        point = LatLng(double.parse(widget.lat!), double.parse(widget.lng!));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            GoogleMap(
              markers: markers,
              initialCameraPosition: CameraPosition(target: point, zoom: 15),
              onMapCreated: (controller) => onMapCreated(controller, context),
              onLongPress: onLongPressGoogleMap,
              myLocationButtonEnabled: false,
              zoomControlsEnabled: false,
              mapToolbarEnabled: false,
              mapType: selectedMapType,
              myLocationEnabled: true,
            ),
            Positioned(
              bottom: 16,
              right: 16,
              child: Column(
                children: [
                  FloatingActionButton.small(
                    heroTag: 'my-location',
                    backgroundColor: Theme.of(context).colorScheme.surface,
                    onPressed: () => onMyLocationButtonPress(context),
                    child: const Icon(Icons.my_location),
                  ),
                  const SizedBox(height: 32),
                  FloatingActionButton.small(
                    heroTag: 'zoom-in',
                    backgroundColor: Theme.of(context).colorScheme.surface,
                    onPressed: () {
                      mapController.animateCamera(CameraUpdate.zoomIn());
                    },
                    child: const Icon(Icons.add),
                  ),
                  FloatingActionButton.small(
                    heroTag: 'zoom-out',
                    backgroundColor: Theme.of(context).colorScheme.surface,
                    onPressed: () {
                      mapController.animateCamera(CameraUpdate.zoomOut());
                    },
                    child: const Icon(Icons.remove),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 16,
              right: 16,
              child: FloatingActionButton.small(
                heroTag: 'map-type',
                backgroundColor: Theme.of(context).colorScheme.surface,
                onPressed: null,
                child: PopupMenuButton<MapType>(
                  onSelected: (MapType item) {
                    setState(() {
                      selectedMapType = item;
                    });
                  },
                  offset: const Offset(0, 54),
                  icon: const Icon(Icons.layers_outlined),
                  itemBuilder:
                      (BuildContext context) => <PopupMenuEntry<MapType>>[
                        const PopupMenuItem<MapType>(
                          value: MapType.normal,
                          child: Text('Normal'),
                        ),
                        const PopupMenuItem<MapType>(
                          value: MapType.satellite,
                          child: Text('Satellite'),
                        ),
                        const PopupMenuItem<MapType>(
                          value: MapType.terrain,
                          child: Text('Terrain'),
                        ),
                        const PopupMenuItem<MapType>(
                          value: MapType.hybrid,
                          child: Text('Hybrid'),
                        ),
                      ],
                ),
              ),
            ),
            Positioned(
              top: 16,
              left: 16,
              child: FloatingActionButton.small(
                heroTag: 'back',
                backgroundColor: Theme.of(context).colorScheme.surface,
                shape: const CircleBorder(),
                onPressed: () {
                  if (context.canPop()) {
                    context.pop();
                    return;
                  }
                  if (widget.id != null) {
                    context.goNamed(
                      AppRoute.detailStory.name,
                      pathParameters: {'id': widget.id!},
                    );
                  } else {
                    context.goNamed(AppRoute.home.name);
                  }
                },
                child: const Icon(Icons.chevron_left),
              ),
            ),
            if (placemark != null)
              Positioned(
                bottom: 20,
                left: 16,
                right: 72,
                child: Column(
                  spacing: 8,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    if (widget.isFromPost!)
                      FloatingActionButton.extended(
                        heroTag: 'choose-location',
                        backgroundColor: Theme.of(context).colorScheme.surface,
                        onPressed: () {
                          context.pop((
                            point,
                            [
                                  placemark!.subLocality,
                                  placemark!.locality,
                                  placemark!.postalCode,
                                  placemark!.country,
                                ]
                                .where((e) => e != null && e.isNotEmpty)
                                .join(', '),
                          ));
                        },
                        label: Text('Choose Location'),
                      ),
                    PlacemarkWidget(placemark: placemark!),
                  ],
                ),
              ),
            if (widget.isFromPost! && placemark == null)
              Positioned(
                bottom: 20,
                left: 16,
                right: 72,
                child: FloatingActionButton.extended(
                  heroTag: 'choose-location',
                  backgroundColor: Theme.of(context).colorScheme.surface,
                  onPressed: () {
                    context.pop((point, point.toString()));
                  },
                  label: Text('Choose Location'),
                ),
              ),
          ],
        ),
      ),
    );
  }

  void defineMarker({
    required LatLng latLng,
    String? street = '',
    String? address = '',
  }) {
    final marker = Marker(
      markerId: MarkerId(widget.id ?? 'marker'),
      position: latLng,
      infoWindow: InfoWindow(title: street, snippet: address),
    );
    setState(() {
      markers.clear();
      markers.add(marker);
    });
  }

  void onMyLocationButtonPress(BuildContext context) async {
    try {
      bool isPermitted = await getIt<MapService>().checkPermission(context);
      if (!isPermitted) {
        return;
      }

      LocationData locationData = await getIt<MapService>().getMyLocation();
      final latLng = LatLng(locationData.latitude!, locationData.longitude!);

      var (place, street, address) = await getIt<MapService>().getPlacemark(
        latLng,
      );

      setState(() {
        placemark = place;
        point = latLng;
      });

      defineMarker(latLng: latLng, street: street, address: address);
      mapController.animateCamera(CameraUpdate.newLatLng(latLng));
    } catch (e) {
      if (context.mounted) {
        defineMarker(latLng: point);
        setState(() {
          placemark = null;
        });
        context.showSnackBar('Error getting location');
      }
    }
  }

  void onLongPressGoogleMap(LatLng latLng) async {
    try {
      var (place, street, address) = await getIt<MapService>().getPlacemark(
        latLng,
      );

      setState(() {
        placemark = place;
        point = latLng;
      });

      defineMarker(latLng: latLng, street: street, address: address);

      mapController.animateCamera(CameraUpdate.newLatLng(latLng));
    } catch (e) {
      defineMarker(latLng: latLng);
      setState(() {
        placemark = null;
        point = latLng;
      });
      context.showSnackBar('Failed to get location info $e');
    }
  }

  Future<void> onMapCreated(
    GoogleMapController controller,
    BuildContext context,
  ) async {
    mapController = controller;

    try {
      final latLng = LatLng(
        double.parse(widget.lat!),
        double.parse(widget.lng!),
      );
      var (place, street, address) = await getIt<MapService>().getPlacemark(
        latLng,
      );
      setState(() {
        placemark = place;
      });
      defineMarker(latLng: latLng, street: street, address: address);
    } catch (e) {
      if (context.mounted) {
        defineMarker(latLng: point);
        context.showSnackBar('Failed to get location info');
      }
    }
  }
}

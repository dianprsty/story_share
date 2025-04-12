import 'package:flutter/material.dart';

import 'package:geocoding/geocoding.dart' as geo;

class PlacemarkWidget extends StatelessWidget {
  const PlacemarkWidget({super.key, required this.placemark});
  final geo.Placemark placemark;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      constraints: const BoxConstraints(maxWidth: 700),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            blurRadius: 8,
            offset: Offset.zero,
            color: Theme.of(context).colorScheme.shadow.withAlpha(50),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              spacing: 4,
              children: [
                Text(
                  placemark.street ?? '',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  [
                    placemark.subLocality,
                    placemark.locality,
                    placemark.postalCode,
                    placemark.country,
                  ].where((e) => e != null && e.isNotEmpty).toList().join(', '),
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

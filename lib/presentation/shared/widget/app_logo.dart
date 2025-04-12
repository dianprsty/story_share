import 'package:flutter/material.dart';

import '../../../core/config/flavor_config.dart';

class AppLogo extends StatelessWidget {
  final double size;
  const AppLogo({super.key, this.size = 50});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: CircleAvatar(
        backgroundImage: AssetImage(
          FlavorConfig.instance.flavor == FlavorType.pro
              ? 'assets/images/icon-pro.png'
              : 'assets/images/icon-free.png',
        ),
      ),
    );
  }
}

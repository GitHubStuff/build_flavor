import 'package:build_flavor/source/config_flavor.dart';
import 'package:flutter/material.dart';
import 'package:enum_to_string/enum_to_string.dart';

class BannerFlavor extends StatelessWidget {
  final Widget child;
  final Color color;
  final BannerLocation location;

  BannerFlavor({
    Key key,
    @required this.child,
    this.color = Colors.red,
    this.location = BannerLocation.topStart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    assert(ConfigFlavor.instance != null, 'Create ConfigFlavor');
    if (ConfigFlavor.instance.flavor == Flavor.Release) return child;
    final bannerColor = color ?? Colors.red;
    final bannerLocation = location ?? BannerLocation.topStart;
    final bannerTextDirection = TextDirection.ltr;
    final bannerText = EnumToString.convertToString(ConfigFlavor.instance.flavor ?? 'Unknown');

    return Directionality(
      key: key,
      textDirection: bannerTextDirection,
      child: Banner(
        color: bannerColor,
        message: bannerText,
        location: bannerLocation,
        child: child,
      ),
    );
  }
}

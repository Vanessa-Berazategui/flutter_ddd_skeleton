/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// ignore_for_file: directives_ordering

import 'package:flutter/widgets.dart';

class $AssetsConfigGen {
  const $AssetsConfigGen();

  /// File path: assets/config/conf.json
  String get conf => 'assets/config/conf.json';

  $AssetsConfigFlavourGen get flavour => const $AssetsConfigFlavourGen();

  /// File path: assets/config/services.json
  String get services => 'assets/config/services.json';
}

class $AssetsConfigFlavourGen {
  const $AssetsConfigFlavourGen();

  $AssetsConfigFlavourFlavour1Gen get flavour1 =>
      const $AssetsConfigFlavourFlavour1Gen();
  $AssetsConfigFlavourFlavour2Gen get flavour2 =>
      const $AssetsConfigFlavourFlavour2Gen();
}

class $AssetsConfigFlavourFlavour1Gen {
  const $AssetsConfigFlavourFlavour1Gen();

  /// File path: assets/config/flavour/flavour_1/dev_environment.json
  String get devEnvironment =>
      'assets/config/flavour/flavour_1/dev_environment.json';

  /// File path: assets/config/flavour/flavour_1/prod_environment.json
  String get prodEnvironment =>
      'assets/config/flavour/flavour_1/prod_environment.json';

  /// File path: assets/config/flavour/flavour_1/test_environment.json
  String get testEnvironment =>
      'assets/config/flavour/flavour_1/test_environment.json';
}

class $AssetsConfigFlavourFlavour2Gen {
  const $AssetsConfigFlavourFlavour2Gen();

  /// File path: assets/config/flavour/flavour_2/dev_environment.json
  String get devEnvironment =>
      'assets/config/flavour/flavour_2/dev_environment.json';

  /// File path: assets/config/flavour/flavour_2/prod_environment.json
  String get prodEnvironment =>
      'assets/config/flavour/flavour_2/prod_environment.json';

  /// File path: assets/config/flavour/flavour_2/test_environment.json
  String get testEnvironment =>
      'assets/config/flavour/flavour_2/test_environment.json';
}

class Assets {
  Assets._();

  static const $AssetsConfigGen config = $AssetsConfigGen();
}

class AssetGenImage extends AssetImage {
  const AssetGenImage(String assetName) : super(assetName);

  Image image({
    Key? key,
    ImageFrameBuilder? frameBuilder,
    ImageLoadingBuilder? loadingBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? width,
    double? height,
    Color? color,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    FilterQuality filterQuality = FilterQuality.low,
  }) {
    return Image(
      key: key,
      image: this,
      frameBuilder: frameBuilder,
      loadingBuilder: loadingBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      width: width,
      height: height,
      color: color,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      filterQuality: filterQuality,
    );
  }

  String get path => assetName;
}

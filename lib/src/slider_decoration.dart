import 'package:flutter/material.dart';

///
/// Used to Decorate the Slider Widget.
///
class SliderDecoration {
  /// Defines the background color of the inactive part of the slider
  /// Default value [Colors.blueGrey]
  final Color inactiveColor;

  /// Defines the background color of the active part of the slider
  /// Default value [Colors.blue]
  final Color activeColor;

  /// Defines the thumb color of the slider
  /// Default value [Colors.white]
  final Color thumbColor;

  /// Indicates the rounded border radius for the slider
  /// Default value 20.0
  final double borderRadius;

  /// Indicates the height of the slider
  /// Default value [50.0]
  /// The [height] is always bigger then the [thumbHeight]
  /// If not then the slider throw the error
  final double height;

  /// Indicates that slider thumb is visible or not
  /// Default value [true]
  final bool isThumbVisible;

  /// Indicates the height of the slider thumb
  /// Default value [25.0]
  /// The [thumbHeight] is always smaller then the [height]
  /// If not then the slider throw the error
  final double thumbHeight;

  /// Indicates the width of the slider thumb
  /// Default value [5.0]
  final double thumbWidth;

  SliderDecoration({
    this.inactiveColor = Colors.blueGrey,
    this.activeColor = Colors.blue,
    this.thumbColor = Colors.white,
    this.borderRadius = 20.0,
    this.height = 50.0,
    this.isThumbVisible = true,
    this.thumbHeight = 25.0,
    this.thumbWidth = 5.0,
  }) : assert(
          thumbHeight < height,
          'thumbHeight should not be same or bigger than height of slider',
        );
}

import 'package:flutter/material.dart';

import 'render_slider_controller.dart';
import 'slider_decoration.dart';

///
/// Class to Control the Custom Slider Widget.
///
class SliderController extends LeafRenderObjectWidget {
  const SliderController({
    Key? key,
    required this.value,
    required this.onChanged,
    this.sliderDecoration,
  })  : assert(
          value >= 0.0 && value <= 100.0,
          'value should be between the 0.0 to 100.0',
        ),
        super(key: key);

  /// Indicates the default slider thumb value
  /// Value is between the 0.0 to 100.0
  final double value;

  /// Called during a drag when the user is selecting a new value for the slider
  /// by dragging.
  final ValueChanged<double> onChanged;

  /// Used to Decorate the Slider Widget
  /// If decoration is null then the default value of the slider decoration is used
  final SliderDecoration? sliderDecoration;

  @override
  RenderObject createRenderObject(BuildContext context) {
    /// Create and return the render object
    return RenderSliderController(
      value: value,
      onChanged: onChanged,
      sliderDecoration: sliderDecoration ?? SliderDecoration(),
    );
  }

  @override
  void updateRenderObject(
    BuildContext context,
    covariant RenderSliderController renderObject,
  ) {
    /// Update the render object
    renderObject
      ..value = value
      ..onChanged = onChanged
      ..sliderDecoration = sliderDecoration ?? SliderDecoration();
  }
}

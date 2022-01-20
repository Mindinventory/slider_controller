import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'slider_decoration.dart';

///
/// Class to Render the Slider Widget.
///
class RenderSliderController extends RenderBox {
  RenderSliderController({
    required double value,
    required ValueChanged<double> onChanged,
    required double min,
    required double max,
    required SliderDecoration sliderDecoration,
  })  : _value = value,
        _onChanged = onChanged,
        _min = min,
        _max = max,
        _sliderDecoration = sliderDecoration {
    /// Setting up the drag gesture for the slider widget
    _drag = HorizontalDragGestureRecognizer()
      ..onStart = (DragStartDetails details) {
        _updateSliderThumbPosition(details.localPosition);
      }
      ..onUpdate = (DragUpdateDetails details) {
        _updateSliderThumbPosition(details.localPosition);
      };
  }

  /// Getter and Setter for the slider widget to render

  /// Indicates the default slider thumb value
  /// Value is between the 0.0 to 100.0
  double get value => _value;
  double _value;

  set value(double val) {
    assert(
      val >= _min && val <= _max,
      'value should be between the min or 0.0 to max or 100.0',
    );
    if (_value == val) {
      return;
    }

    /// Setting the value and calling the paint method to render the slider widget
    _value = val;
    markNeedsPaint();
  }

  /// Called during a drag when the user is selecting a new value for the slider
  /// by dragging.
  ValueChanged<double> get onChanged => _onChanged;
  ValueChanged<double> _onChanged;

  set onChanged(ValueChanged<double> changed) {
    if (_onChanged == changed) {
      return;
    }

    /// Setting the onChanged Function and calling the paint method to render the
    /// slider widget
    _onChanged = changed;
    markNeedsPaint();
  }

  /// Indicates the Minimum value for the slider
  /// If min is null then the default value 0.0 is used
  double get min => _min;
  double _min;

  set min(double val) {
    if (_min == val) {
      return;
    }

    /// Setting the value and calling the paint method to render the slider widget
    _min = val;
    markNeedsPaint();
  }

  /// Indicates the Maximum value for the slider
  /// If max is null then the default value 100.0 is used
  double get max => _max;
  double _max;

  set max(double val) {
    if (_max == val) {
      return;
    }

    /// Setting the value and calling the paint method to render the slider widget
    _max = val;
    markNeedsPaint();
  }

  /// Used to Decorate the Slider Widget
  SliderDecoration get sliderDecoration => _sliderDecoration;
  SliderDecoration _sliderDecoration;

  set sliderDecoration(SliderDecoration decoration) {
    if (_sliderDecoration == decoration) {
      return;
    }

    /// Setting the decoration and calling the paint and layout method to render the
    /// slider widget
    _sliderDecoration = decoration;
    markNeedsPaint();
    markNeedsLayout();
  }

  /// Default stroke width for the painters
  final double _strokeWidth = 4.0;

  /// Left side padding for the slider thumb
  final double _thumbLeftPadding = 10.0;

  @override
  void performLayout() {
    /// Setting up the size for the slider widget
    final desiredWidth = constraints.maxWidth;
    final desiredHeight = _sliderDecoration.height;
    final desiredSize = Size(desiredWidth, desiredHeight);
    size = constraints.constrain(desiredSize);
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    /// Setting up the canvas to draw the slider widget
    final canvas = context.canvas;
    canvas.save();
    canvas.translate(offset.dx, offset.dy);

    /// Painter for the inactive part of slider
    final inactiveSliderPainter = Paint()
      ..color = _sliderDecoration.inactiveColor
      ..strokeCap = StrokeCap.round
      ..strokeWidth = _strokeWidth;

    /// Painter for the active part of slider
    final activeSliderPainter = Paint()
      ..color = _sliderDecoration.activeColor
      ..strokeCap = StrokeCap.round
      ..strokeWidth = _strokeWidth;

    /// Painter for the slider thumb
    final thumbPainter = Paint()..color = _sliderDecoration.thumbColor;

    /// Drawing the inactive part of slider
    canvas.drawRRect(
      RRect.fromRectAndCorners(
        Offset.zero & Size(constraints.maxWidth, _sliderDecoration.height),
        topRight: Radius.circular(_sliderDecoration.borderRadius),
        topLeft: Radius.circular(_sliderDecoration.borderRadius),
        bottomRight: Radius.circular(_sliderDecoration.borderRadius),
        bottomLeft: Radius.circular(_sliderDecoration.borderRadius),
      ),
      inactiveSliderPainter,
    );

    /// Drawing the active part of slider or bar from left to thumb position
    final thumbDx = ((_value - _min) / (_max - _min)) * size.width;
    canvas.drawRRect(
      RRect.fromRectAndCorners(
        Offset.zero & Size(thumbDx, _sliderDecoration.height),
        topRight: Radius.circular(_sliderDecoration.borderRadius),
        topLeft: Radius.circular(_sliderDecoration.borderRadius),
        bottomRight: Radius.circular(_sliderDecoration.borderRadius),
        bottomLeft: Radius.circular(_sliderDecoration.borderRadius),
      ),
      activeSliderPainter,
    );

    if (_sliderDecoration.isThumbVisible) {
      /// Drawing the slider thumb
      final thumbDesiredDx =
          thumbDx - ((thumbDx == 0.0) ? 0.0 : _thumbLeftPadding);
      final thumbDesiredDy =
          (size.height / 2.0) - (_sliderDecoration.thumbHeight / 2.0);
      final thumbCenter = Offset(thumbDesiredDx, thumbDesiredDy);

      canvas.drawRRect(
        RRect.fromRectAndCorners(
          thumbCenter &
              Size(_sliderDecoration.thumbWidth, _sliderDecoration.thumbHeight),
          topRight: Radius.circular(_sliderDecoration.borderRadius),
          topLeft: Radius.circular(_sliderDecoration.borderRadius),
          bottomRight: Radius.circular(_sliderDecoration.borderRadius),
          bottomLeft: Radius.circular(_sliderDecoration.borderRadius),
        ),
        thumbPainter,
      );
    }

    /// Restoring the saved canvas
    canvas.restore();
  }

  /// Helped to Use the horizontal drag gesture for the slider
  HorizontalDragGestureRecognizer _drag = HorizontalDragGestureRecognizer();

  /// Indicates that our widget handles the gestures
  @override
  bool hitTestSelf(Offset position) => true;

  /// Handles the events
  @override
  void handleEvent(PointerEvent event, BoxHitTestEntry entry) {
    assert(
      debugHandleEvent(event, entry),
      'renderer should handle the events',
    );
    if (event is PointerDownEvent) {
      _drag.addPointer(event);
    }
  }

  /// Used to update the slider thumb position
  void _updateSliderThumbPosition(Offset localPosition) {
    /// Clamp the position between the full width of the render object
    var dx = localPosition.dx.clamp(0.0, size.width);

    /// Make the size between 0 and 1 with only 1 decimal and multiply it.
    var desiredDx = double.parse((dx / size.width).toStringAsFixed(1));
    _value = desiredDx * (_max - _min) + _min;
    _onChanged(_value);

    /// Calling the paint and layout method to render the slider widget
    markNeedsPaint();
    markNeedsSemanticsUpdate();
  }

  @override
  void detach() {
    /// Disposing the horizontal drag gesture
    _drag.dispose();
    super.detach();
  }
}

# slider_controller

<a href="https://flutter.dev/"><img src="https://img.shields.io/badge/flutter-website-deepskyblue.svg" alt="Flutter Website"></a>
<a href="https://dart.dev"><img src="https://img.shields.io/badge/dart-website-deepskyblue.svg" alt="Dart Website"></a>
<a href="https://developer.android.com" style="pointer-events: stroke;" target="_blank">
<img src="https://img.shields.io/badge/platform-Android-deepskyblue">
</a>
<a href="https://developer.apple.com/ios/" style="pointer-events: stroke;" target="_blank">
<img src="https://img.shields.io/badge/platform-iOS-deepskyblue">
</a>
<a href="" style="pointer-events: stroke;" target="_blank">
<img src="https://img.shields.io/badge/platform-Web-deepskyblue">
</a>
<a href="" style="pointer-events: stroke;" target="_blank">
<img src="https://img.shields.io/badge/platform-Mac-deepskyblue">
</a>
<a href="" style="pointer-events: stroke;" target="_blank">
<img src="https://img.shields.io/badge/platform-Linux-deepskyblue">
</a>
<a href="" style="pointer-events: stroke;" target="_blank">
<img src="https://img.shields.io/badge/platform-Windows-deepskyblue">
</a>
<a href=""><img src="https://app.codacy.com/project/badge/Grade/dc683c9cc61b499fa7cdbf54e4d9ff35"/></a>
<a href="https://github.com/Mindinventory/slider_controller/blob/master/LICENSE" style="pointer-events: stroke;" target="_blank">
<img src="https://img.shields.io/github/license/Mindinventory/slider_controller"></a>
<a href="https://pub.dev/packages/slider_controller"><img src="https://img.shields.io/pub/v/slider_controller?color=as&label=slider_controller&logo=as1&logoColor=blue&style=social"></a>
<a href="https://github.com/Mindinventory/slider_controller"><img src="https://img.shields.io/github/stars/Mindinventory/slider_controller?style=social" alt="MIT License"></a>

A package that gives us a slider controller a custom widget. This widget is used for easy customization for the slider widget.

## Key Features

* Ready to use custom slider widget.
* Easy customization for the slider widget.

# Preview

![slider_controller](https://github.com/Mindinventory/slider_controller/blob/master/assets/slider_controller.gif)

## Basic Usage

Import it to your project file

```dart
import 'package:slider_controller/slider_controller.dart';
```

And add it in its most basic form like it:

```dart
SliderController(
  value: 50.0,
  onChanged: (value) {
    print('slider value : $value');
  },
);
```

### Required parameters of SliderController
------------

| Parameter                      | Description                                                                            |
|--------------------------------|----------------------------------------------------------------------------------------|
| double value                   | Indicates the default slider thumb value between the 0.0 to 100.0                      |
| ValueChanged<double> onChanged | Called during a drag when the user is selecting a new value for the slider by dragging |

### Optional parameters of SliderController
------------

| Parameter                           | Default | Description                                                       |
|-------------------------------------|---------|-------------------------------------------------------------------|
| ValueChanged<double>? onChangeEnd   | -       | Called when the user is done selecting a new value for the slider |
| ValueChanged<double>? onChangeStart | -       | Called when the user starts selecting a new value for the slider  |
| double min                          | 0.0     | Indicates the Minimum value for the slider                        |
| double max                          | 100.0   | Indicates the Maximum value for the slider                        |
| SliderDecoration sliderDecoration   | --      | Used to Decorate the Slider Widget                                |
| bool isDraggable                    | true    | Used to Enable or Disable Drag Gesture of Slider                  |

### Optional parameters of SliderDecoration
------------

| Parameter           | Default         | Description                                                     |
|---------------------|-----------------|-----------------------------------------------------------------|
| Color inactiveColor | Colors.blueGrey | Defines the background color of the inactive part of the slider |
| Color activeColor   | Colors.blue     | Defines the background color of the active part of the slider   |
| Color thumbColor    | Colors.white    | Defines the thumb color of the slider                           |
| double borderRadius | 20.0            | Indicates the rounded border radius for the slider              |
| double height       | 50.0            | Indicates the height of the slider                              |
| bool isThumbVisible | true            | Indicates that slider thumb is visible or not                   |
| double thumbHeight  | 25.0            | Indicates the height of the slider thumb                        |
| double thumbWidth   | 5.0             | Indicates the width of the slider thumb                         |

### Guideline for contributors
------------

* Contribution towards our repository is always welcome, we request contributors to create a pull
  request for development.

### Guideline to report an issue/feature request
------------
It would be great for us if the reporter can share the below things to understand the root cause of
the issue.

* Library version
* Code snippet
* Logs if applicable
* Device specification like (Manufacturer, OS version, etc)
* Screenshot/video with steps to reproduce the issue
* Library used

LICENSE!
------------
**slider_controller**
is [MIT-licensed.](https://github.com/Mindinventory/slider_controller/blob/master/LICENSE)

Let us know!
------------
We’d be really happy if you send us links to your projects where you use our component. Just send an
email to sales@mindinventory.com And do let us know if you have any questions or suggestion
regarding our work.
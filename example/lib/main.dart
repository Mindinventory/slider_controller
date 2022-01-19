import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:slider_controller/slider_controller.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Slider Controller',
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFF0D1835),
        padding: const EdgeInsets.all(24.0),
        alignment: Alignment.center,
        child: SliderController(
          value: 100.0,
          onChanged: (value) {
            developer.log('Slider Value : $value');
          },
          min: 50.0,
          max: 150.0,
          sliderDecoration: SliderDecoration(
            inactiveColor: const Color(0xFF1A2942),
            activeColor: const Color(0xFF2BA1C3),
            thumbColor: const Color(0xFF1E7893),
            borderRadius: 20.0,
            height: 50.0,
            isThumbVisible: true,
            thumbHeight: 25.0,
            thumbWidth: 5.0,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class SpeedSlider extends StatelessWidget {
  final int speed;
  final ValueChanged<int> onSpeedChanged;

  const SpeedSlider({
    Key? key,
    required this.speed,
    required this.onSpeedChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slider(
      thumbColor: const Color.fromARGB(255, 23, 226, 223),
      activeColor: const Color.fromARGB(255, 23, 226, 223),
      value: speed.toDouble(),
      min: 100,
      max: 1000,
      divisions: 9,
      label: 'Speed: ${speed}ms',
      onChanged: (double value) {
        onSpeedChanged(value.toInt());
      },
    );
  }
}

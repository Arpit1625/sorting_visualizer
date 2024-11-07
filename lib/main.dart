import 'package:flutter/material.dart';
import 'screens/sort_visualizer_page.dart';

void main() {
  runApp(SortVisualizer());
}

class SortVisualizer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sort Visualizer',
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: SortVisualizerPage(),
    );
  }
}

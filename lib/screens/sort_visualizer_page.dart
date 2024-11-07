import 'dart:math';

import 'package:flutter/material.dart';
import '../models/sort_algorithms.dart';
import '../widgets/box_widget.dart';
import '../widgets/speed_slider.dart';
import '../widgets/sort_selector.dart';

class SortVisualizerPage extends StatefulWidget {
  @override
  _SortVisualizerPageState createState() => _SortVisualizerPageState();
}

class _SortVisualizerPageState extends State<SortVisualizerPage> {
  List<int> numbers = [];
  int arraySize = 10;
  int speed = 500;
  int highlightedIndex1 = -1;
  int highlightedIndex2 = -1;
  String selectedSort = 'Bubble Sort';

  @override
  void initState() {
    super.initState();
    _generateRandomArray();
  }

  void _generateRandomArray() {
    numbers = List.generate(arraySize, (_) => Random().nextInt(90) + 10);
    setState(() {});
  }

  Future<void> _sort() async {
    await SortAlgorithms.sort(numbers, selectedSort, speed, setState, highlight: _highlightIndices);
    setState(() {
      highlightedIndex1 = -1;
      highlightedIndex2 = -1;
    });
  }

  void _highlightIndices(int index1, int index2) {
    setState(() {
      highlightedIndex1 = index1;
      highlightedIndex2 = index2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sorting Visualizer',
        style: TextStyle(
          fontFamily: 'Roboto',
          fontWeight: FontWeight.bold,
           fontSize: 20,
           color: Color.fromARGB(255, 221, 92, 92),
        ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _generateRandomArray,
          ),
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 117, 15, 20),
      body: Column(
        children: [
          SizedBox(height: 20),
          SortSelector(
            selectedSort: selectedSort,
            onSortSelected: (sort) {
              setState(() => selectedSort = sort);
            },
          ),
          SpeedSlider(
            speed: speed,
            onSpeedChanged: (value) {
              setState(() {
                speed = value;
              });
            },
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  numbers.length,
                  (index) => BoxWidget(
                    number: numbers[index],
                    highlight: index == highlightedIndex1
                              ? const Color.fromARGB(255, 24, 220, 177)
                              : index == highlightedIndex2
                              ? const Color.fromARGB(255, 45, 165, 251)
                              : const Color.fromARGB(255, 75, 81, 83),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: _sort,
            child: Text('Start $selectedSort'),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class BoxWidget extends StatelessWidget {
  final int number;
  final Color highlight;

  const BoxWidget({
    Key? key,
    required this.number,
    required this.highlight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double boxSize = MediaQuery.of(context).size.width / 10 - 8;
    boxSize = boxSize.clamp(30.0, 60.0);

    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      margin: EdgeInsets.all(4),
      width: boxSize,
      height: boxSize,
      decoration: BoxDecoration(
        color: highlight,
        borderRadius: BorderRadius.circular(8),
      ),
      alignment: Alignment.center,
      child: Text(
        '$number',
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

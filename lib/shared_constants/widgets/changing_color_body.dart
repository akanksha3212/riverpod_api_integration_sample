import 'package:flutter/material.dart';

class ChangingColorBody extends StatefulWidget {
  const ChangingColorBody({Key? key, required this.child}) : super(key: key);
  final Widget child;
  @override
  State<ChangingColorBody> createState() => _ChangingColorBodyState();
}

class _ChangingColorBodyState extends State<ChangingColorBody> {
  List<Color> colorList = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow
  ];
  List<Alignment> alignmentList = [
    Alignment.bottomLeft,
    Alignment.bottomRight,
    Alignment.topRight,
    Alignment.topLeft,
  ];
  int index = 0;
  Color bottomColor = Colors.red;
  Color topColor = Colors.yellow;
  Alignment begin = Alignment.bottomLeft;
  Alignment end = Alignment.topRight;
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        bottomColor = Colors.blue;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        duration: const Duration(seconds: 2),
        onEnd: () {
          setState(() {
            index = index + 1;
            // animate the color
            bottomColor = colorList[index % colorList.length];
            topColor = colorList[(index + 1) % colorList.length];
          });
        },
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: begin, end: end, colors: [bottomColor, topColor])),
        child: widget.child);
  }
}

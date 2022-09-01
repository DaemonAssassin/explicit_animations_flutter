import 'dart:math';

import 'package:flutter/material.dart';

import '../utils/helper_widgets.dart';

class RotationWidget extends StatefulWidget {
  const RotationWidget({Key? key}) : super(key: key);

  @override
  State<RotationWidget> createState() => _RotationWidgetState();
}

class _RotationWidgetState extends State<RotationWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform.rotate(
              angle: _controller.value * (2 * pi),
              child: child,
            );
          },
          child: _buildContainer(),
        ),
        addVerticalSpace(30.0),
        buildButton(
          text: 'Show',
          onPressed: () {
            if (_controller.status == AnimationStatus.completed) {
              _controller.reverse();
            } else {
              _controller.forward();
            }
          },
        ),
      ],
    );
  }

  Widget _buildContainer() {
    print('called');
    return Container(
      width: 200.0,
      height: 200.0,
      color: Colors.purple,
    );
  }
}

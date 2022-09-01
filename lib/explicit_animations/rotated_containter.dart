import 'dart:math';
import 'package:flutter/material.dart';
import '../utils/helper_widgets.dart';

class RotatedContainer extends StatefulWidget {
  const RotatedContainer({Key? key}) : super(key: key);

  @override
  State<RotatedContainer> createState() => _RotatedContainerState();
}

class _RotatedContainerState extends State<RotatedContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _angleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    );
    _angleAnimation = Tween<double>(
      begin: 0,
      end: 2 * pi,
    ).animate(_controller);

    _controller.addListener(() {
      setState(() {});
    });
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
        Transform.rotate(
          angle: _angleAnimation.value,
          child: _buildContainer(),
        ),
        addVerticalSpace(30.0),
        buildButton(
          text: 'Rotate',
          onPressed: () {
            if (_controller.status == AnimationStatus.completed) {
              _controller.reverse();
            } else {
              _controller.forward();
            }
          },
        ),
        addVerticalSpace(30.0),
        buildButton(
          text: 'Stop Resume',
          onPressed: () {
            if (_controller.isAnimating) {
              _controller.stop();
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
      color: Colors.green,
    );
  }
}

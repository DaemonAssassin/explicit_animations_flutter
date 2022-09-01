import 'package:flutter/material.dart';
import '../utils/helper_widgets.dart';

class SizingContainer extends StatefulWidget {
  const SizingContainer({Key? key}) : super(key: key);

  @override
  State<SizingContainer> createState() => _SizingContainerState();
}

class _SizingContainerState extends State<SizingContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Size> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _animation = Tween<Size>(
      begin: const Size(100, 100),
      end: const Size(200.0, 200.0),
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
        _buildContainer(_animation.value),
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
        addVerticalSpace(30.0),
        buildButton(
          text: 'Reset',
          onPressed: () {
            _controller.reset();
          },
        ),
      ],
    );
  }

  Widget _buildContainer(Size size) {
    print('called');
    return Container(
      width: size.width,
      height: size.height,
      color: Colors.green,
    );
  }
}

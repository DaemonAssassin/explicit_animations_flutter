import 'package:flutter/material.dart';
import '../utils/helper_widgets.dart';

class TranslatedContainer extends StatefulWidget {
  const TranslatedContainer({Key? key}) : super(key: key);

  @override
  State<TranslatedContainer> createState() => _TranslatedContainerState();
}

class _TranslatedContainerState extends State<TranslatedContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    _animation = Tween<Offset>(
      begin: const Offset(-200, -200),
      end: const Offset(0.0, 0.0),
    ).animate(_controller);
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Transform.translate(
          offset: _animation.value,
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

  Widget _buildContainer() {
    print('called');
    return Container(
      width: 200.0,
      height: 200.0,
      color: Colors.green,
    );
  }
}

import 'package:flutter/material.dart';
import '../utils/helper_widgets.dart';

class TranslationWidget extends StatefulWidget {
  const TranslationWidget({Key? key}) : super(key: key);

  @override
  State<TranslationWidget> createState() => _TranslationWidgetState();
}

class _TranslationWidgetState extends State<TranslationWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);
    // _animation = Tween<Offset>(
    //   begin: const Offset(0.0, -200.0),
    //   end: const Offset(0.0, 0.0),
    // ).animate(_controller);
    _animation = Tween<Offset>(
      begin: const Offset(0.0, -200.0),
      end: const Offset(0.0, 0.0),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.bounceInOut,
      ),
    );
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
          animation: _animation,
          builder: (context, child) {
            return Transform.translate(
              offset: _animation.value,
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

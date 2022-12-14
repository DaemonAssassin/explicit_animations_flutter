import 'package:flutter/material.dart';
import '../utils/helper_widgets.dart';

class OpacityWidget extends StatefulWidget {
  const OpacityWidget({Key? key}) : super(key: key);

  @override
  State<OpacityWidget> createState() => _OpacityWidgetState();
}

class _OpacityWidgetState extends State<OpacityWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
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
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Opacity(
                  opacity: _animation.value,
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
        ),
      ),
      floatingActionButton: TweenAnimationBuilder<Offset>(
        tween: Tween<Offset>(
          begin: const Offset(0.0, -800.0),
          end: const Offset(0.0, 0.0),
        ),
        duration: const Duration(seconds: 2),
        builder: (context, value, child) {
          return Transform.translate(
            offset: value,
            child: child,
          );
        },
        curve: Curves.bounceOut,
        child: FloatingActionButton(
          onPressed: () {},
        ),
      ),
    );
  }

  Widget _buildContainer() {
    return Container(
      width: 200.0,
      height: 200.0,
      color: Colors.purple,
    );
  }
}

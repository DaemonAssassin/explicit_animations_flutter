import 'package:flutter/material.dart';
import '../utils/helper_widgets.dart';

class SizeWidget extends StatefulWidget {
  const SizeWidget({Key? key}) : super(key: key);

  @override
  State<SizeWidget> createState() => _SizeWidgetState();
}

class _SizeWidgetState extends State<SizeWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Size> _animation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);
    _animation = Tween<Size>(
      begin: const Size(50.0, 50.0),
      end: const Size(200.0, 200.0),
    ).animate(_controller);
    // _animation = Tween<Offset>(
    //   begin: const Offset(0.0, -200.0),
    //   end: const Offset(0.0, 0.0),
    // ).animate(
    //   CurvedAnimation(
    //     parent: _controller,
    //     curve: Curves.bounceInOut,
    //   ),
    // );
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
            return _buildContainer(_animation.value);
          },
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

  Widget _buildContainer(Size size) {
    print('called');
    return Container(
      width: size.width,
      height: size.height,
      color: Colors.purple,
    );
  }
}

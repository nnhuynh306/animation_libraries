import 'package:flutter/material.dart';

class GrowTransition extends StatelessWidget {
  const GrowTransition({required this.child, required this.animation, Key? key})
      : super(key: key);

  final Widget child;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          return SizedBox(
            height: animation.value,
            width: animation.value,
            child: child,
          );
        },
        child: child,
      ),
    );
  }
}

class AnimatedBuilderPage extends StatefulWidget {
  const AnimatedBuilderPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => AnimatedBuilderPageState();
}

class AnimatedBuilderPageState extends State<AnimatedBuilderPage> with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(duration: const Duration(seconds: 1,), vsync: this);
    _animation = Tween<double>(begin: 20, end: 300).animate(_controller);

    _animation.addStatusListener((status) {
      if (status == AnimationStatus.dismissed) {
        _controller.forward();
      } else if (status == AnimationStatus.completed) {
        _controller.reverse();
      }
    });

    _controller.forward();

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AnimatedBuilder"),
      ),
      body: SafeArea(
        child: Center(
          child: GrowTransition(animation: _animation, child: const FlutterLogo(),),
        ),
      ),
    );
  }
}
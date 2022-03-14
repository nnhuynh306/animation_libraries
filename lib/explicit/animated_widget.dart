import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimatedImage extends AnimatedWidget {
  const AnimatedImage({Key? key, required Animation<double> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;

    return Container(
      width: animation.value,
      height: animation.value,
      child: const FlutterLogo(),
    );
  }
}

class AnimatedWidgetPage extends StatefulWidget {
  const AnimatedWidgetPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => AnimatedWidgetPageState();
}

class AnimatedWidgetPageState extends State<AnimatedWidgetPage> with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(duration: const Duration(seconds: 1,), vsync: this);
    _animation = Tween<double>(begin: 20, end: 300).animate(_controller);

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
        title: Text("AnimatedWidget"),
      ),
      body: SafeArea(
        child: Center(
          child: AnimatedImage(animation: _animation,),
        ),
      ),
    );
  }
}
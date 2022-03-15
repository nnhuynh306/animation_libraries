import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimatedImage extends StatefulWidget {
  const AnimatedImage({Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => AnimatedImageState();
}

class AnimatedImageState extends State<AnimatedImage> with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(duration: const Duration(seconds: 1,), vsync: this);
    _animation = Tween<double>(begin: 20, end: 300).animate(_controller)
      ..addListener(() {
      setState(() {

      });
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
    return Container(
      width: _animation.value,
      height: _animation.value,
      child: const FlutterLogo(),
    );
  }

}

class RenderAnimationPage extends StatelessWidget {
  const RenderAnimationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rendering Animation"),
      ),
      body: SafeArea(
        child: Center(
          child: AnimatedImage(),
        ),
      ),
    );
  }

}

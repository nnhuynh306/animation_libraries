import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimatedImage extends AnimatedWidget {
  late final Animation<double> _opacityAnimation;
  late final Animation<double> _sizeAnimation;

  AnimatedImage({Key? key, required Animation<double> animation})
      : super(key: key, listenable: animation) {
    _opacityAnimation = Tween<double>(begin: 0.1, end: 1).animate(animation);
    _sizeAnimation = Tween<double>(begin: 0, end: 300).animate(animation);
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: _opacityAnimation.value,
      child:  Container(
        width: _sizeAnimation.value,
        height: _sizeAnimation.value,
        child: const FlutterLogo(),
      ),
    );
  }
}

class AnimatedImage2 extends AnimatedWidget {

  static final _opacityTween = Tween<double>(begin: 0.1, end: 1);
  static final _sizeTween = Tween<double>(begin: 0, end: 300);

  const AnimatedImage2({Key? key, required Animation<double> animation})
  : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;

    return Opacity(
      opacity: _opacityTween.evaluate(animation),
      child: Container(
        width: _sizeTween.evaluate(animation),
        height: _sizeTween.evaluate(animation),
        child: const FlutterLogo(),
      ),
    );
  }
}

class SimultaneousAnimationPage extends StatefulWidget {
  const SimultaneousAnimationPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => SimultaneousAnimationPageState();
}

class SimultaneousAnimationPageState extends State<SimultaneousAnimationPage> with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(duration: const Duration(seconds: 2,), vsync: this);
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn)
      ..addStatusListener((status) {
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
        title: Text("Simultaneous Animation"),
      ),
      body: SafeArea(
        child: Center(
          child: AnimatedImage(animation: _animation,),
        ),
      ),
    );
  }
}
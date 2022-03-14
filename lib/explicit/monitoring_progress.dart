import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'animated_widget.dart';

class MonitoringProgressPage extends StatefulWidget {
  const MonitoringProgressPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MonitoringProgressPageState();
}

class MonitoringProgressPageState extends State<MonitoringProgressPage> with SingleTickerProviderStateMixin {

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
    print("build Monitoring");
    return Scaffold(
      appBar: AppBar(
        title: Text("Monitoring Animation Progress"),
      ),
      body: SafeArea(
        child: Center(
          child: AnimatedImage(animation: _animation,),
        ),
      ),
    );
  }
}
import 'package:animation_libraries/hero/heroRadial.dart';
import 'package:animation_libraries/hero/heroStandard.dart';
import 'package:flutter/material.dart';

class HeroDemoWidget extends StatefulWidget {
  const HeroDemoWidget({Key? key}) : super(key: key);

  @override
  State<HeroDemoWidget> createState() => _HeroDemoWidget();
}

class _HeroDemoWidget extends State<HeroDemoWidget> {
  List<String> button = ["Standard Hero", "Radial Hero"];

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Hero Demo"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const StandardHero()));
                },
                child: Text(button[0])),
            ElevatedButton(onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const RadialHero()));
            }, child: Text(button[1])),
          ],
        ),
      ),
    ));
  }
}

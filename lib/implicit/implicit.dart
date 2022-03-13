import 'package:animation_libraries/implicit/implicitChild.dart';
import 'package:flutter/material.dart';

class ImplicitDemoWidget extends StatefulWidget {
  const ImplicitDemoWidget({Key? key}) : super(key: key);

  @override
  State<ImplicitDemoWidget> createState() => _ImplicitDemoWidget();
}

class _ImplicitDemoWidget extends State<ImplicitDemoWidget> {
  List<String> button = [
    "TweenAnimationBuilder",
    "AnimatedAlign",
    "AnimatedContainer",
    "AnimatedDefaultTextStyle",
    "AnimatedScale",
    "AnimatedRotation",
    "AnimatedSlide",
    "AnimatedOpacity",
    "AnimatedPadding",
    "AnimatedPhysicalModel",
    "AnimatedPositioned",
    "AnimatedPositionedDirectional",
    "AnimatedTheme",
    "AnimatedCrossFade",
    "AnimatedSize",
    "AnimatedSwitcher"
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Flutter Implicit Demo"),
          backgroundColor: Colors.blue,
        ),
        body: Container(
            padding: const EdgeInsets.all(12.0),
            child: GridView.builder(
              itemCount: button.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 4.0,
                  mainAxisSpacing: 4.0
              ),
              itemBuilder: (BuildContext context, int index){
                return ElevatedButton(
                  child: Text(button[index]),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ImplicitChild(childName: button[index])));
                  },
                  style: TextButton.styleFrom(
                    //backgroundColor: Colors.white, // background
                    primary: Colors.white, // foreground
                  ),
                );
              },
            )),
      ),
    );
  }
}

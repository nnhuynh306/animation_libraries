import 'package:animation_libraries/hero/hero.dart';
import 'package:animation_libraries/implicit/implicit.dart';
import 'package:animation_libraries/staggered/staggered.dart';
import 'package:animation_libraries/staggered/staggered_demo.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              style: TextButton.styleFrom(
                //backgroundColor: Colors.white, // background
                primary: Colors.white, // foreground
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ImplicitDemoWidget()));
              },
              child: const Text("Implicit animation demo"),
            ),
            ElevatedButton(
              style: TextButton.styleFrom(
                //backgroundColor: Colors.white, // background
                primary: Colors.white, // foreground
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HeroDemoWidget()));
              },
              child: const Text("Hero animation demo"),
            ),
            ElevatedButton(
              style: TextButton.styleFrom(
                //backgroundColor: Colors.white, // background
                primary: Colors.white, // foreground
              ),
              onPressed: () {
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const StaggeredAnimationDemo()));
              },
              child: const Text("Staggered animation demo"),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

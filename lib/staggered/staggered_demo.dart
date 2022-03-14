import 'package:animation_libraries/staggered/staggered.dart';
import 'package:flutter/material.dart';


class StaggeredAnimationDemo extends StatelessWidget {
  const StaggeredAnimationDemo({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Staggered Aniamtion'),
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
                MaterialPageRoute(builder: (context) => const StaggerDemo()));
              },
              child: const Text("Staggered animation demo"),
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:animation_libraries/explicit/animated_builder.dart';
import 'package:animation_libraries/explicit/animated_widget.dart';
import 'package:animation_libraries/explicit/monitoring_progress.dart';
import 'package:animation_libraries/explicit/render_animation.dart';
import 'package:animation_libraries/explicit/simultaneous_animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ExplicitDemoWidget extends StatelessWidget {
  const ExplicitDemoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Explicit Animations Demo"),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 12),
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => const RenderAnimationPage()
              ));
            },
            child: Text("Rendering Animation"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => const AnimatedWidgetPage()
              ));
            },
            child: Text("AnimatedWidget demo"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => const MonitoringProgressPage()
              ));
            },
            child: Text("Monitoring progress"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => const AnimatedBuilderPage()
              ));
            },
            child: Text("Animated Builder Demo"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => const SimultaneousAnimationPage()
              ));
            },
            child: Text("Simultaneous Animation"),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'heroStandard.dart';

class RadialHero extends StatelessWidget {
  const RadialHero({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Radial Hero Animation'),
      ),
      body: Center(
        child: RadialExpansion(
          child: IconHero(
            tag: 'demo',
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute<void>(builder: (BuildContext context) {
                return Scaffold(
                  appBar: AppBar(
                    title: const Text('Flippers Page'),
                  ),
                  body: Container(
                    // The blue background emphasizes that it's a new route.
                    color: Colors.white,
                    padding: const EdgeInsets.all(16.0),
                    alignment: Alignment.topLeft,
                    child: IconHero(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      tag: 'demo',
                    ),
                  ),
                );
              }));
            },
          ),
          maxRadius: 30,
        ),
      ),
    );
  }
}

class RadialExpansion extends StatelessWidget {
  const RadialExpansion({
    Key? key,
    required this.maxRadius,
    required this.child,
  })  : clipRectSize = 2.0 * (maxRadius / math.sqrt2),
        super(key: key);

  final double maxRadius;
  final clipRectSize;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Center(
        child: SizedBox(
          width: clipRectSize,
          height: clipRectSize,
          child: ClipRect(
            child: child, // Photo
          ),
        ),
      ),
    );
  }
}

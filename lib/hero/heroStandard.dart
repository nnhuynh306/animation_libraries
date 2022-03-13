import 'package:flutter/material.dart';

class StandardHero extends StatelessWidget {
  const StandardHero({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basic Hero Animation'),
      ),
      body: Center(
        child: IconHero(
          tag: 'demo',
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute<void>(builder: (BuildContext context) {
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
      ),
    );
  }
}

class IconHero extends StatelessWidget {
  const IconHero({
    Key? key,
    required this.onTap,
    required this.tag,
  }) : super(key: key);

  final VoidCallback onTap;
  final String tag;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Hero(
        tag: tag,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: const FlutterLogo(size: 100,),
          ),
        ),
      ),
    );
  }
}

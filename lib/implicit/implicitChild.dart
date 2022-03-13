import 'package:flutter/material.dart';

class ImplicitChild extends StatefulWidget {
  final String childName;

  const ImplicitChild({Key? key, required this.childName}) : super(key: key);

  @override
  State<ImplicitChild> createState() => _ImplicitChild();
}

class _ImplicitChild extends State<ImplicitChild> {
  double targetValue = 24.0;
  bool selected = false;
  bool _first = true;
  double _fontSize = 60;
  Color _color = Colors.blue;
  double scale = 1.0;
  double turns = 0.0;
  Offset offset = Offset.zero;
  double opacityLevel = 1.0;
  double padValue = 0.0;
  double _size = 50.0;
  bool _large = false;
  int _count = 0;

  void _slideUp() {
    setState(() => offset -= const Offset(0, 1));
  }

  void _slideDown() {
    setState(() => offset += const Offset(0, 1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.childName),
      ),
      body: Center(
        child: widgetChild(widget.childName),
      ),
    );
  }

  widgetChild(String childName) {
    switch (childName) {
      case "TweenAnimationBuilder":
        {
          return TweenAnimationBuilder<double>(
            tween: Tween<double>(begin: 0, end: targetValue),
            duration: const Duration(seconds: 1),
            builder: (BuildContext context, double size, Widget? child) {
              return IconButton(
                iconSize: size,
                color: Colors.blue,
                icon: child!,
                onPressed: () {
                  setState(() {
                    targetValue = targetValue == 24.0 ? 48.0 : 24.0;
                  });
                },
              );
            },
            child: const Icon(Icons.aspect_ratio),
          );
        }
      case "AnimatedAlign":
        {
          return GestureDetector(
            onTap: () {
              setState(() {
                selected = !selected;
              });
            },
            child: Center(
              child: Container(
                width: 250.0,
                height: 250.0,
                color: Colors.red,
                child: AnimatedAlign(
                  alignment:
                  selected ? Alignment.topRight : Alignment.bottomLeft,
                  duration: const Duration(seconds: 1),
                  curve: Curves.fastOutSlowIn,
                  child: const FlutterLogo(size: 50.0),
                ),
              ),
            ),
          );
        }
      case "AnimatedContainer":
        {
          return GestureDetector(
              onTap: () {
                setState(() {
                  selected = !selected;
                });
              },
              child: AnimatedContainer(
                width: selected ? 200.0 : 100.0,
                height: selected ? 100.0 : 200.0,
                color: selected ? Colors.red : Colors.blue,
                alignment: selected
                    ? Alignment.center
                    : AlignmentDirectional.topCenter,
                duration: const Duration(seconds: 2),
                curve: Curves.fastOutSlowIn,
                child: const FlutterLogo(size: 75),
              ));
        }
      case "AnimatedDefaultTextStyle":
        {
          return GestureDetector(
            onTap: () {
              setState(() {
                _fontSize = _first ? 90 : 60;
                _color = _first ? Colors.blue : Colors.red;
                _first = !_first;
              });
            },
            child: AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 300),
              style: TextStyle(
                fontSize: _fontSize,
                color: _color,
                fontWeight: FontWeight.bold,
              ),
              child: const Text('Flutter'),
            ),
          );
        }
      case "AnimatedScale":
        {
          return GestureDetector(
            onTap: () {
              setState(() {
                scale = scale == 1.0 ? 3.0 : 1.0;
              });
            },
            child: AnimatedScale(
              scale: scale,
              duration: const Duration(seconds: 2),
              child: const FlutterLogo(),
            ),
          );
        }
      case "AnimatedRotation":
        {
          return GestureDetector(
            onTap: () {
              setState(() {
                turns += 1.0 / 8.0;
              });
            },
            child: AnimatedRotation(
              turns: turns,
              duration: const Duration(seconds: 1),
              child: const FlutterLogo(),
            ),
          );
        }
      case "AnimatedSlide":
        {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ElevatedButton(
                onPressed: _slideUp,
                child: const Text('Slide up'),
              ),
              ElevatedButton(
                onPressed: _slideDown,
                child: const Text('Slide down'),
              ),
              Padding(
                padding: const EdgeInsets.all(50),
                child: AnimatedSlide(
                  offset: offset,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                  child: const FlutterLogo(),
                ),
              ),
            ],
          );
        }
      case "AnimatedOpacity":
        {
          return GestureDetector(
            onTap: () {
              setState(() {
                opacityLevel = opacityLevel == 0 ? 1.0 : 0.0;
              });
            },
            child: AnimatedOpacity(
              opacity: opacityLevel,
              duration: const Duration(seconds: 3),
              child: const FlutterLogo(),
            ),
          );
        }
      case "AnimatedPadding":
        {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              AnimatedPadding(
                padding: EdgeInsets.all(padValue),
                duration: const Duration(seconds: 2),
                curve: Curves.easeInOut,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 5,
                  color: Colors.blue,
                ),
              ),
              Text('Padding: $padValue'),
              ElevatedButton(
                  child: const Text('Change padding'),
                  onPressed: () {
                    setState(() {
                      padValue = padValue == 0.0 ? 100.0 : 0.0;
                    });
                  }),
            ],
          );
        }
      case "AnimatedPhysicalModel":
        {
          return GestureDetector(
            onTap: () {
              setState(() {
                _first = !_first;
              });
            },
            child: AnimatedPhysicalModel(
              duration: const Duration(milliseconds: 500),
              curve: Curves.fastOutSlowIn,
              elevation: _first ? 0 : 6.0,
              shape: BoxShape.rectangle,
              shadowColor: Colors.black,
              color: Colors.white,
              borderRadius: _first
                  ? const BorderRadius.all(Radius.circular(0))
                  : const BorderRadius.all(Radius.circular(10)),
              child: Container(
                height: 120.0,
                width: 120.0,
                color: Colors.blue[50],
                child: const FlutterLogo(
                  size: 60,
                ),
              ),
            ),
          );
        }
      case "AnimatedPositioned":
        {
          return SizedBox(
            width: 200,
            height: 350,
            child: Stack(
              children: <Widget>[
                AnimatedPositioned(
                  width: selected ? 200.0 : 50.0,
                  height: selected ? 50.0 : 200.0,
                  top: selected ? 50.0 : 150.0,
                  duration: const Duration(seconds: 2),
                  curve: Curves.fastOutSlowIn,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selected = !selected;
                      });
                    },
                    child: Container(
                      color: Colors.blue,
                      child: const Center(child: Text('Tap me')),
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      case "AnimatedTheme":
        {
          return GestureDetector(
              onTap: () {
                setState(() {
                  _first = !_first;
                });
              },
              child: AnimatedTheme(
                data: _first? ThemeData.dark():ThemeData.light(),
                child: const Text("Button")

              )
          );
        }
      case "AnimatedCrossFade":
        {
          return GestureDetector(
              onTap: () {
                setState(() {
                  _first = !_first;
                });
              },
              child: AnimatedCrossFade(
                duration: const Duration(seconds: 3),
                firstChild: const FlutterLogo(style: FlutterLogoStyle.horizontal, size: 100.0),
                secondChild: const FlutterLogo(style: FlutterLogoStyle.stacked, size: 100.0),
                crossFadeState: _first ? CrossFadeState.showFirst : CrossFadeState.showSecond,
              )
          );
        }
      case "AnimatedSize":
        {
          return GestureDetector(
              onTap: () {
                setState(() {
                  _size = _large ? 250.0 : 100.0;
                  _large = !_large;
                });
              },
              child: Container(
                color: Colors.amberAccent,
                child: AnimatedSize(
                  curve: Curves.easeIn,
                  duration: const Duration(seconds: 1),
                  child: FlutterLogo(size: _size),
                ),
              ),
          );
        }
      case "AnimatedSwitcher":
        {
          return GestureDetector(
              onTap: () {
                setState(() {
                  _count++;
                });
              },
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return ScaleTransition(scale: animation, child: child);
                },
                child: Text(
                  '$_count',
                  // This key causes the AnimatedSwitcher to interpret this as a "new"
                  // child each time the count changes, so that it will begin its animation
                  // when the count changes.
                  key: ValueKey<int>(_count),
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
          );
        }
    }
  }
}

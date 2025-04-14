import 'package:flutter/material.dart';

void main() {
  runApp(ColorChangerApp());
}

class ColorChangerApp extends StatelessWidget {
  const ColorChangerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ColorChangerScreen(),
    );
  }
}

class ColorChangerScreen extends StatefulWidget {
  const ColorChangerScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ColorChangerScreenState createState() => _ColorChangerScreenState();
}

class _ColorChangerScreenState extends State<ColorChangerScreen> {
  int colorIndex = 0;
  int alignmentIndex = 0;

  final List<Map<String, dynamic>> colorSchemes = [
    {
      "colors": [
        Color.fromRGBO(69, 130, 41, 1),
        Colors.white,
        Color.fromRGBO(69, 130, 41, 1),
      ],
      "name": "Green",
    },
    {
      "colors": [
        Color.fromRGBO(33, 180, 246, 1),
        Colors.white,
        Color.fromRGBO(33, 180, 246, 1),
      ],
      "name": "Blue",
    },
    {
      "colors": [
        Color.fromRGBO(206, 10, 50, 1),
        Colors.white,
        Color.fromRGBO(206, 10, 50, 1),
      ],
      "name": "Red",
    },
  ];

  final List<List<Alignment>> gradientAlignments = [
    [Alignment.topCenter, Alignment.bottomCenter],
    [Alignment.topRight, Alignment.bottomLeft],
    [Alignment.centerRight, Alignment.centerLeft],
    [Alignment.topLeft, Alignment.bottomRight],
  ];

  void _changeColor() {
    setState(() {
      colorIndex = (colorIndex + 1) % colorSchemes.length;
    });
  }

  void _changeDirection() {
    setState(() {
      alignmentIndex = (alignmentIndex + 1) % gradientAlignments.length;
    });
  }

  String _getDirection() {
    switch (alignmentIndex) {
      case 0:
        return "Horizontal";
      case 1:
        return "right-left";
      case 2:
        return "vertical";
      case 3:
        return "left-right";
      default:
        return "Unknown";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: Duration(milliseconds: 420),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: gradientAlignments[alignmentIndex][0],
            end: gradientAlignments[alignmentIndex][1],
            colors: colorSchemes[colorIndex]["colors"],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: _changeColor,
                child: Text("Change Color"),
              ),
              SizedBox(height: 10),
              Text(
                "Red: ${colorSchemes[colorIndex]["colors"][0].red} "
                "Green: ${colorSchemes[colorIndex]["colors"][0].green} "
                "Blue: ${colorSchemes[colorIndex]["colors"][0].blue}",
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _changeDirection,
                child: Text("Change Direction"),
              ),
              SizedBox(height: 10),
              Text("Direction: ${_getDirection()}"),
            ],
          ),
        ),
      ),
    );
  }
}


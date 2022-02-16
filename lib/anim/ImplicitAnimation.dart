import 'dart:math';

import 'package:flutter/material.dart';

// const owl_url =
//     'https://raw.githubusercontent.com/flutter/website/master/src/images/owl.jpg';
//
// class FadeInDemo extends StatefulWidget {
//   _FadeInDemoState createState() => _FadeInDemoState();
// }
//
// class _FadeInDemoState extends State<FadeInDemo> {
//   double opacityLevel = 0.0;
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Image.network(owl_url),
//         TextButton(
//           onPressed: () => setState(
//             () {
//               opacityLevel = 1.0;
//             },
//           ),
//           child: const Text(
//             'Show details',
//             style: TextStyle(color: Colors.blueAccent),
//           ),
//         ),
//         AnimatedOpacity(
//           opacity: opacityLevel,
//           duration: const Duration(seconds: 3),
//           child: Column(
//             children: const [
//               Text('Type: Owl'),
//               Text('Age: 39'),
//               Text('Employment: None'),
//             ],
//           ),
//         )
//       ],
//     );
//   }
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         body: Center(
//           child: FadeInDemo(),
//         ),
//       ),
//     );
//   }
// }
//
// void main() {
//   runApp(
//     MyApp(),
//   );
// }

/// ******************************************************/

const _duration = Duration(milliseconds: 400);

double randomBorderRadius() {
  return Random().nextDouble() * 64;
}

double randomMargin() {
  return Random().nextDouble() * 64;
}

Color randomColor() {
  return Color(0xFFFFFFFF & Random().nextInt(0xFFFFFFFF));
}

class AnimatedContainerDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AnimatedContainerDemo();
  }
}

class _AnimatedContainerDemo extends State<AnimatedContainerDemo> {
  late Color color;
  late double borderRadius;
  late double margin;

  @override
  void initState() {
    super.initState();
    color = Colors.deepPurple;
    borderRadius = randomBorderRadius();
    margin = randomMargin();
  }

  void change() {
    setState(() {
      color = randomColor();
      borderRadius = randomBorderRadius();
      margin = randomMargin();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              width: 128,
              height: 128,
              child: AnimatedContainer(
                margin: EdgeInsets.all(margin),
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
                duration: _duration,
                curve: Curves.easeInOutBack,
              ),
            ),
            ElevatedButton(
              onPressed: () => change(),
              child: const Text('Change'),
            ),
          ],
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedContainerDemo(),
    );
  }
}

void main() {
  runApp(
    MyApp(),
  );
}

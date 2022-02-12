import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

void main() {
  runApp(const HomeApp());
}

class HomeApp extends StatelessWidget {
  const HomeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Material(
          child: Align(
            alignment: Alignment.topLeft,
            child: Column(
              children: const [
                SizedBox(
                  height: 50,
                ),
                TextWidget(),
                ImageWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TextWidget extends StatefulWidget {
  const TextWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TextWidgetState();
  }
}

class _TextWidgetState extends State<TextWidget> {
  var value = '';

  Future<String> loadAsset() async {
    return await rootBundle.loadString('assets/test.json');
  }

  @override
  void initState() {
    loadAsset()
        .then((value) => {
              setState(() {
                this.value = value;
              })
            })
        .whenComplete(() => {});

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Text(value);
  }
}

class ImageWidget extends StatelessWidget {
  const ImageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Image(
      image: AssetImage('images/lake.jpg'),
      width: 100,
      height: 100,
      fit: BoxFit.contain,
    );
  }
}

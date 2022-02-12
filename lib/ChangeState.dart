import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: const [
            SizedBox(
              width: double.infinity,
              height: 50,
            ),
            ParentWidget(),
          ],
        ),
      ),
    );
  }
}

class ParentWidget extends StatefulWidget {
  const ParentWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ParentWidgetState();
  }
}

class _ParentWidgetState extends State<ParentWidget> {
  var isChecked = false;
  var count = 0;

  void _check(bool value) {
    setState(() {
      isChecked = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(isChecked ? '选中' : '未选中'),
        CheckboxWidget(onChanged: (bool value) {
          _check(value);
        }),
      ],
    );
  }
}

class CheckboxWidget extends StatefulWidget {
  const CheckboxWidget({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  final ValueChanged<bool> onChanged;

  @override
  State<StatefulWidget> createState() {
    return _CheckboxWidgetState();
  }
}

class _CheckboxWidgetState extends State<CheckboxWidget> {
  var isChecked = false;

  void _handleTap() {
    widget.onChanged(isChecked);
  }

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.red;
    }

    return Checkbox(
        checkColor: Colors.white,
        fillColor: MaterialStateProperty.resolveWith(getColor),
        value: isChecked,
        onChanged: (bool? value) {
          setState(() {
            isChecked = value!;

            _handleTap();
          });
        });
  }
}

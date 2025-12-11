import 'package:flutter/material.dart';

class HmHot extends StatefulWidget {
  const HmHot({super.key});

  @override
  State<HmHot> createState() => _HmHotState();
}

class _HmHotState extends State<HmHot> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        color: Colors.blue,
        alignment: Alignment.center,
        height: 200,
        child: Text('HmHot', style: TextStyle(color: Colors.white)),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class FlutterDashIcon extends StatelessWidget {
  const FlutterDashIcon({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: const Color.fromRGBO(234, 236, 249, 1),
        ),
        borderRadius: BorderRadius.circular(50),
      ),
      child: const Padding(
        padding: EdgeInsets.all(10),
        child: Icon(
          Icons.flutter_dash,
          color: Color.fromRGBO(67, 112, 242, 1),
        ),
      ),
    );
  }
}

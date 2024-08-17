import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ping_single_column_coming_soon_page/components/flutter_dash_icon.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool _isShowingInvalidEmailAddress = false;
  final _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SvgPicture.asset("assets/images/Logo.svg"),
            const SizedBox(height: 30),
            RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(
                style: TextStyle(
                  fontSize: 24,
                  color: Color.fromRGBO(49, 54, 60, 1),
                ),
                children: [
                  TextSpan(text: "We are launching "),
                  TextSpan(
                    text: "soon!",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              "Subscribe and get notified",
              style: TextStyle(
                color: Color.fromRGBO(92, 94, 97, 1),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: _isShowingInvalidEmailAddress
                      ? const Color.fromRGBO(242, 127, 140, 1)
                      : const Color.fromRGBO(195, 208, 246, 1),
                ),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                child: TextField(
                  controller: _textEditingController,
                  decoration: const InputDecoration(
                    hintText: "Your email address…",
                    hintStyle: TextStyle(
                      color: Color.fromRGBO(207, 214, 234, 1),
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            if (_isShowingInvalidEmailAddress)
              const Text(
                "Please provide a valid email address",
                style: TextStyle(
                  color: Color.fromRGBO(242, 127, 140, 1),
                  fontStyle: FontStyle.italic,
                  fontSize: 12,
                ),
                textAlign: TextAlign.center,
              ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _onTapNotifyMe,
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(16),
                  elevation: 10,
                  backgroundColor: const Color.fromRGBO(67, 112, 242, 1),
                  foregroundColor: Colors.white,
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                  )),
              child: const Text("Notify Me"),
            ),
            const SizedBox(height: 50),
            Image.asset("assets/images/Dashboard.png"),
            const SizedBox(height: 80),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: FlutterDashIcon(),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: FlutterDashIcon(),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: FlutterDashIcon(),
                ),
              ],
            ),
            const SizedBox(height: 15),
            const Text(
              "© Copyright Ping. All rights reserved.",
              style: TextStyle(
                color: Color.fromRGBO(170, 170, 170, 1),
                fontSize: 12,
              ),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  void _onTapNotifyMe() {
    final emailRegExp = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (!emailRegExp.hasMatch(_textEditingController.text)) {
      setState(() {
        _isShowingInvalidEmailAddress = true;
      });
    } else {
      setState(() {
        _isShowingInvalidEmailAddress = false;
      });
    }
  }
}

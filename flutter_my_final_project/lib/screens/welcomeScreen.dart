import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_my_final_project/theme.dart';

class WelcomScreen extends StatelessWidget {
  const WelcomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/icon.png",
              width: 100,
            ),
            Container(
              child: Text(
                "start and save your mediciations",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: Text(
                'make sure you do not miss your meds !',
                style: TextStyle(color: primaryColor, fontSize: 16),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 50),
              child: Column(
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: primaryColor,
                        fixedSize: Size.fromWidth(300)),
                    onPressed: () {},
                    child: Text("sign up",
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center),
                  ),
                  OutlinedButton(
                    style: TextButton.styleFrom(
                        fixedSize: Size.fromWidth(300),
                        side: BorderSide(width: 1.0, color: primaryColor)),
                    onPressed: () {},
                    child: Text("login",
                        style: TextStyle(color: primaryColor),
                        textAlign: TextAlign.center),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:my_app/views/pages/login_page.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // HeroWidget(title: widget.title),
                Lottie.asset('assets/lotties/lottie_home.json', height: 400.0),
                SizedBox(height: 30),
                Text("Flutter Mapp is the way to learn FLutter!"),
                FilledButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return LoginPage(title: "Register");
                        },
                      ),
                    );
                  },
                  style: FilledButton.styleFrom(
                    minimumSize: Size(double.infinity, 50.0),
                  ),
                  child: Text("Next"),
                ),
                SizedBox(height: 80),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

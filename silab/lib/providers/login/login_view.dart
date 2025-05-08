import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:silab/config/primary_colors.dart';
import 'package:silab/providers/auth_provider.dart';
import 'package:silab/providers/login/login_form.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PrimaryColors.teal,
      body: LayoutBuilder(
        builder: (context, constraints) {
          double screenWidth = constraints.maxWidth;
          double paddingHorizontal = screenWidth * 0.08; // Responsif padding
          return Column(
            children: [
              Expanded(
                flex: 4,
                child: Center(
                  child: Image.asset('assets/logo.png', width: screenWidth * 0.45),
                ),
              ),
              Expanded(
                flex: 8,
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: paddingHorizontal, vertical: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: LoginForm()
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
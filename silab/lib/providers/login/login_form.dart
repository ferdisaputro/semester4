import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:silab/providers/auth_provider.dart';
import 'package:silab/services/login_service.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => LoginFormState();
}

class LoginFormState extends State<LoginForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? _errorMessage; // Variable to store the error message

  Future login(BuildContext context) async {
    setState(() {
      _errorMessage = null; // Clear previous error message
    });

    if (_emailController.text.isNotEmpty || _passwordController.text.isNotEmpty) {
      dynamic result = await LoginService().login(_emailController.text, _passwordController.text);
      if (result['status'] == 401) {
        // If login fails, set the error message
        setState(() {
          _errorMessage = "Invalid username or password.";
        });
      } else {
        context.read<AuthProvider>().login(result);
      }
    } else {
      setState(() {
        _errorMessage = "Email atau Password Kosong";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Image.asset(
            'assets/silab.png',
            width: double.infinity,
          ),
        ),
        SizedBox(height: 30),
        _buildInputField("Email", "", controller: _emailController),
        SizedBox(height: 15),
        _buildInputField("Password", "", isPassword: true, controller: _passwordController),
        SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Checkbox(value: false, onChanged: (value) {}),
            Text(
              "Remember me",
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                color: Colors.grey[800],
              ),
            ),
          ],
        ),
        if (_errorMessage != null) // Display error message if it exists
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              _errorMessage!,
              style: TextStyle(color: Colors.red, fontSize: 16),
            ),
          ),
        SizedBox(height: 40),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
            minimumSize: Size(double.infinity, 60),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          onPressed: () {
            login(context);
          },
          child: Text(
            'Login',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              fontFamily: 'Poppins',
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildInputField(String label, String hint, {bool isPassword = false, TextEditingController? controller}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.grey[800]),
        ),
        SizedBox(height: 5),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade400),
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextField(
            obscureText: isPassword,
            controller: controller,
            decoration: InputDecoration(
              hintText: hint,
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
            ),
          ),
        ),
      ],
    );
  }
}
import 'package:chat_app_tut/services/auth/auth_services.dart';
import 'package:chat_app_tut/services/auth/login_or_register.dart';
import 'package:chat_app_tut/componenets/my_button.dart';
import 'package:chat_app_tut/componenets/my_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final authServices = AuthServices();
  final void Function()? onTap;

  RegisterPage({super.key, required this.onTap});

  void register(BuildContext context) async {
    try {
      final email = _emailController.text;
      final password = _passwordController.text;
      if (_passwordController.text == _confirmPasswordController.text) {
        await authServices.signUpWithEmailPassword(email, password);
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Signed Up Successfully")));
      } else {
        showDialog(
            context: context,
            builder: (context) => const AlertDialog(
                  title: Text("Passwords Not Matching!"),
                ));
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Error: ${e}")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // logo
            SvgPicture.asset(
              'lib/images/logoo.svg',
              height: 200,
              width: 200,
            ),

            const SizedBox(
              height: 45,
            ),
            Text(
              "Let's create an account for you!",
              style: TextStyle(
                  fontSize: 16, color: Theme.of(context).colorScheme.primary),
            ),

            const SizedBox(
              height: 25,
            ),
            MyTextField(
              hintText: "Email",
              obsText: false,
              controller: _emailController,
            ),
            const SizedBox(
              height: 10,
            ),
            MyTextField(
              hintText: "Password",
              obsText: true,
              controller: _passwordController,
            ),
            const SizedBox(
              height: 10,
            ),
            MyTextField(
              hintText: "Confirm Password",
              obsText: true,
              controller: _confirmPasswordController,
            ),

            const SizedBox(
              height: 20,
            ),

            MyButton(
              ButtonText: "Register",
              onTap: () => register(context),
            ),

            const SizedBox(
              height: 25,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?",
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    " Login here",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary),
                  ),
                ),
              ],
            ),

            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

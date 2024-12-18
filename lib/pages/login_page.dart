import 'package:chat_app_tut/services/auth/auth_services.dart';
import 'package:chat_app_tut/componenets/my_button.dart';
import 'package:chat_app_tut/componenets/my_text_field.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatelessWidget {
  final supabase = SupabaseClient;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final void Function()? onTap;
  final authServices = AuthServices();
  LoginPage({super.key, required this.onTap});

  void login(BuildContext context) async {
    try {
      final email = _emailController.text;
      final password = _passwordController.text;
      await authServices.signInWithEmailPassword(email, password);

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Loged In Successfully")));
    } catch (e) {
      // Just show the error without checking mounted
      showDialog(
          context: context,
          builder: (context) => const AlertDialog(
                backgroundColor: Colors.grey,
                title: Text("Wrong Password"),
              ));
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
            // Icon(
            //   Icons.message,
            //   size: 70,
            //   color: Theme.of(context).colorScheme.primary,
            // ),
            // Image(image:  AssetImage('lib/images/logoo.svg'),height: 100,width: 100,),
            SvgPicture.asset('lib/images/logoo.svg',height: 200, width: 200,),
            
            const SizedBox(
              height: 45,
            ),
            Text(
              "Welcome Back You've Been Missed",
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
              height: 20,
            ),

            MyButton(
              ButtonText: "Login",
              onTap: () => login(context),
            ),

            const SizedBox(
              height: 25,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "not a member?",
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    " Register Now",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

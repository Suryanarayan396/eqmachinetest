import 'package:eqsoftmachinetest/constants/colorconst.dart';
import 'package:eqsoftmachinetest/controller/signin_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SigninController>(
      builder: (context, signprov, child) => Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: signprov.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                              image: AssetImage("assets/images/eq.jpeg"))),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colorconst.darkblue,
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Sign In - Admin",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colorconst.textwhite,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: signprov.idController,
                  decoration: InputDecoration(
                    labelText: 'Admin ID',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Admin ID';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: signprov.passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                if (signprov.errorMessage != null) ...[
                  Text(
                    signprov.errorMessage!,
                    style: TextStyle(color: Colors.red),
                  ),
                  SizedBox(height: 16),
                ],
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          WidgetStatePropertyAll(Colorconst.darkblue)),
                  onPressed: () {
                    signprov.signIntoApp(context);
                    signprov.idController.clear();
                    signprov.passwordController.clear();
                    //to clear texts in the textfeilds after login
                  },
                  child: Text(
                    'Sign In',
                    style: TextStyle(color: Colorconst.textwhite),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

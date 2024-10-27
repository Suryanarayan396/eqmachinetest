import 'package:eqsoftmachinetest/controller/bottomsheet_controller.dart';
import 'package:eqsoftmachinetest/controller/homepage_controller.dart';
import 'package:eqsoftmachinetest/controller/signin_controller.dart';
import 'package:eqsoftmachinetest/view/splash_page/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomepageController(),
        ),
        ChangeNotifierProvider(
          create: (context) => BottomsheetController(),
        ),
        ChangeNotifierProvider(
          create: (context) => SigninController(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashPage(),
      ),
    );
  }
}

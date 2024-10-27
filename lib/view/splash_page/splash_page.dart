import 'package:eqsoftmachinetest/constants/colorconst.dart';
import 'package:eqsoftmachinetest/view/signin/signin.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3)).then(
      (value) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => Signin(),
            ));
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      alignment: Alignment.center,
                      image: AssetImage("assets/images/eq.jpeg"))),
            ),
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: "CUSTOMER",
                  style: TextStyle(color: Colorconst.maincolor, fontSize: 30)),
              TextSpan(
                  text: " DETAIL",
                  style: TextStyle(color: Colorconst.darkblue, fontSize: 30))
            ]))
          ],
        ),
      ),
    );
  }
}

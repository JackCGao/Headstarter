import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hi_five/screens/login.dart';

 class auth extends StatefulWidget {
  const auth({super.key});
  @override
  State<auth> createState() => _authState();
}

class _authState extends State<auth>{

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => login()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.black
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'HiFive',
              style: TextStyle(
                fontStyle: FontStyle.italic,
                color: Colors.white,
                fontSize: 32,
              ),
            ),  
            const SizedBox(height:40),
            //implement button redirecting to login screen
            //implement button redirecting to signup screen
          ],
        ),
      ),
    );
  }
}
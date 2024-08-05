import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hi_five/screens/auth.dart';

 class splash extends StatefulWidget {
  const splash({super.key});
  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> with SingleTickerProviderStateMixin{

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => auth()));
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: SystemUiOverlay.values
    );
    super.dispose();
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
            )
          ],
        ),
      ),
    );
  }
}
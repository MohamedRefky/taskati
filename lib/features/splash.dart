import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive/hive.dart';
import 'package:lottie/lottie.dart';
import 'package:taskati/Core/TextStyle.dart';
import 'package:taskati/features/Home.dart';
import 'package:taskati/features/upload.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    var box = Hive.box('user');
    bool isUpload = box.get('IsUpload') ?? false;
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => (isUpload) ? const Home() : const Upload(),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/Logo.json'),
            const Gap(10),
            Text(
              'Taskati',
              style: getTitleStyle(),
            ),
            const Gap(20),
            Text(
              'It is Time to Get Organized',
              style: getBodyStyle(),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:taskati/Core/Function/routing.dart';
import 'package:taskati/Core/services/local_storage.dart';
import 'package:taskati/Core/utils/TextStyle.dart';
import 'package:taskati/features/Upload/upload.dart';
import 'package:taskati/features/home/Home.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    bool isUpload = AppLocalStorage.getCachedData('isUpload') ?? false;
    Future.delayed(const Duration(seconds: 3), () {
      navigateWithReplacment(
          context, (isUpload) ? const HomeView() : const Upload());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 200,
              height: 200,
              child: Lottie.asset('assets/Logo.json'),
            ),
            const Gap(20),
            Text(
              'Taskati',
              style: getTitleStyle(context,
                  fontWeight: FontWeight.w500, fontSize: 22),
            ),
            const Gap(10),
            Text('It\'s Time To Get Organized', style: getSmallStyle()),
          ],
        ),
      ),
    );
  }
}

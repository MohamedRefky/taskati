import 'dart:io';

import 'package:flutter/material.dart';
import 'package:taskati/Core/Function/routing.dart';
import 'package:taskati/Core/services/local_storage.dart';
import 'package:taskati/Core/utils/Colors.dart';
import 'package:taskati/Core/utils/TextStyle.dart';
import 'package:taskati/features/profile/presentation/view/profile_view.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({
    super.key,
  });

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  String? path;
  String name = '';

  @override
  void initState() {
    super.initState();
    name = AppLocalStorage.getCachedData('name');
    path = AppLocalStorage.getCachedData('image');
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // FutureBuilder(
            //   future: AppLocal.getData(AppLocal.Name_Key),
            //   builder: (context, snapshot) {
            //     return Text(
            //       'Hello,${snapshot.data?.split('').first}',
            //       style: getTitleStyle(context, color: AppColor.primary),
            //     );
            //   },
            // ),
            Text(
              'Hello, ${name.isEmpty ? '' : name}',
              style: getTitleStyle(context, color: AppColor.primary),
            ),
            Text(
              'Have A Nice Day.',
              style: getBodyStyle(
                context,
              ),
            ),
          ],
        ),
        const Spacer(),
        InkWell(
          onTap: () {
            navigateTo(context, const ProfileView());
          },
          child: CircleAvatar(
            radius: 22,
            backgroundImage: path != null
                ? FileImage(File(path!)) as ImageProvider
                : const AssetImage('assets/user.png'),
          ),
        ),
      ],
    );
  }
}

class $ {}

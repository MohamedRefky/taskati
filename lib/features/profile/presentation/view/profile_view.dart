import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:taskati/Core/utils/TextStyle.dart';
import 'package:taskati/Core/utils/Colors.dart';
class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    final box = Hive.box('user');
    var darkMode = box.get('darkMode')??false;
    return Scaffold(
      appBar: AppBar(
        foregroundColor: AppColor.primary,
        actions: [
          IconButton(
            onPressed: () {
              box.put('darkMode', !darkMode);
            },
            icon: Icon(
              darkMode ? Icons.sunny : Icons.dark_mode_rounded ,
            ),
          ),
        ],
      ),
      body: Center(
        child: ValueListenableBuilder(
          valueListenable: Hive.box('user').listenable(),
          builder: (context, box, child) {
            String path = box.get('image') ?? '';
            String name = box.get('name') ?? '';
            return Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                          radius: 80,
                          backgroundImage: path.isNotEmpty
                              ? FileImage(File(path)) as ImageProvider
                              : const AssetImage('assets/user.png')),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: InkWell(
                          onTap: () {},
                          child: CircleAvatar(
                              radius: 20,
                              backgroundColor: theme.background,
                              foregroundColor: AppColor.primary,
                              child: const Icon(Icons.camera_alt_rounded)),
                        ),
                      )
                    ],
                  ),
                  const Gap(30),
                  Divider(
                    color: AppColor.primary,
                  ),
                  const Gap(30),
                  Row(
                    children: [
                      Text(
                        name,
                        style: getTitleStyle(context, color: AppColor.primary),
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {},
                        child: CircleAvatar(
                          radius: 18,
                          backgroundColor: AppColor.primary,
                          child: CircleAvatar(
                              radius: 17,
                              backgroundColor: theme.background,
                              foregroundColor: AppColor.primary,
                              child: const Icon(Icons.edit)),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

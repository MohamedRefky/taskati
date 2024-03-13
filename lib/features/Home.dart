import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:taskati/Core/Colors.dart';
import 'package:taskati/Core/TextStyle.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

String name = '';
String? path;

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    name = box.get('name');
    path = box.get('image');
  }

  var box = Hive.box('user');
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Hello,${box.get('name')}',
                          style: getTitleStyle(
                              fontSize: 20, color: AppColor.primary)),
                      Text('Have A Nice Day.',
                          style: getBodyStyle(
                              fontSize: 16, color: AppColor.black)),
                    ],
                  ),
                  const Spacer(),
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: path != null
                        ? FileImage(File(path!)) as ImageProvider
                        : const NetworkImage(
                            'https://cdn.bio.link/uploads/profile_pictures/2022-04-30/kJEs007JcnaMcwl0st7WOqwJVxFfFaX7.png',
                          ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

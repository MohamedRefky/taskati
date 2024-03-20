import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskati/Core/utils/Colors.dart';
import 'package:taskati/Core/CustomButton.dart';
import 'package:taskati/features/Add%20Task/Widget/CustomTextFeald.dart';
import 'package:taskati/Core/utils/TextStyle.dart';
import 'package:taskati/features/home/Home.dart';

String? path;
String? name = '';

class Upload extends StatefulWidget {
  const Upload({super.key});

  @override
  _UploadState createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  var box = Hive.box('user');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {
              if (path != null && name!.isNotEmpty) {
                box.put('name', name);
                box.put('image', path);
                box.put('IsUplooad', true);
                box.get(name);
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const HomeView(),
                ));
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: AppColor.primary,
                    content: const Text('Done')));
              } else if (path == null && name!.isNotEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: AppColor.red,
                    content: const Text('Enter your image')));
              } else if (path != null && name!.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: AppColor.red,
                    content: const Text('Enter your Name')));
              } else {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: AppColor.red,
                    content: const Text('Enter your Name and image')));
              }
            },
            child: Text(
              'Done',
              style: getSmallStyle(
                fontSize: 16,
                color: AppColor.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
          )
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 60,
                backgroundImage: (path != null)
                    ? FileImage(File(path!)) as ImageProvider
                    : const NetworkImage(
                        'https://cdn.bio.link/uploads/profile_pictures/2022-04-30/kJEs007JcnaMcwl0st7WOqwJVxFfFaX7.png',
                      ),
              ),
              const Gap(30),
              CustomButtom(
                text: 'Upload From Camera',
                onPressed: () {
                  uploadFromCamera();
                },
              ),
              const Gap(10),
              CustomButtom(
                text: 'Upload From Gallery',
                onPressed: () {
                  uploadFromGallery();
                },
              ),
              const Gap(10),
              const Divider(),
              CustomTextField(
                onChanged: (value) {
                  setState(() {
                    name = value;
                  });
                },
                hintText: 'Enter your data',
              )
            ],
          ),
        ),
      ),
    );
  }

  uploadFromGallery() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        path = pickedImage.path;
      });
    }
  }

  uploadFromCamera() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      setState(() {
        path = pickedImage.path;
      });
    }
  }
}

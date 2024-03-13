import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati/Core/Colors.dart';
import 'package:taskati/Core/CustomButton.dart';
import 'package:taskati/Core/CustomTextFeald.dart';
import 'package:taskati/Core/TextStyle.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.white,
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: AppColor.primary,
            )),
        centerTitle: true,
        title: Text('Add Task',
            style: getTitleStyle(color: AppColor.primary, fontSize: 25)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Title',
                style: getTitleStyle(color: AppColor.black, fontSize: 18),
              ),
              const Gap(5),
              const CustomTextField(hintText: 'Enter title here'),
              const Gap(15),
              Text(
                'Note',
                style: getTitleStyle(color: AppColor.black, fontSize: 18),
              ),
              const Gap(5),
              const CustomTextField(hintText: 'Enter note here'),
              const Gap(15),
              Text(
                'Date',
                style: getTitleStyle(color: AppColor.black, fontSize: 18),
              ),
              const Gap(5),
              const CustomTextField(
                hintText: '3/13/2024',
                suffixIcon: Icon(Icons.date_range),
              ),
              const Gap(15),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Start time',
                        style:
                            getTitleStyle(color: AppColor.black, fontSize: 18),
                      ),
                      const CustomTextField(
                        suffixIcon: Icon(Icons.schedule),
                        hintText: '02:30 AM',
                        width: 177,
                      ),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'End time',
                        style:
                            getTitleStyle(color: AppColor.black, fontSize: 18),
                      ),
                      const CustomTextField(
                        suffixIcon: Icon(Icons.schedule),
                        hintText: '02:45 AM',
                        width: 177,
                      ),
                    ],
                  ),
                ],
              ),
              const Gap(20),
              Text(
                'Color',
                style: getTitleStyle(color: AppColor.black, fontSize: 18),
              ),
              Row(
                children: [
                  CircleAvatar(
                    radius: 17,
                    backgroundColor: AppColor.primary,
                    child: Icon(
                      Icons.done,
                      color: AppColor.white,
                    ),
                  ),
                  const Gap(5),
                  CircleAvatar(
                    radius: 17,
                    backgroundColor: AppColor.red,
                  ),
                  const Gap(5),
                  CircleAvatar(
                    radius: 17,
                    backgroundColor: AppColor.orang,
                  ),
                  const Spacer(),
                  CustomButtom(text: 'Creat Task', onPressed: () {},width: 130,height: 55,)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

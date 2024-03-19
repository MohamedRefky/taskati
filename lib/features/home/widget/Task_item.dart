import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati/Core/Colors.dart';
import 'package:taskati/data/task_model.dart';

class Task_Item extends StatelessWidget {
  const Task_Item({
    super.key, required TaskModel model,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(8),
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
          color: AppColor.primary, borderRadius: BorderRadius.circular(15)),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Flutter Task - 1',
                style: TextStyle(
                    color: AppColor.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
              Row(
                children: [
                  Icon(
                    Icons.watch_later_outlined,
                    color: AppColor.white,
                  ),
                  const Gap(10),
                  Text(
                    '02:25 AM - 04:40 AM ',
                    style: TextStyle(color: AppColor.white, fontSize: 15),
                  ),
                ],
              ),
              const Gap(5),
              Text(
                'I Will dothis task ',
                style: TextStyle(color: AppColor.white, fontSize: 16),
              ),
            ],
          ),
          const Spacer(),
          Container(
            height: 70,
            width: .5,
            decoration: BoxDecoration(color: AppColor.white),
          ),
          const Gap(5),
          RotatedBox(
            quarterTurns: DateTime.daysPerWeek,
            child: Text('TODO',
                style: TextStyle(color: AppColor.white, fontSize: 16)),
          )
        ],
      ),
    );
  }
}

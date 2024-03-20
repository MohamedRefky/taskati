import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:taskati/Core/Function/routing.dart';
import 'package:taskati/Core/utils/TextStyle.dart';
import 'package:taskati/Core/widgets/custom_mini_button.dart';
import 'package:taskati/features/add-task/presentaion/view/add_task_view.dart';

class TodayHeader extends StatelessWidget {
  const TodayHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              DateFormat.yMMMMd().format(DateTime.now()),
              style: getTitleStyle(
                context,
              ),
            ),
            Text(
              'Today',
              style: getTitleStyle(
                context,
              ),
            ),
          ],
        ),
        const Spacer(),
        CustomMiniButton(
          text: '+ Add Task',
          onPressed: () {
            navigateTo(context, const AddTaskView());
          },
        ),
      ],
    );
  }
}

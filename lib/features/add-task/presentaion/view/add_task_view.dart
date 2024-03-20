import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:taskati/Core/utils/TextStyle.dart';
import 'package:taskati/Core/utils/Colors.dart';
import 'package:taskati/Core/Function/routing.dart';
import 'package:taskati/Core/services/local_storage.dart';
import 'package:taskati/Core/widgets/custom_mini_button.dart';
import 'package:taskati/data/task_model.dart';
import 'package:taskati/features/home/presentation/view/home_view.dart';
class AddTaskView extends StatefulWidget {
  const AddTaskView({super.key, this.model});
  final TaskModel? model;
  @override
  State<AddTaskView> createState() => _AddTaskViewState();
}

class _AddTaskViewState extends State<AddTaskView> {
  var date = DateFormat("dd/MM/yyyy").format(DateTime.now());
  String? startTime = DateFormat('hh:mm a').format(DateTime.now());
  var endTime = DateFormat('hh:mm a')
      .format(DateTime.now().add(const Duration(minutes: 30)));
  int color = 0;

  var titleController = TextEditingController();
  var noteController = TextEditingController();

  @override
  void initState() {
    titleController = TextEditingController(text: widget.model?.title);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    startTime = widget.model != null
        ? widget.model?.startTime
        : DateFormat('hh:mm a').format(DateTime.now());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: AppColor.primary,
            )),
        centerTitle: true,
        title: Text(
          'Add Task',
          style: getTitleStyle(context, color: AppColor.primary),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Title',
              style: getTitleStyle(
                context,
              ),
            ),
            const Gap(5),
            TextFormField(
              controller: titleController,
              decoration: const InputDecoration(hintText: 'Enter Task Title'),
             
            ),
            const Gap(10),
            Text(
              'Note',
              style: getTitleStyle(
                context,
              ),
            ),
            const Gap(5),
            TextFormField(
              controller: noteController,
              maxLines: 4,
              decoration: const InputDecoration(hintText: 'Enter Task Note'),
            ),
            const Gap(10),
            Text(
              'Date',
              style: getTitleStyle(
                context,
              ),
            ),
            const Gap(5),
            TextFormField(
              readOnly: true,
              onTap: () {
                showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(
                      DateTime.now().add(const Duration(days: 365)).year)
                ).then((value) {
                  if (value != null) {
                    setState(() {
                      date = DateFormat("dd/MM/yyyy").format(value);
                    });
                  }
                });
              },
              decoration: InputDecoration(
                  suffixIcon: const Icon(Icons.calendar_month_rounded),
                  hintText: date,
                  hintStyle: getBodyStyle(context)),
            ),
            const Gap(10),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Start Time',
                    style: getTitleStyle(
                      context,
                    ),
                  ),
                ),
                const Gap(10),
                Expanded(
                  child: Text(
                    'End Time',
                    style: getTitleStyle(
                      context,
                    ),
                  ),
                ),
              ],
            ),
            const Gap(5),
            Row(
              children: [
                // start time -----------------------
                Expanded(
                  child: TextFormField(
                    readOnly: true,
                    onTap: () {
                      showTimePicker(
                              context: context, initialTime: TimeOfDay.now())
                          .then((value) {
                        if (value != null) {
                          setState(() {
                            startTime = value.format(context);
                          });
                        }
                      });
                    },
                    decoration: InputDecoration(
                        suffixIcon: const Icon(Icons.watch_later_outlined),
                        hintText: startTime,
                        hintStyle: getBodyStyle(context)),
                  ),
                ),
                const Gap(10),
                Expanded(
                  child: TextFormField(
                    readOnly: true,
                    onTap: () {
                      showTimePicker(
                              context: context, initialTime: TimeOfDay.now())
                          .then((value) {
                        if (value != null) {
                          setState(() {
                            endTime = value.format(context);
                          });
                        }
                      });
                    },
                    decoration: InputDecoration(
                        suffixIcon: const Icon(Icons.watch_later_outlined),
                        hintText: endTime,
                        hintStyle: getBodyStyle(context)),
                  ),
                ),
              ],
            ),
            // Hero Animation
            const Gap(20),
            Row(
              children: [
                Row(
                  children: List.generate(
                      3,
                      (index) => Padding(
                            padding: const EdgeInsets.all(3),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  color = index;
                                });
                              },
                              child: CircleAvatar(
                                backgroundColor: index == 0
                                    ? AppColor.primary
                                    : index == 1
                                        ? AppColor.orange
                                        : AppColor.red,
                                child: index == color
                                    ? Icon(
                                        Icons.check,
                                        color: AppColor.white,
                                      )
                                    : const SizedBox(),
                              ),
                            ),
                          )),
                ),
                const Spacer(),
                CustomMiniButton(
                  text: 'Add Task',
                  onPressed: () {
                    String id = '${titleController.text}${DateTime.now()}';
                    AppLocalStorage.cacheTask(
                        id,
                        TaskModel(
                            id: id,
                            title: titleController.text,
                            note: noteController.text,
                            date: date,
                            startTime: startTime!,
                            endTime: endTime,
                            color: color,
                            isComplete: false));
                    navigateWithReplacment(context, const HomeView());
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

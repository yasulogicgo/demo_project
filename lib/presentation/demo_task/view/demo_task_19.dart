import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../hive/hive_controller.dart';
import '../../../hive/show_add_or_edit_task_sheet.dart';
import '../../../hive/task_card.dart';

class DemoTask19 extends StatefulWidget {
  const DemoTask19({super.key});

  @override
  State<DemoTask19> createState() => _DemoTask19State();
}

class _DemoTask19State extends State<DemoTask19> {
  late TaskHiveController controller;

  @override
  void initState() {
    super.initState();
    controller = TaskHiveController(
      context: context,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Scaffold(

      appBar: AppBar(
        title: Text(
          'Tasks',
          style: theme.textTheme.titleLarge?.copyWith(fontSize: 18.sp),
        ),
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.add, size: 22.sp),
            onPressed: () {
              showAddOrEditTaskSheet(context: context);
            },
          ),
        ],
      ),

      body: ValueListenableBuilder(
        valueListenable: controller.hiveBox.listenable(),
        builder: (context, box, _) {
          final tasks = controller.fetchTasks();

          if (tasks.isEmpty) {
            return Center(
              child: Text(
                'No Tasks Found',
                style: theme.textTheme.bodyLarge?.copyWith(
                  fontSize: 14.sp,
                ),
              ),
            );
          }

          return ListView.builder(
            padding: EdgeInsets.symmetric(vertical: 8.h),
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              return TaskCard(
                task: tasks[index],
                controller: controller,
              );
            },
          );
        },
      ),
    );
  }
}

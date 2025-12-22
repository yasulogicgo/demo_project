import 'package:demo_app/constant/constant_string.dart';
import 'package:demo_app/hive/toast_info.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../model/task_model.dart';

class TaskHiveController {
  final BuildContext context;


  TaskHiveController({
    required this.context,

  });

  Box get hiveBox => Hive.box(taskBox);

  // ================= TASK =================

  List<Map<String, dynamic>> fetchTasks() {
    return hiveBox.keys.map((key) {
      final task = hiveBox.get(key);
      return {
        'key': key,
        'taskTitle': task['taskTitle'],
        'taskDate': task['taskDate'],
        'subTasks': task['subTasks'],
      };
    }).toList().reversed.toList();
  }

  Future<void> createTask(TaskModel task) async {
    await hiveBox.add(task.toMap());
    afterAction('saved');
  }

  Future<void> editTask(String taskTitle, int key) async {
    final taskMap = Map<String, dynamic>.from(hiveBox.get(key));
    taskMap['taskTitle'] = taskTitle;
    await hiveBox.put(key, taskMap);
    afterAction('updated');
  }

  Future<void> deleteTask(int key) async {
    await hiveBox.delete(key);
    afterAction('deleted');
  }

  // ================= SUB TASK =================

  void addSubTask(int taskKey, String subtitle) {
    final taskMap = Map<String, dynamic>.from(hiveBox.get(taskKey));
    taskMap['subTasks'].add({
      'subtitle': subtitle,
      'workList': [],
    });
    hiveBox.put(taskKey, taskMap);
  }

  void updateSubTask(int taskKey, int subIndex, String subtitle) {
    final taskMap = Map<String, dynamic>.from(hiveBox.get(taskKey));
    taskMap['subTasks'][subIndex]['subtitle'] = subtitle;
    hiveBox.put(taskKey, taskMap);
  }

  void deleteSubTask(int taskKey, int subIndex) {
    final taskMap = Map<String, dynamic>.from(hiveBox.get(taskKey));
    taskMap['subTasks'].removeAt(subIndex);
    hiveBox.put(taskKey, taskMap);
  }

  // ================= WORK ITEM =================

  void addWorkItem(int taskKey, int subIndex, String title) {
    final taskMap = Map<String, dynamic>.from(hiveBox.get(taskKey));
    taskMap['subTasks'][subIndex]['workList'].add({
      'title': title,
      'isDone': false,
    });
    hiveBox.put(taskKey, taskMap);
  }

  void updateWorkItem(int taskKey, int subIndex, int workIndex, String title) {
    final taskMap = Map<String, dynamic>.from(hiveBox.get(taskKey));
    taskMap['subTasks'][subIndex]['workList'][workIndex]['title'] = title;
    hiveBox.put(taskKey, taskMap);
  }

  void deleteWorkItem(int taskKey, int subIndex, int workIndex) {
    final taskMap = Map<String, dynamic>.from(hiveBox.get(taskKey));
    taskMap['subTasks'][subIndex]['workList'].removeAt(workIndex);
    hiveBox.put(taskKey, taskMap);
  }

  // ================= TOGGLE =================

  void toggleWorkStatus(int taskKey, int subIndex, int workIndex) {
    final taskMap = Map<String, dynamic>.from(hiveBox.get(taskKey));
    final work = taskMap['subTasks'][subIndex]['workList'][workIndex];
    work['isDone'] = !(work['isDone'] ?? false);
    hiveBox.put(taskKey, taskMap);
  }

  // ================= COMMON =================

  void afterAction(String keyword) {
    toastInfo(
      msg: 'Task $keyword successfully',
      status: Status.success,
    );
    Navigator.pop(context);
  }
}

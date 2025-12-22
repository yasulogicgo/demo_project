
// demo how data store
// TaskModel task = TaskModel(
//   taskTitle: "Flutter Learning",
//   taskDate: DateTime.now(),
//   subTasks: [
//     SubTask(
//       subtitle: "UI Work",
//       workList: [
//         WorkItem(title: "Login Screen"),
//         WorkItem(title: "Home Screen"),
//       ],
//     ),
//     SubTask(
//       subtitle: "Database Work",
//       workList: [
//         WorkItem(title: "hive Setup"),
//         WorkItem(title: "CRUD Operations"),
//       ],
//     ),
//   ],
// );


class TaskModel {
  final String taskTitle;
  final DateTime taskDate;
  final List<SubTask> subTasks;

  TaskModel({
    required this.taskTitle,
    required this.taskDate,
    required this.subTasks,
  });

  Map<String, dynamic> toMap() {
    return {
      'taskTitle': taskTitle,
      'taskDate': taskDate.toIso8601String(),
      'subTasks': subTasks.map((e) => e.toMap()).toList(),
    };
  }

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      taskTitle: map['taskTitle'],
      taskDate: DateTime.parse(map['taskDate']),
      subTasks: (map['subTasks'] as List)
          .map((e) => SubTask.fromMap(Map<String, dynamic>.from(e)))
          .toList(),
    );
  }
}

class SubTask {
  final String subtitle;
  final List<WorkItem> workList;

  SubTask({
    required this.subtitle,
    required this.workList,
  });

  Map<String, dynamic> toMap() {
    return {
      'subtitle': subtitle,
      'workList': workList.map((e) => e.toMap()).toList(),
    };
  }

  factory SubTask.fromMap(Map<String, dynamic> map) {
    return SubTask(
      subtitle: map['subtitle'],
      workList: (map['workList'] as List)
          .map((e) => WorkItem.fromMap(Map<String, dynamic>.from(e)))
          .toList(),
    );
  }
}


class WorkItem {
  final String title;
  final bool isDone;

  WorkItem({
    required this.title,
    this.isDone = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'isDone': isDone,
    };
  }

  factory WorkItem.fromMap(Map<String, dynamic> map) {
    return WorkItem(
      title: map['title'],
      isDone: map['isDone'] ?? false,
    );
  }
}



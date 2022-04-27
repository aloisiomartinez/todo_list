import 'package:flutter/material.dart';
import 'package:todo_list/app/core/notifier/default_change_notifier.dart';
import 'package:todo_list/app/models/task_filter_enum.dart';
import 'package:todo_list/app/models/task_model.dart';
import 'package:todo_list/app/models/total_tasks_model.dart';
import 'package:todo_list/app/models/week_task_model.dart';
import 'package:todo_list/app/services/tasks/tasks_service.dart';

class HomeController extends DefaultChangeNotifier {
  final TasksService _tasksService;
  var filterSelected = TaskFilterEnum.today;
  TotalTaskModel? todayTotalTasks;
  TotalTaskModel? tomorrowTotalTasks;
  TotalTaskModel? weekTotalTasks;

  HomeController({required TasksService tasksService})
      : _tasksService = tasksService;

  void loadTotalTasks() async {
    final allTasks = await Future.wait([
      _tasksService.getToday(),
      _tasksService.getTomorrow(),
      _tasksService.getWeek()
    ]);

    final todayTasks = allTasks[0] as List<TaskModel>;
    final tomorrowTasks = allTasks[1] as List<TaskModel>;
    final weekTasks = allTasks[2] as WeekTaskModel;

    todayTotalTasks = TotalTaskModel(
        totalTasks: todayTasks.length,
        totalTasksFinished: todayTasks.where((task) => task.finished).length
    );

    tomorrowTotalTasks = TotalTaskModel(
        totalTasks: tomorrowTasks.length,
        totalTasksFinished: tomorrowTasks.where((task) => task.finished).length
    );

    weekTotalTasks = TotalTaskModel(
        totalTasks: weekTasks.tasks.length,
        totalTasksFinished: weekTasks.tasks.where((task) => task.finished).length
    );
    
    notifyListeners();
  }
}

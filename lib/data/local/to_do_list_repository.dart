import 'package:imc/domain/entities/entities.dart';

abstract class ToDoListRepository {
  void addTask(TaskEntity task);
  List<TaskEntity> getListTask();
  void removeTask({required int index});
}

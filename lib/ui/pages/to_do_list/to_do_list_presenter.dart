import '../../../domain/entities/entities.dart';

abstract class ToDoListPresenter {
  void addTask({required String title});
  List<TaskEntity> getListTask();
  void removeTask({required int index});
}

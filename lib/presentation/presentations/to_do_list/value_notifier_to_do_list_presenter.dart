import '../../../data/local/local.dart';
import '../../../domain/entities/entities.dart';
import '../../../ui/pages/to_do_list/to_do_list_presenter.dart';

class ValueNotifierToDoListPresenter implements ToDoListPresenter {
  final ToDoListRepository repository;
  ValueNotifierToDoListPresenter({
    required this.repository,
  });
  @override
  void addTask({required String title}) {
    TaskEntity newTask = TaskEntity(title: title);
    repository.addTask(newTask);
  }

  @override
  List<TaskEntity> getListTask() {
    return repository.getListTask();
  }

  @override
  void removeTask({required int index}) {
    repository.removeTask(index: index);
  }
}

import 'package:imc/domain/entities/entities.dart';
import 'package:imc/ui/pages/to_do_list/to_do_list_presenter.dart';

import '../../../data/local/local.dart';

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

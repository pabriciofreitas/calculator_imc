//aqui você vai por nome da pakage que vai usar por exemplo shared_preeferid_adapter
import '../../data/local/to_do_list_repository.dart';
import '../../domain/entities/task_entity.dart';

class RespositoryLocalAdapter implements ToDoListRepository {
  static final RespositoryLocalAdapter _instance =
      RespositoryLocalAdapter._internal();
  final List<TaskEntity> _listTask = [];
  RespositoryLocalAdapter._internal();
  factory RespositoryLocalAdapter() {
    return _instance;
  }

  @override
  addTask(TaskEntity task) {
    _listTask.add(task);
  }

  @override
  void removeTask({required int index}) {
    _listTask.removeAt(index);
  }

  @override
  List<TaskEntity> getListTask() => _listTask;
}

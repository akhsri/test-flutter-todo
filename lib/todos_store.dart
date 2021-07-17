import 'package:hacker_news/services/todo_service.dart';
import 'package:mobx/mobx.dart';

part 'todos_store.g.dart';

class TodosStore = _TodosStore with _$TodosStore;

abstract class _TodosStore with Store {
  final _todoApi = TodoAPI();

  @observable
  ObservableFuture<List> todoItemsFuture = ObservableFuture.value([]);

  @action
  Future fetchTodos() =>
      todoItemsFuture = ObservableFuture(_todoApi.getTodoItems());
}

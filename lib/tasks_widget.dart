import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hacker_news/services/todo_service.dart';
import 'package:hacker_news/todos_store.dart';
import 'package:mobx/mobx.dart';

class TasksWidget extends StatefulWidget {
  const TasksWidget({Key? key}) : super(key: key);

  @override
  _TasksWidgetState createState() => _TasksWidgetState();
}

class _TasksWidgetState extends State<TasksWidget> {
  final TodosStore store = TodosStore();

  var todoList;

  @override
  void initState() {
    store.fetchTodos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Todos'),
        ),
        body: SafeArea(
          child: TodosItemView(store),
        ),
      );
}

class TodosItemView extends StatelessWidget {
  const TodosItemView(this.store);
  final TodosStore store;
  @override
  Widget build(BuildContext context) => Observer(builder: (_) {
        final future = store.todoItemsFuture;
        print(future);
        if (future.status == FutureStatus.fulfilled) {
          final List<TodoItem> items = future.result;
          print(' item $items');
          return Row(
            children: <Widget>[
              Container(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 1,
                  width: MediaQuery.of(context).size.width * 1,
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemCount: items.length,
                      itemBuilder: (_, index) {
                        final item = items[index];
                        return ListTile(
                          leading: Text(
                            '${item.userId}',
                            style: const TextStyle(fontSize: 20),
                          ),
                          title: Text(
                            item.title,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text('- ${item.taskId}'),
                        );
                      }),
                ),
              ),
            ],
          );
        } else if (future.status == FutureStatus.pending) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CircularProgressIndicator(),
              Text('Loading items...'),
            ],
          );
        } else if (future.status == FutureStatus.rejected) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Failed to load items.',
                style: TextStyle(color: Colors.red),
              ),
            ],
          );
        } else {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CircularProgressIndicator(),
              Text('Loading items...'),
            ],
          );
        }
      });
}

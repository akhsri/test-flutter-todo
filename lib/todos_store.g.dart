// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todos_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TodosStore on _TodosStore, Store {
  final _$todoItemsFutureAtom = Atom(name: '_TodosStore.todoItemsFuture');

  @override
  ObservableFuture<List<dynamic>> get todoItemsFuture {
    _$todoItemsFutureAtom.reportRead();
    return super.todoItemsFuture;
  }

  @override
  set todoItemsFuture(ObservableFuture<List<dynamic>> value) {
    _$todoItemsFutureAtom.reportWrite(value, super.todoItemsFuture, () {
      super.todoItemsFuture = value;
    });
  }

  final _$_TodosStoreActionController = ActionController(name: '_TodosStore');

  @override
  Future<dynamic> fetchTodos() {
    final _$actionInfo = _$_TodosStoreActionController.startAction(
        name: '_TodosStore.fetchTodos');
    try {
      return super.fetchTodos();
    } finally {
      _$_TodosStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
todoItemsFuture: ${todoItemsFuture}
    ''';
  }
}

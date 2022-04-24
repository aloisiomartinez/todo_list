import 'package:flutter/cupertino.dart';
import 'package:provider/single_child_widget.dart';
import 'package:todo_list/app/core/modules/todo_list_page.dart';

abstract class TodoListModule {
  final Map<String, WidgetBuilder> _routers;
  final List<SingleChildWidget>? _bindings;

  TodoListModule(
      {List<SingleChildWidget>? bindings,
      required Map<String, WidgetBuilder> routers})
      : _routers = routers,
        _bindings = bindings;

  Map<String, WidgetBuilder> get routers {
    return _routers.map((key, pageBuilder) => MapEntry(
        key,
        (_) => TodoListPage(
              bindings: _bindings,
              page: pageBuilder,
            )));
  }

  Widget getPage(String path, BuildContext context) {
    final widgetBuilder = _routers[path];

    if(widgetBuilder != null) {
      return TodoListPage(page: widgetBuilder, bindings: [_bindings],)
    }

  }
}

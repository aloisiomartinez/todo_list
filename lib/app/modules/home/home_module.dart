import 'package:todo_list/app/core/modules/todo_list_module.dart';
import 'package:todo_list/app/modules/home/home_page.dart';

class HomeModule extends TodoListModule {
  HomeModule()
      : super(
          //bindings: null,
          routers: {
            '/home': (context) => HomePage(),
          },
        );
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/app/core/auth/auth_provider.dart';
import 'package:todo_list/app/core/ui/theme_extensions.dart';
import 'package:todo_list/app/core/ui/todo_list_icons.dart';
import 'package:todo_list/app/modules/home/widgets/home_drawer.dart';

class HomePage extends StatelessWidget {

  const HomePage({ Key? key }) : super(key: key);

   @override
   Widget build(BuildContext context) {
       return Scaffold(
           appBar: AppBar(
             iconTheme: IconThemeData(color: context.primaryColor),
             backgroundColor: Colors.transparent,
             elevation: 0,
             actions: [
               PopupMenuButton(
                 icon: Icon(TodoListIcons.filter),
                 itemBuilder:(_) => [
                   PopupMenuItem<bool>(child: Text('Mostrar tarefas concluidas'))
                 ],
               )
             ],
           ),
           backgroundColor: Color(0xFFFAFBFE),
           drawer: HomeDrawer(),
           body: Container()
       );
  }
}
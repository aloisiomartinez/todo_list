import 'package:flutter/material.dart';
import 'package:todo_list/app/core/ui/theme_extensions.dart';

class HomeFilters extends StatefulWidget {

  const HomeFilters({ Key? key }) : super(key: key);

  @override
  State<HomeFilters> createState() => _HomeFiltersState();
}

class _HomeFiltersState extends State<HomeFilters> {
   @override
   Widget build(BuildContext context) {
       return Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           Text('FILTROS', style: context.titleStyle,),
           SizedBox(
             height: 10,
           ),
           SingleChildScrollView(
             scrollDirection: Axis.horizontal,
             child: Row(
               children: [
                 Container(
                   color: Colors.red, width: 100, height: 100,
                 ),
                 Container(
                   color: Colors.red, width: 100, height: 100,
                 ),
                 Container(
                   color: Colors.red, width: 100, height: 100,
                 ),
                 Container(
                   color: Colors.red, width: 100, height: 100,
                 ),
                 Container(
                   color: Colors.red, width: 100, height: 100,
                 ),
                 Container(
                   color: Colors.blue, width: 100, height: 100,
                 )
               ],
             ),
           )
         ],
       );
  }
}
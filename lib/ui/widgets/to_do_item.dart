import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/firebase_utils.dart';
import 'package:to_do_app/providers/list_provider.dart';

import '../../models/task.dart';
import '../../theme.dart';

class ToDoItem extends StatelessWidget {
  Task task;
  ToDoItem({required this.task});
  Widget build(BuildContext context) {
    var provider=Provider.of<ListProvider>(context);
    return Container(
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,borderRadius: BorderRadius.circular(20),
      ),
      child: Slidable(
        startActionPane: ActionPane(
          extentRatio: 0.25,
          motion: StretchMotion(),
           children: [
             SlidableAction(
               onPressed: (context) {
                 FirebaseUtils.delete(task).timeout(
                 Duration(milliseconds: 500),
                  onTimeout: (){
                    provider.refreshTasks();
                  }
                 );
               },
               backgroundColor: MyTheme.redColor ,
               foregroundColor: Colors.white,
               icon: Icons.delete,
               label: "delete",
             ),
           ],
        ),
        child: Container(
                padding: EdgeInsets.only(left: 10,right: 10),
                height: MediaQuery.of(context).size.height*0.15,
                child:Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height*0.1,
                        width: 3,
                        color: MyTheme.primaryColor,
                      ),
                      SizedBox(width: 10,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(task.title??'',
                                style: MyTheme.titleTextStyle),
                            SizedBox(height: 10),
                            Text(task.description??'',
                                style: MyTheme.titleTimeTextStyle),
                          ],
                        ),
                      ),
                      Spacer(),
                      Container(
                          decoration: BoxDecoration(
                            color: MyTheme.primaryColor,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          width: 45,
                          height: 25,
                          child: Icon(Icons.check,color: Colors.white,)),
                    ],
                  ),
                )
        ),
      ),
    );
  }
}

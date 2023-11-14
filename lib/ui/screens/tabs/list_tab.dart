import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/firebase_utils.dart';
import 'package:to_do_app/providers/list_provider.dart';
import 'package:to_do_app/theme.dart';

import '../../../models/task.dart';
import '../../widgets/to_do_item.dart';

class ListTab extends StatefulWidget {
  @override
  State<ListTab> createState() => _ListTabState();
}

class _ListTabState extends State<ListTab> {
Widget build(BuildContext context) {
  ListProvider listProvider=Provider.of(context);
  //if(listProvider.tasksList.isEmpty)
    listProvider.refreshTasks();
  return Column(
    children: [
      Container(
        height: MediaQuery.of(context).size.height*0.15,
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                    flex: 3,
                    child: Container(color: MyTheme.primaryColor,)),
                Expanded(
                    flex: 7,
                    child: Container(color: MyTheme.accentColor,)),
              ],
            ),
            CalendarTimeline(
              initialDate: listProvider.selectedDate,
              firstDate: DateTime.now().subtract(Duration(days: 365)),
              lastDate:  DateTime.now().add(Duration(days: 365)),
              onDateSelected: (date) {
                listProvider.selectedDate=date;
                listProvider.refreshTasks();
              },
              leftMargin: 20,
              monthColor: MyTheme.primaryColor,
              dayColor: Colors.black,
              activeDayColor: MyTheme.primaryColor,
              activeBackgroundDayColor: Colors.white,
              dotsColor: Colors.transparent,
              locale: 'en_ISO',
              //showYears: true,
            ),
          ],
        ),
      ),
      Expanded(
        child: ListView.builder(
          itemBuilder: (context, index) => ToDoItem(
            task: listProvider.tasksList[index],
          ),
          itemCount: listProvider.tasksList.length,
        ),
      ),
    ],
  );

}

}

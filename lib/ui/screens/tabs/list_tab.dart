import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/theme.dart';

import '../../widgets/to_do_item.dart';

class ListTab extends StatelessWidget {

  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height*0.15,
          child: Stack(
           children: [
             Column(
               children: [
                 Expanded(
                     flex: 6,
                     child: Container(color: MyTheme.primaryColor,)),
                 Expanded(
                     flex: 4,
                     child: Container(color: MyTheme.accentColor,)),
               ],
             ),
             CalendarTimeline(
              initialDate: DateTime.now(),
              firstDate: DateTime.now().subtract(Duration(days: 365)),
              lastDate:  DateTime.now().add(Duration(days: 365)),
              onDateSelected: (date) => print(date),
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
            itemBuilder: (context, index) => ToDoItem(),
            itemCount: 10,
          ),
        ),
      ],
    );

  }
}

import 'package:flutter/material.dart';

import '../../theme.dart';

class BottomSheetWidget extends StatelessWidget {

  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*.4,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text("Add new Task",textAlign: TextAlign.center,
                style: MyTheme.titleTextStyle.copyWith(color: Colors.black),),
              TextField(
                decoration: InputDecoration(
                    hintText: "Enter task title",
                    hintStyle: MyTheme.titleTimeTextStyle
                ),
              ),
              TextField(
                decoration: InputDecoration(
                    hintText: "Enter task description",
                    hintStyle: MyTheme.titleTimeTextStyle
                ),
              ),
              SizedBox(height: 20,),
              Text("Select time",textAlign: TextAlign.start,
                  style: MyTheme.titleTextStyle.copyWith(color: Colors.black)),
              SizedBox(height: 20,),
              Text("12:00 AM",textAlign: TextAlign.center,
                style: MyTheme.titleTimeTextStyle,),
              ElevatedButton(
                  onPressed:() => Navigator.pop(context),
                  child:Text("Add",
                    style: MyTheme.titleTextStyle.copyWith(color: Colors.white)
                    ,)
              )
            ]
        ),
      ),
    )
    ;
  }
}

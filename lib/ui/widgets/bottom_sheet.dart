import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/firebase_utils.dart';
import 'package:to_do_app/providers/list_provider.dart';

import '../../models/task.dart';
import '../../theme.dart';

class BottomSheetWidget extends StatefulWidget {
  @override
  State<BottomSheetWidget> createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget> {
  String title ='';
  String description='';
  DateTime selectedDate=DateTime.now();
  var formKey=GlobalKey<FormState>();
  late ListProvider listProvider;
  Widget build(BuildContext context) {
    listProvider=Provider.of(context);
    return Container(
      height: MediaQuery.of(context).size.height*.4,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text("Add new Task",textAlign: TextAlign.center,
                style: MyTheme.titleTextStyle.copyWith(color: Colors.black),),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      onChanged: (value) {
                        title=value;
                      },
                      decoration: InputDecoration(
                          hintText: "Enter task title",
                          hintStyle: MyTheme.titleTimeTextStyle
                      ),
                    ),
                    TextFormField(
                      onChanged: (value) {
                        description=value;
                      },
                      decoration: InputDecoration(
                          hintText: "Enter task description",
                          hintStyle: MyTheme.titleTimeTextStyle
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20,),
              Text("Select time",textAlign: TextAlign.start,
                  style: MyTheme.titleTextStyle.copyWith(color: Colors.black)),
              SizedBox(height: 20,),
              InkWell(
                onTap: () {
                  showCalender();
                },
                child: Text(
                    "${selectedDate.year}/${selectedDate.month}/${selectedDate.day}",
                    textAlign: TextAlign.center,
                  style: MyTheme.titleTimeTextStyle.copyWith(fontSize: 20)
                ),
              ),
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

  void showCalender() async{
    var chosenDate= await showDatePicker(context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));
    if(chosenDate!=null) selectedDate=chosenDate;
      setState(() {});
  }
  void addTask(){
    Task task = Task(
      title: title,
      description:description,
      dateTime:selectedDate
    );
    FirebaseUtils.addTaskToFireStore(task).timeout(
        Duration(milliseconds: 500),
      onTimeout: () {
          print("task added");
          listProvider.getAllTasksFromFireStore();
          Navigator.pop(context);
        }
    );
  }
}

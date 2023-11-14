import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import '../firebase_utils.dart';
import '../models/task.dart';

class ListProvider extends ChangeNotifier{
  List<Task> tasksList=[];
  DateTime selectedDate=DateTime.now();
  void refreshTasks()async{
    //1- bring list from firestore
    QuerySnapshot<Task> querySnapshot =await FirebaseUtils.getTaskCollection().get();
    tasksList = querySnapshot.docs.map((doc){
      return doc.data();
    }).toList();
    //2- filter list before show it
    // tasksList=tasksList.where((task) {
    //   if(task.dateTime?.day==selectedDate.day&&
    //       task.dateTime?.month==selectedDate.month&&
    //       task.dateTime?.year==selectedDate.year
    //   ) return true;
    //   return false;
    // }).toList();
    //3- tasks list is ready to show now
   notifyListeners();
  }



}
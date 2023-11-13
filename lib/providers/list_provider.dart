import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import '../firebase_utils.dart';
import '../models/task.dart';

class ListProvider extends ChangeNotifier{
  List<Task> tasksList=[];
  getAllTasksFromFireStore()async{  //list
    QuerySnapshot<Task> querySnapshot =await FirebaseUtils.getTaskCollection().get();
    tasksList = querySnapshot.docs.map((doc){
      return doc.data();
    }).toList();
   notifyListeners();
  }
}
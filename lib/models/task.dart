import 'package:flutter/material.dart';

class Task {
  static String collectionName="tasks";

  String? id;
  String? title;
  String? description;
  DateTime? dateTime;
  bool? isDone;

  Task({
    this.id='',
    required this.title,
    required this.description,
    required this.dateTime,
     this.isDone=false
});

   Map<String,dynamic> toFireStore() {
     return {
       "id": id,
       "title": title,
       "description": description,
       "dateTime": dateTime?.millisecond,
       "isDone": isDone
     };
   }
   Task.fromFireStore(Map<String,dynamic> data):this(
     id: data["id"],
     title: data["title"],
     dateTime: DateTime.fromMillisecondsSinceEpoch(data["dateTime"]),
     description:data["description"],
     isDone: data["isDone"]
   );

   
}
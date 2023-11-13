import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:to_do_app/models/task.dart';

class FirebaseUtils{

  static CollectionReference<Task> getTaskCollection(){
    return FirebaseFirestore.instance.collection('tasks').
    withConverter<Task>(fromFirestore:(snapshot, options) =>Task.fromFireStore(snapshot.data()!) ,
        toFirestore:(task, options) => task.toFireStore());
  }
  static Future<void> addTaskToFireStore(Task task){
    var taskCollection =getTaskCollection();
    DocumentReference<Task> docRef=taskCollection.doc();
    task.id=docRef.id;
    return docRef.set(task);
  }

}
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/problem_model.dart';

class FireBaseAuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> login(
      {required String email,
        required String password})
  async {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<void> createData({required ProblemModel model}) async

  {
try{
  final problems = firestore.collection("problems").doc();
  await problems.set(model.toJson());
}
catch(e)
    {
      print(e.toString());
    }
  }


}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/problem_model.dart';

class FireBaseAuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> login({required String email, required String password}) async {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<void> createData(
      {required String client,
      required String problem,
      required String description,
      required String type}) async {
    try {
      final problems = firestore.collection("problems").doc();
      final model = ProblemModel(
          client: client,
          problem: problem,
          description: description,
          type: type,
          id: problems.id);

      await problems.set(model.toJson());
    } catch (e) {
      print(e.toString());
    }
  }

  Stream<List<ProblemModel>> getProblems() {
    final problems = firestore.collection("problems").snapshots().map(
          (snapshot) => snapshot.docs
              .map((e) => ProblemModel.fromJson(e.data()))
              .toList(),
        );

    return problems;
  }


  removeFromDB(String id) async {


    print("Deleting document with ID: $id");
    await firestore.collection("problems").doc(id).delete();

  }

}



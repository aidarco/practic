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

  Future<void> updateDocument(
      {required String client,
      required String problem,
      required String description,
      required String type,
      required String id}) async {
    try {
      final model = ProblemModel(
          client: client,
          problem: problem,
          description: description,
          type: type,
          id: id);
      await firestore.collection('problems').doc(id).update(model.toJson());
      print('Документ успешно обновлен.');
    } catch (e) {
      print('Ошибка при обновлении документа: $e');
    }
  }

  Stream<List<ProblemModel>> searchProblem(String searchString, int type) {


    var searchIndicator = "";


    if (type == 1)
      {
        searchIndicator = "client";
      }


    if (type == 2)
    {
      searchIndicator = "problem";
    }

    if (type == 3)
    {
      searchIndicator = "type";
    }
    final problems = firestore
        .collection("problems")
        .orderBy(searchIndicator)
        .startAt([searchString])
        .endAt([searchString + "\uf8ff"])
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map((e) => ProblemModel.fromJson(e.data()))
              .toList(),
        );

    return problems;
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practic/services/firebase_auth_services.dart';

class EditProblem extends StatefulWidget {
  const EditProblem({super.key});

  @override
  State<EditProblem> createState() => _EditProblemState();
}

TextEditingController clientController = TextEditingController();
TextEditingController descriptionController = TextEditingController();
TextEditingController problemController = TextEditingController();
TextEditingController typeController = TextEditingController();

class _EditProblemState extends State<EditProblem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade800,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(Get.arguments["id"].toString()),
            TextFormField(
              textAlign: TextAlign.center,

              controller: clientController
                ..text = Get.arguments["client"].toString(),
            ),
            TextFormField(
              textAlign: TextAlign.center,

              controller: descriptionController
                ..text = Get.arguments["description"].toString(),
            ),
            TextFormField(
              textAlign: TextAlign.center,

              controller: problemController
                ..text = Get.arguments["problem"].toString(),
            ),
            TextFormField(
              textAlign: TextAlign.center,
              controller: typeController
                ..text = Get.arguments["type"].toString(),
            ),
            TextButton(
                onPressed: () {
                  FireBaseAuthServices().updateDocument(
                      client: clientController.text,
                      problem: problemController.text,
                      description: descriptionController.text,
                      type: typeController.text,
                      id: Get.arguments["id"].toString());

                  Navigator.pop(context);
                },
                child: Text("Редактировать"))
          ],
        ));
  }
}

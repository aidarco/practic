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
        backgroundColor: Colors.grey.shade900,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Редактирование",
              style: TextStyle(fontSize: 32, color: Colors.white),
            ),
            const SizedBox(
              height: 24,
            ),
            TextFormField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                hintStyle: TextStyle(color: Colors.grey.shade600),
                filled: true,
                fillColor: Colors.grey.shade800,
                focusedBorder: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: Colors.white)),
              ),
              controller: clientController
                ..text = Get.arguments["client"].toString(),
            ),
            const SizedBox(
              height: 24,
            ),
            TextFormField(
              textAlign: TextAlign.center,
              controller: descriptionController
                ..text = Get.arguments["description"].toString(),
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                hintStyle: TextStyle(color: Colors.grey.shade600),
                filled: true,
                fillColor: Colors.grey.shade800,
                focusedBorder: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: Colors.white)),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            TextFormField(
              textAlign: TextAlign.center,
              controller: problemController
                ..text = Get.arguments["problem"].toString(),
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                hintStyle: TextStyle(color: Colors.grey.shade600),
                filled: true,
                fillColor: Colors.grey.shade800,
                focusedBorder: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: Colors.white)),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            TextFormField(
              textAlign: TextAlign.center,
              controller: typeController
                ..text = Get.arguments["type"].toString(),
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                hintStyle: TextStyle(color: Colors.grey.shade600),
                filled: true,
                fillColor: Colors.grey.shade800,
                focusedBorder: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: Colors.white)),
              ),
            ),
            const SizedBox(
              height: 24,
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
                child: const Text(
                  "Редактировать",
                  style: TextStyle(color: Colors.white, fontSize: 24),
                )),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  "<",
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ))
          ],
        ));
  }
}

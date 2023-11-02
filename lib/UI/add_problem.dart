import 'package:flutter/material.dart';
import 'package:practic/models/problem_model.dart';
import 'package:practic/services/firebase_auth_services.dart';

class AddProblem extends StatefulWidget {
  const AddProblem({super.key});

  @override
  State<AddProblem> createState() => _AddProblemState();
}

class _AddProblemState extends State<AddProblem> {
  @override

  final TextEditingController controller1 = TextEditingController();
  final TextEditingController controller2 = TextEditingController();
  final TextEditingController controller3 = TextEditingController();
  final TextEditingController controller4 = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.grey.shade900,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                cursorColor: Colors.white,
                decoration: InputDecoration(filled: true, fillColor: Colors.grey.shade800),

                controller: controller1,
              ),
              const SizedBox(
                height: 24,
              ),
              TextField(
                cursorColor: Colors.white,
                decoration: InputDecoration(filled: true, fillColor: Colors.grey.shade800),

                controller: controller2,
              ),
              const SizedBox(
                height: 24,
              ),
              TextField(
                cursorColor: Colors.white,
                decoration: InputDecoration(filled: true, fillColor: Colors.grey.shade800),

                controller: controller3,
              ),
              const SizedBox(
                height: 24,
              ),
              TextField(
                cursorColor: Colors.white,
                decoration: InputDecoration(filled: true, fillColor: Colors.grey.shade800),
                controller: controller4,
              ),
              const SizedBox(
                height: 24,
              ),
              TextButton(
                  onPressed: () {
                    FireBaseAuthServices().createData(
                        model: ProblemModel(
                            client: controller1.text,
                            description: controller2.text,
                            problem: controller3.text,
                            type: controller4.text));
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Отправить запрос",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )),
            ],
          ),
        ));
  }
}

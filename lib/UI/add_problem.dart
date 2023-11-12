import 'package:flutter/material.dart';
import 'package:practic/services/firebase_auth_services.dart';

class AddProblem extends StatefulWidget {
  const AddProblem({super.key});

  @override
  State<AddProblem> createState() => _AddProblemState();
}

class _AddProblemState extends State<AddProblem> {

  final TextEditingController controller1 = TextEditingController();
  final TextEditingController controller2 = TextEditingController();
  final TextEditingController controller3 = TextEditingController();
  final TextEditingController controller4 = TextEditingController();

  @override



  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.grey.shade900,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              const Text("Добавление проблемы", style: TextStyle(color: Colors.white, fontSize: 32),),

              const SizedBox(
                height: 24,
              ),
              addTextField(controller: controller1, hintText: "client",),
              const SizedBox(
                height: 24,
              ),
              addTextField(controller: controller2, hintText: "description",),

              const SizedBox(
                height: 24,
              ),
              addTextField(controller: controller3, hintText: "problem",),

              const SizedBox(
                height: 24,
              ),

              addTextField(controller: controller4, hintText: "type",),


              const SizedBox(
                height: 24,
              ),
              TextButton(
                  onPressed: () {
                    FireBaseAuthServices().createData(
                            client: controller1.text,
                            description: controller2.text,
                            problem: controller3.text,
                            type: controller4.text);
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Отправить запрос",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )),

              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "<",
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  )),


            ],
          ),
        ));
  }
}

class addTextField extends StatelessWidget {
  const addTextField({
    super.key,
    required this.controller,
    required this.hintText
  });
  final hintText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(

      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey.shade600),
        filled: true,
        fillColor: Colors.grey.shade800,
        focusedBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: Colors.white)),
      ),
      style: TextStyle(color: Colors.grey.shade300),

    );
  }
}








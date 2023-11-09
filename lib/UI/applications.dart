import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practic/services/firebase_auth_services.dart';

import 'edit_problem.dart';

class Apl extends StatefulWidget {
  const Apl({super.key});

  @override
  State<Apl> createState() => _AplState();
}

var searchController = "";

class _AplState extends State<Apl> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey.shade900,
      body: StreamBuilder(
          stream: (searchController.isEmpty)
              ? FireBaseAuthServices().getProblems()
              : FireBaseAuthServices().searchProblem(searchController),
          builder: (context, snapshot) {
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  snap: true,
                  floating: true,
                  bottom: PreferredSize(
                    preferredSize: Size.fromHeight(70),
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          searchController = value;
                        });
                      },
                    ),
                  ),
                  title: const Text(
                    "Поиск",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Colors.white),
                  ),
                  backgroundColor: Colors.grey.shade700,
                ),
                const SliverToBoxAdapter(
                    child: SizedBox(
                  height: 12,
                )),
                SliverToBoxAdapter(
                    child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "addproblem");
                        },
                        child: const Text(
                          "Add problem",
                          style: TextStyle(fontSize: 22, color: Colors.white),
                        ))),
                const SliverToBoxAdapter(
                    child: SizedBox(
                  height: 8,
                )),
                SliverList.builder(
                    itemCount: snapshot.data?.length ?? 0,
                    itemBuilder: (context, index) => (snapshot
                                .connectionState ==
                            ConnectionState.waiting)
                        ? const Center(child: CircularProgressIndicator())
                        : AplWidget(
                            id: snapshot.data?[index].id ?? "",
                            client: snapshot.data![index].client ?? "",
                            description: snapshot.data![index].problem ?? "",
                            problem: snapshot.data![index].description ?? "",
                            type: snapshot.data![index].type ?? "",
                          )),
              ],
            );
          }),
    );
  }
}

class AplWidget extends StatelessWidget {
  const AplWidget(
      {super.key,
      required this.id,
      required this.client,
      required this.description,
      required this.problem,
      required this.type});

  final String id;
  final String client;
  final String description;
  final String problem;
  final String type;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24, right: 14, left: 14),
      child: Container(
        height: 188,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey.shade800,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: double.infinity,
              height: 10,
              decoration: const BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16))),
            ),
            GestureDetector(
              onTap: () {
                Get.to(() => EditProblem(), arguments: {
                  "id": id,
                  "client": client,
                  "description": description,
                  "problem": problem,
                  "type": type,
                });
              },
              child: Column(
                children: [
                  Text(
                    client,
                    style: const TextStyle(fontSize: 24, color: Colors.white),
                  ),
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    problem,
                    style: const TextStyle(fontSize: 14, color: Colors.white70),
                  ),
                  Text(
                    type,
                    style: const TextStyle(fontSize: 12, color: Colors.white60),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                FireBaseAuthServices().removeFromDB(id);
                print(id);
              },
              child: Container(
                width: double.infinity,
                height: 36,
                decoration: const BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(16),
                        bottomLeft: Radius.circular(16))),
                child: const Center(
                    child: Text(
                  "удалить",
                  style: TextStyle(fontSize: 24, color: Colors.white),
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}

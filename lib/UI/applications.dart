import 'package:flutter/material.dart';

class Apl extends StatefulWidget {
  const Apl({super.key});

  @override
  State<Apl> createState() => _AplState();
}

class _AplState extends State<Apl> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey.shade900,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(
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
              itemBuilder: (context, index) => const AplWidget()),
        ],
      ),
    );
  }
}

class AplWidget extends StatelessWidget {
  const AplWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24, right: 14, left: 14),
      child: Container(
        height: 148,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey.shade800,
          borderRadius: BorderRadius.circular(16),
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("1"),
            Text("31.09.2023"),
            Text("ДВС"),
            Text("Капиталка"),
            Text("ATF"),
            Text("ПЛОХО ВСЕ"),
          ],
        ),
      ),
    );
  }
}

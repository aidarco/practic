import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:practic/services/firebase_auth_services.dart';
import 'Blocs/LoginBloc/login_bloc.dart';
import 'UI/Auth.dart';
import 'UI/add_problem.dart';
import 'UI/applications.dart';
import 'UI/edit_problem.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => FireBaseAuthServices(),
      child: BlocProvider(
        create: (context) => LoginBloc(repo: RepositoryProvider.of<FireBaseAuthServices>(context)),
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              appBarTheme: AppBarTheme(backgroundColor: Colors.cyan)),
          routes: {
            "/": (context) => Auth(),
            "apl": (context) => Apl(),
            "addproblem": (context) => AddProblem(),
            "edit": (context) =>    EditProblem()

          },
          initialRoute: "/",
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practic/Blocs/LoginBloc/login_bloc.dart';

class Auth extends StatefulWidget {
  const Auth({super.key});

  @override
  State<Auth> createState() => _AuthState();
}

TextEditingController passwordController = TextEditingController();
TextEditingController emailController = TextEditingController();

class _AuthState extends State<Auth> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.grey.shade900,
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 136,
                ),
                Container(
                  height: 280,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("lib/imgages/img.png"))),
                ),
                TextFieldAuthWidget(
                  hintText: "Login",
                  controller: emailController,
                ),
                const SizedBox(
                  height: 24,
                ),
                TextFieldAuthWidget(
                  hintText: "Password",
                  controller: passwordController,
                ),
                const SizedBox(
                  height: 24,
                ),
                const SizedBox(
                  height: 55,
                  width: double.infinity,
                  child: AuthButton(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class AuthButton extends StatelessWidget {
  const AuthButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginSucces) {
          Navigator.pushReplacementNamed(context, "apl");
        }

        if (state is LoginError) {
          showDialog(
              context: context,
              builder: (context) =>
                  AlertDialog(
                    content: Text(
                      state.errorText,
                      style: const TextStyle(
                          color: Colors.cyan,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                  ));
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          if (state is LoginLoading)
            {
              return Center(child: CircularProgressIndicator(color: Colors.black,));
            }

          return TextButton(
            onPressed: () {
              BlocProvider.of<LoginBloc>(context).add(SuccesLoginEvent(
                  email: emailController.text,
                  password: passwordController.text));
            },
            style: ButtonStyle(
              splashFactory: NoSplash.splashFactory,
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  )),
              backgroundColor: MaterialStateProperty.all(Colors.grey.shade800),
            ),
            child: const Text(
              "Войти",
              style: TextStyle(color: Colors.white),
            ),
          );
        },
      ),
    );
  }
}

class TextFieldAuthWidget extends StatelessWidget {
  final hintText;
  final controller;

  const TextFieldAuthWidget(
      {super.key, required this.hintText, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      textAlign: TextAlign.center,
      cursorColor: Colors.white,
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

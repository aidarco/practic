import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:practic/services/firebase_auth_services.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({required this.repo}) : super(LoginInitial()) {
    on<SuccesLoginEvent>((event, emit) async {
      try {
        emit(LoginLoading());
        await repo.login(email: event.email, password: event.password);
        emit(LoginSucces());
      } catch (e) {
        emit(LoginError(errorText: e.toString()));
      }

    });
  }

  final FireBaseAuthServices repo;
}

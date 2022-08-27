import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/services/auth/auth_services.dart';
import 'package:movie_app/services/auth_bloc/auth_event.dart';
import 'package:movie_app/services/auth_bloc/auth_state.dart';
import 'package:movie_app/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(Authentication authentication) : super(const AuthStateLoading()) {
    // Initialize  //
    on<AuthEventInitialize>((event, emit) async {
      final SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      bool? isLoggedIn = sharedPreferences.getBool(isLoggedKey);
      if (isLoggedIn = true) {
        emit(AuthStateLoggedIn(isLoggedIn));
      } else {
        emit(const AuthStateLoggedOut());
      }
    });

    // Log In //
    on<AuthEventLogIn>((event, emit) async {
      emit(const AuthStateLoading());
      final email = event.email;
      final password = event.password;
      try {
        bool user =
            Authentication.signIn(email: email, password: password) as bool;
        emit(AuthStateLoggedIn(user));
      } on Exception catch (e) {
        emit(AuthStateLogFailure(e));
      }
    });

    // Log Out //
    on<AuthEventLogOut>((event, emit) {});
  }
}

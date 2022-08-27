import 'package:flutter/material.dart';

@immutable
abstract class AuthState {
  const AuthState();
}

class AuthStateLoading extends AuthState {
  const AuthStateLoading();
  
}

class AuthStateLoggedIn extends AuthState {
  final bool user;
  const AuthStateLoggedIn(this.user);
}

class AuthStateLogFailure extends AuthState {
  final Exception e;
  const AuthStateLogFailure(this.e);
}

class AuthStateLoggedOut extends AuthState {
  const AuthStateLoggedOut();
}

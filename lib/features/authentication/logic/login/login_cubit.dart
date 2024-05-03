import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mentorship_b1/features/authentication/logic/auth/auth_cubit.dart';
import '../../data/repo/auth_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepository userRepository;

  LoginCubit(this.userRepository) : super(LoginInitial());

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  Future<void> login() async {
    if (formKey.currentState!.validate()) {
      emit(LoginLoading());
      var response = await userRepository.login(
        email: emailController.text,
        password: passwordController.text,
      );
      response.fold(
        (failure) {
          log(failure.message);
          emit(LoginFailure(failure.message));
        },
        (user) {
          log(user.toString());
          emit(LoginSuccess());
        },
      );
    }
  }

  Future<void> signInWithGoogleAccount() async {
    emit(LoginLoading());
    (await userRepository.googleSignIn()).fold(
        (
          failure,
        ) {
          emit(LoginFailure(failure.message),);
        },
        (
          success,
        ) {
          emit(LoginSuccess());
        });
  }
}
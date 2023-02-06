import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FocusBlocCubit extends Cubit {
  FocusBlocCubit() : super(null);

  final List<FocusNode> focusNodes = [];

  void registerFocusSignIn() {
    focusNodes.addAll(List.generate(2, (index) => FocusNode()));
  }

  void registerFocusSignUp() {
    focusNodes.addAll(List.generate(5, (index) => FocusNode()));
  }
}

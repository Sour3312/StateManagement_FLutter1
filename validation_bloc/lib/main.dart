// ignore_for_file: camel_case_types, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:validation_bloc/form.dart';
import 'package:validation_bloc/signin_bloc.dart';

void main() {
  runApp(home());
}

class home extends StatelessWidget {
  const home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Material(
      child: BlocProvider(
          create: (context) => SignInBloc(), child: Scaffold(body: Forum())),
    ));
  }
}

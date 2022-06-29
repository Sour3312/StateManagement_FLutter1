// ignore_for_file: prefer_const_constructors, camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cubit/cubit/cubit.dart';

void main() {
  runApp(qwerty());
}

class qwerty extends StatelessWidget {
  const qwerty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InternetCubit(),
      child: MaterialApp(
        home: Home(),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("'Cubit' against bloc"),
      ),
      body: SafeArea(
          child: Center(
        child: BlocConsumer<InternetCubit, InternetState>(
          listener: (context, state) {
            if (state == InternetState.Gained) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Connection is on!"),
                backgroundColor: Colors.blueGrey,
              ));
            } else {
              if (state == InternetState.Lost) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("Connection Lost!!"),
                  backgroundColor: Colors.red,
                ));
              }
            }
          },
          builder: (context, state) {
            if (state == InternetState.Gained) {
              return Text("Connected!!");
            } else {
              if (state == InternetState.Lost) {
                return Text("Network Error");
              } else {
                return Text("Scanning...");
              }
            }
          },
        ),
      )),
    );
  }
}

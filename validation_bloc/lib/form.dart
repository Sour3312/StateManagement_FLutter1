// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:validation_bloc/signin_bloc.dart';
import 'package:validation_bloc/signin_event.dart';
import 'package:validation_bloc/signin_state.dart';

class Forum extends StatelessWidget {
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "validation with bloc",
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(0.0),
            child: Column(
              children: [
                BlocBuilder<SignInBloc, SigninState>(
                  builder: (context, state) {
                    if (state is SigninErrorState) {
                      return Text(state.errorMsg,
                          style: TextStyle(color: Colors.red));
                    } else {
                      return Container();
                    }
                  },
                ),
                TextField(
                  controller: emailcontroller,
                  onChanged: (value) {
                    BlocProvider.of<SignInBloc>(context).add(
                        SigninTextChangedEvent(
                            emailcontroller.text, passwordcontroller.text));
                  },
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: 'Enter Name',
                      hintText: 'Enter Your Name'),
                ),
                TextField(
                  controller: passwordcontroller,
                  onChanged: (value) {
                    BlocProvider.of<SignInBloc>(context).add(
                        SigninTextChangedEvent(
                            emailcontroller.text, passwordcontroller.text));
                  },
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: 'Enter Name',
                      hintText: 'Enter Your Name'),
                ),
                BlocBuilder<SignInBloc, SigninState>(
                  builder: ((context, state) {
                    if (state is SigninLoadingState) {
                      return CircularProgressIndicator();
                    }
                    return CupertinoButton(
                      onPressed: () {
                        if (state is SigninValidState) {
                          BlocProvider.of<SignInBloc>(context).add(
                              SigninSubmitEvent(emailcontroller.text,
                                  passwordcontroller.text));
                        }
                      },
                      color: (state is SigninValidState)
                          ? Colors.blue
                          : Colors.grey,
                      child: Text(
                        "Submit",
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

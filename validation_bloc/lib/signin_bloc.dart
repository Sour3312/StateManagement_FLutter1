import 'package:email_validator/email_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:validation_bloc/signin_event.dart';
import 'package:validation_bloc/signin_state.dart';

class SignInBloc extends Bloc<SigninEvent, SigninState> {
  SignInBloc() : super(SigninInitialState()) {
    on<SigninTextChangedEvent>((event, emit) {
      if (EmailValidator.validate(event.emaill) == false) {
        emit(SigninErrorState("invalid email!"));
      } else if (event.pass.length < 10) {
        emit(SigninErrorState("must be 8 charcter"));
      } else {
        emit(SigninValidState());
      }
    });
    on<SigninSubmitEvent>((event, emit) {
      emit(SigninLoadingState());
    });
  }
}

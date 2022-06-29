abstract class SigninState {}

//we can make n no of states here as per our requirements

class SigninInitialState extends SigninState {}

class SigninValidState extends SigninState {}

class SigninErrorState extends SigninState {
  final String errorMsg;
  SigninErrorState(this.errorMsg);
}

class SigninLoadingState extends SigninState {}

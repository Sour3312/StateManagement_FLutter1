abstract class SigninEvent {}

class SigninTextChangedEvent extends SigninEvent {
  final String emaill;
  final String pass;
  SigninTextChangedEvent(this.emaill, this.pass);
}

class SigninSubmitEvent extends SigninEvent {
  final String email;
  final String password;
  SigninSubmitEvent(this.email, this.password);
}

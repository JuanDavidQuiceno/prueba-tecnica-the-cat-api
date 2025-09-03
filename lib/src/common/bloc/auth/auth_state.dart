part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState({required this.authStatus});
  // final UserModel user;
  final AuthStatus authStatus;

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {
  const AuthInitial({required super.authStatus});
}

class AuthInitialState extends AuthState {
  const AuthInitialState({required super.authStatus});
}

class AuthLoadingState extends AuthState {
  const AuthLoadingState({required super.authStatus});
}

class AuthNotificatedChangeState extends AuthState {
  const AuthNotificatedChangeState({required super.authStatus});
}

class AuthOnboardingState extends AuthState {
  const AuthOnboardingState({required super.authStatus});
}

class AuthCheckingState extends AuthState {
  const AuthCheckingState({required super.authStatus});
}

class AuthenticatedState extends AuthState {
  const AuthenticatedState({required super.authStatus});
}

class AuthNoAuthenticatedState extends AuthState {
  const AuthNoAuthenticatedState({required super.authStatus});
}

class AuthMessageState extends AuthState {
  const AuthMessageState({
    required this.title,
    required super.authStatus,
    this.image,
    this.subTitle,
  });
  final String? image;
  final String title;
  final String? subTitle;
}

class AuthFinishWithError extends AuthState {
  const AuthFinishWithError({
    required super.authStatus,
    this.image,
    this.title,
    this.content,
    this.textButton,
    // this.type,
  });
  final String? image;
  final String? title;
  final String? content;
  // final AlertType? type;
  final String? textButton;

  // @override
  // List<Object> get props => [title, message];
}

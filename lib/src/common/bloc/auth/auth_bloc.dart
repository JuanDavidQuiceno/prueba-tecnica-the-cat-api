import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

/// AuthStatus enum verificar el estado del usuario
/// [checking] - The user is being checked
/// [authenticated] - The user is authenticated
/// [notAuthenticated] - The user is not authenticated
enum AuthStatus {
  /// Checing: verificando el estado del usuario
  checking,

  /// Authenticated: El usuario está autenticado
  authenticated,

  /// NotAuthenticated: El usuario no está autenticado
  notAuthenticated,
}

/// Role enum verificar el rol del usuario
/// [distributor] - El usuario es un distribuidor
enum Role {
  ///
  distributor,
}

/// AuthBloc - Bloc para manejar la autenticación del usuario y el estado de la
/// aplicación en general, cambio de rutas y logout
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  ///
  AuthBloc() : super(const AuthInitial(authStatus: AuthStatus.checking)) {
    on<AuthInitialEvent>(
      (event, emit) =>
          emit(const AuthInitialState(authStatus: AuthStatus.checking)),
    );
    on<AuthChangeEvent>(_changeState);
    on<AuthChangeRoute>(_changeRoute);
    on<AuthValidateEvent>(_validateState);
    on<LogoutEvent>(_logout);
  }

  void _changeRoute(AuthChangeRoute event, Emitter<AuthState> emit) {
    // _logger.wtf('Change route to: ${event.route}');
    // currentRoute = event.route;
    emit(const AuthInitialState(authStatus: AuthStatus.checking));
  }

  void _changeState(AuthChangeEvent event, Emitter<AuthState> emit) {
    emit(const AuthNotificatedChangeState(authStatus: AuthStatus.checking));
    emit(const AuthInitialState(authStatus: AuthStatus.checking));
  }

  Future<void> _validateState(
    AuthValidateEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthCheckingState(authStatus: AuthStatus.checking));

    await Future.delayed(const Duration(seconds: 2)).then((value) {
      emit(const AuthenticatedState(authStatus: AuthStatus.authenticated));
    });
  }

  FutureOr<void> _logout(LogoutEvent event, Emitter<AuthState> emit) {
    emit(const AuthLoadingState(authStatus: AuthStatus.checking));
    emit(
      const AuthNoAuthenticatedState(authStatus: AuthStatus.notAuthenticated),
    );
  }
}

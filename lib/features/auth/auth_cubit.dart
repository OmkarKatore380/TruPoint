import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trupoint/services/firebase/auth_service.dart';

// State
abstract class AuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {}
class AuthLoading extends AuthState {}
class AuthAuthenticated extends AuthState {
  final User user;
  AuthAuthenticated(this.user);
  @override
  List<Object?> get props => [user];
}
class AuthUnauthenticated extends AuthState {}
class AuthCodeSent extends AuthState {
  final String verificationId;
  AuthCodeSent(this.verificationId);
  @override
  List<Object?> get props => [verificationId];
}
class AuthError extends AuthState {
  final String message;
  AuthError(this.message);
  @override
  List<Object?> get props => [message];
}

// Cubit
class AuthCubit extends Cubit<AuthState> {
  final AuthService _authService;

  AuthCubit(this._authService) : super(AuthInitial()) {
    _authService.user.listen((user) {
      if (user != null) {
        emit(AuthAuthenticated(user));
      } else {
        emit(AuthUnauthenticated());
      }
    });
  }

  Future<void> loginWithEmail(String email, String password) async {
    emit(AuthLoading());
    try {
      await _authService.signInWithEmail(email, password);
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> signUpWithEmail(String email, String password) async {
    emit(AuthLoading());
    try {
      await _authService.signUpWithEmail(email, password);
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> sendOtp(String phoneNumber) async {
    emit(AuthLoading());
    try {
      await _authService.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (credential) async {
          await FirebaseAuth.instance.signInWithCredential(credential);
        },
        verificationFailed: (e) {
          emit(AuthError(e.message ?? 'Verification failed'));
        },
        codeSent: (verificationId, resendToken) {
          emit(AuthCodeSent(verificationId));
        },
        codeAutoRetrievalTimeout: (verificationId) {},
      );
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> loginWithGoogle() async {
    emit(AuthLoading());
    try {
      await _authService.signInWithGoogle();
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> logout() async {
    await _authService.signOut();
  }
}

import 'package:equatable/equatable.dart';

final class AuthState extends Equatable {
  final bool isAuth;

  const AuthState({this.isAuth = false});

  AuthState copyWith({bool? isAuth}) {
    return AuthState(isAuth: isAuth ?? this.isAuth);
  }

  @override
  List<Object> get props => [isAuth];
}

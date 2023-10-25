part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoadingState extends AuthState {}

final class AuthLoadedState extends AuthState {}

final class AuthErrorState extends AuthState {}

final class AuthUnauthenticatedState extends AuthState {}

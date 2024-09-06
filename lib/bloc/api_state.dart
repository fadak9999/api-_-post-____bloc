

part of 'api_bloc.dart';

@immutable
abstract class ApiState {}
 final class ApiInitial extends ApiState {}
//!


class ApiLoading extends ApiState {}
//--
class ApiPostAdded extends ApiState {
  final Post post;

  ApiPostAdded(this.post);
}
//--
class ApiError extends ApiState {
  final String message;

  ApiError(this.message);
}

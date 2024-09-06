
part of 'api_bloc.dart';

@immutable
abstract class ApiEvent {}
//
class AddPostEvent extends ApiEvent {
  final Post post;
//
  AddPostEvent(this.post);
}

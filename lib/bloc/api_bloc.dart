
import 'package:api_bloc/UserApiProvider.dart';
import 'package:api_bloc/model/model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'api_event.dart';
part 'api_state.dart';

class ApiBloc extends Bloc<ApiEvent, ApiState> {
  final UserApiProvider apiService;

  ApiBloc(this.apiService) : super(ApiInitial()) {
    on<AddPostEvent>((event, emit) async {
      //!
      emit(ApiLoading());
      try {
        final post = await apiService.addPost(event.post);
        emit(ApiPostAdded(post));
      } catch (e) {
        emit(ApiError('Failed to add post'));
      }
      //!
    });
  }
}

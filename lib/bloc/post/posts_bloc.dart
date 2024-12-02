import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../core/utils/enums.dart';
import '../../data/model/posts/posts_model.dart';
import '../../data/repository/PostsRepository.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostsRepository postRepository = PostsRepository();

  PostsBloc() : super(const PostsState()) {
    on<PostFetched>(fetchPostApi);
  }

  Future<void> fetchPostApi(PostFetched event, Emitter<PostsState> emit) async {
    await postRepository.fetchPost().then((value) {
      emit(state.copyWith(status: PostStatus.success, postsList: value, message: 'success'));
    }).onError((error, stackTrace) {
      emit(state.copyWith(status: PostStatus.failure, message: error.toString()));
    });
  }
}

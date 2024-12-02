part of 'posts_bloc.dart';

class PostsState extends Equatable {
  final PostStatus status;
  final List<PostsModel> posts;
  // final List<PostModel> searchPostList;

  final String message;
  // final String searchMessage;

  const PostsState({
    this.status = PostStatus.loading,
    this.posts = const <PostsModel>[],
    this.message = '',
    // this.searchPostList = const <PostsModel>[],
    // this.searchMessage = ''
  });


  PostsState copyWith({
    PostStatus? status,
    List<PostsModel>? postsList,
    String? message,
    // String? searchMessage,
    // List<PostsModel>? tempSearchPostList
  }) {
    return PostsState(
      status: status ?? this.status,
      posts: postsList ?? this.posts,
      message: message ?? this.message,
      // searchMessage: searchMessage ?? this.searchMessage,
      // searchPostList: tempSearchPostList ?? this.searchPostList,
    );
  }
  @override
  List<Object> get props => [status, posts, message];
}

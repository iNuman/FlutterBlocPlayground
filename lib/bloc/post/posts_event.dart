part of 'posts_bloc.dart';

abstract class PostsEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class PostFetched extends PostsEvent {}

class SearchItem extends PostsEvent {
  final String stSearch ;
  SearchItem(this.stSearch);
}


class FetchPostWithLazyLoading extends PostsEvent {}

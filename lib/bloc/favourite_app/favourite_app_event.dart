part of 'favourite_app_bloc.dart';

abstract class FavouriteAppEvent extends Equatable {
  const FavouriteAppEvent();
  @override
  List<Object?> get props => [];
}

class FetchFavouriteList extends FavouriteAppEvent {}

class FavouriteItem extends FavouriteAppEvent {
  final FavouriteItemModel item;
  const FavouriteItem({required this.item});
}

class SelectItem extends FavouriteAppEvent {
  FavouriteItemModel item;
  SelectItem({required this.item});
}

class UnSelectItem extends FavouriteAppEvent {
  FavouriteItemModel item;
  UnSelectItem({required this.item});
}

class DeleteItem extends FavouriteAppEvent {}

part of 'favourite_app_bloc.dart';

enum ListStatus { loading, success, failure }

class FavouriteAppState extends Equatable {
  final List<FavouriteItemModel> favouriteList;
  final ListStatus listStatus;
  final List<FavouriteItemModel> tempFavouriteList;

  const FavouriteAppState(
      {this.favouriteList = const [], this.tempFavouriteList = const [], this.listStatus = ListStatus.loading, });

  FavouriteAppState copyWith(
      {List<FavouriteItemModel>? favouriteList, List<FavouriteItemModel>? tempFavouriteList,  ListStatus? listStatus}) {
    return FavouriteAppState(
        favouriteList: favouriteList ?? this.favouriteList,
        listStatus: listStatus ?? this.listStatus,
        tempFavouriteList: tempFavouriteList ?? this.tempFavouriteList);
  }

  @override
  List<Object?> get props => [favouriteList, tempFavouriteList, listStatus];
}

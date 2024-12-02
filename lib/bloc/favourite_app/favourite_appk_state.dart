part of 'favourite_appk_bloc.dart';

sealed class FavouriteAppState extends Equatable {
  const FavouriteAppState();
}

final class FavouriteAppInitial extends FavouriteAppState {
  @override
  List<Object> get props => [];
}

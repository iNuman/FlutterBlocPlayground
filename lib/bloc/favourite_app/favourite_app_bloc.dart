import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_block/data/model/FavouriteItemModel.dart';
import 'package:flutter_block/data/repository/FavouriteRepository.dart';

part 'favourite_app_event.dart';

part 'favourite_app_state.dart';

class FavouriteAppBloc extends Bloc<FavouriteAppEvent, FavouriteAppState> {
  List<FavouriteItemModel> favouriteList = [];
  List<FavouriteItemModel> tempFavouriteList = [];
  FavouriteRepository favouriteRepository;

  FavouriteAppBloc(this.favouriteRepository) : super(const FavouriteAppState()) {
    on<FetchFavouriteList>(fetchFavouriteList);
    on<FavouriteItem>(_adFavouriteItem);
    on<SelectItem>(_selectItem);
    on<UnSelectItem>(_unSelectItem);
    on<DeleteItem>(_deleteItem);
  }

  void fetchFavouriteList(FavouriteAppEvent events, Emitter<FavouriteAppState> emit) async {
    favouriteList = await favouriteRepository.fetchItems();
    emit(state.copyWith(favouriteList: List.from(favouriteList), listStatus: ListStatus.success));
  }

  void _selectItem(SelectItem events, Emitter<FavouriteAppState> emit) async {
    tempFavouriteList.add(events.item);
    emit(state.copyWith(tempFavouriteList: List.from(tempFavouriteList)));
  }

  void _unSelectItem(UnSelectItem events, Emitter<FavouriteAppState> emit) async {
    tempFavouriteList.remove(events.item);
    emit(state.copyWith(tempFavouriteList: List.from(tempFavouriteList)));
  }

  void _adFavouriteItem(FavouriteItem events, Emitter<FavouriteAppState> emit) async {

    final personIndex = favouriteList.indexWhere((item) => item.id == events.item.id);
    if(events.item.isFavourite){
      if(tempFavouriteList.contains(favouriteList[personIndex])){
        tempFavouriteList.remove(favouriteList[personIndex]);
        tempFavouriteList.add(events.item);
      }
    }else {
      if(tempFavouriteList.contains(favouriteList[personIndex])){
        tempFavouriteList.remove(favouriteList[personIndex]);
        tempFavouriteList.add(events.item);
      }
    }
    favouriteList[personIndex] = events.item;
    emit(state.copyWith(favouriteList: List.from(favouriteList), tempFavouriteList: List.from(tempFavouriteList)));
  }

  void _deleteItem(DeleteItem events, Emitter<FavouriteAppState> emit) async {
    for (int i = 0; i < tempFavouriteList.length; i++) {
      favouriteList.remove(tempFavouriteList[i]);
    }

    tempFavouriteList.clear();
    emit(state.copyWith(
      favouriteList: List.from(favouriteList),
      tempFavouriteList: List.from(tempFavouriteList),
    ));
  }
}

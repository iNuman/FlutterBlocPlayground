import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'favourite_appk_event.dart';
part 'favourite_appk_state.dart';

class FavouriteAppBloc extends Bloc<FavouriteAppEvent, FavouriteAppState> {
  FavouriteAppBloc() : super(FavouriteAppInitial()) {
    on<FavouriteAppEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_block/bloc/favourite_app/favourite_app_bloc.dart';

class DeleteButtonWidget extends StatelessWidget {
  const DeleteButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavouriteAppBloc, FavouriteAppState>(
      buildWhen: (previous, current) =>  previous.tempFavouriteList != current.tempFavouriteList,
      builder: (context, state) {
        return Visibility(
            visible: state.tempFavouriteList.isNotEmpty ?  true : false ,
            child: IconButton(onPressed: () {
              context.read<FavouriteAppBloc>().add(DeleteItem());
            },
                icon: const Icon(Icons.delete_outline , color: Colors.red,))
        );
      },
    );
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_block/bloc/favourite_app/favourite_app_bloc.dart';
import 'package:flutter_block/bloc/todo/todo_bloc.dart';
import 'package:flutter_block/data/model/FavouriteItemModel.dart';
import 'package:flutter_block/presentation/favourite_screen/widget/delete_button_widget.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  void initState() {
    super.initState();
    context.read<FavouriteAppBloc>().add(FetchFavouriteList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Favourite App"), actions: const [DeleteButtonWidget()]),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: BlocBuilder<FavouriteAppBloc, FavouriteAppState>(
            builder: (context, state) {
              switch (state.listStatus) {
                case ListStatus.loading:
                  return const Center(child: CircularProgressIndicator());
                case ListStatus.success:
                  return ListView.builder(
                      itemCount: state.favouriteList.length,
                      itemBuilder: (context, index) {
                        final item = state.favouriteList[index];
                        return Card(
                          child: ListTile(
                              leading: Checkbox(
                                  value: state.tempFavouriteList.contains(item) ? true : false,
                                  onChanged: (value) {
                                    if (value!) {
                                      context.read<FavouriteAppBloc>().add(SelectItem(item: item));
                                    } else {
                                      context.read<FavouriteAppBloc>().add(UnSelectItem(item: item));
                                    }
                                  }),
                              title: Text(item.value),
                              trailing: IconButton(
                                onPressed: () {
                                  context.read<FavouriteAppBloc>().add(FavouriteItem(
                                      item: FavouriteItemModel(
                                          id: item.id,
                                          value: item.value,
                                          isFavourite: item.isFavourite ? false : true)));
                                },
                                icon: Icon(
                                    state.favouriteList[index].isFavourite ? Icons.favorite : Icons.favorite_outline),
                              )),
                        );
                      });
                case ListStatus.failure:
                  return const Center(child: Text('Error'));
              }
            },
          ),
        ));
  }
}

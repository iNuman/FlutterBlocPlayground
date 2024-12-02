import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_block/bloc/favourite_app/favourite_app_bloc.dart';
import 'package:flutter_block/bloc/post/posts_bloc.dart';
import 'package:flutter_block/bloc/todo/todo_bloc.dart';
import 'package:flutter_block/data/model/FavouriteItemModel.dart';
import 'package:flutter_block/presentation/favourite_screen/widget/delete_button_widget.dart';

import '../../core/utils/enums.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  void initState() {
    super.initState();
    context.read<PostsBloc>().add(PostFetched());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Fetch Posts")),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: BlocBuilder<PostsBloc, PostsState>(
            builder: (context, state) {
              switch (state.status) {
                case PostStatus.loading:
                  return const Center(child: CircularProgressIndicator());
                case PostStatus.success:
                  return ListView.builder(
                      itemCount: state.posts.length,
                      itemBuilder: (context, index) {
                        final item = state.posts[index];
                        return Card(
                          child: ListTile(
                            leading: const Icon(Icons.favorite_outline, size: 24,),
                            title: Text(item.name.toString()),
                            subtitle: Text(item.email.toString()),
                          ),
                        );
                      });
                case PostStatus.failure:
                  return const Center(child: Text('Error'));
              }
            },
          ),
        ));
  }
}

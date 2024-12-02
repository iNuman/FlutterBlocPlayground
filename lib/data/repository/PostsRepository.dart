import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter_block/core/constants/api_urls.dart';
import 'package:flutter_block/data/model/posts/posts_model.dart';

import '../model/FavouriteItemModel.dart';
import 'package:http/http.dart'  as http;

class PostsRepository {

  Future<List<PostsModel>> fetchPost()async{

    try {

      final response = await http.get(Uri.parse(ApiUrls.posts)).timeout( const Duration(seconds: 10 ));
      final body = json.decode(response.body) as List;
      if (kDebugMode) {
        print(response.statusCode.toString());
        print(body);
      }

      if(response.statusCode == 200){
        return body.map((dynamic json) {
          final map = json as Map<String, dynamic>;
          return PostsModel.fromMap(map);
        }).toList();
      }

    } on SocketException {
      await Future.delayed(const Duration(milliseconds: 1800));
      throw Exception('No Internet Connection');
    } on TimeoutException {
      throw Exception('');
    }

    throw Exception('error fetching data');
  }

}
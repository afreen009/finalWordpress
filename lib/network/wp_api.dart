import 'dart:convert';
import 'package:http/http.dart' as http;
import '../config.dart';
import '../model/post_entity.dart';

class WpApi {
  static const String BASE_URL = URL + REST_URL_PREFIX + '/wp/v2/';
  static const String BaseUrl= 'http://festivalsofearth.com/wp-json/wp/v2/posts';
  static Future<List<PostEntity>> getPostsList({int category = 0, int page = 1}) async {
    List<PostEntity> posts = List();
    List<PostEntity> rposts = List();
    try {
      String extra = category != 0 ? '&categories=' + '$category' : '';

      dynamic response = await http.get(BASE_URL + 'posts?_embed&page=$page' + extra);
      dynamic resp= await http.get(BaseUrl);
      dynamic rjson = jsonDecode(resp.body);
      dynamic json = jsonDecode(response.body);
      (rjson as List).forEach((v) {
        rposts.add(PostEntity.fromJson(v));
        print(rposts[1].id);
        print(rposts[1].extra);
        print(rposts[1].image);
        print(rposts[1].isDetailCard);
        print(rposts[1].id);
        print(rposts[1].id);
      });
      (json as List).forEach((v) {
        posts.add(PostEntity.fromJson(v));
        // print(posts);
      });
    } catch (e) {
      //TODO Handle No Internet Response
      print(e);
    }
    return posts;
  }

  static Future<List<PostCategory>> getCategoriesList({int page = 1}) async {
    List<PostCategory> categories = List();
    try {
      dynamic response = await http.get(BASE_URL + 'categories?orderby=count&order=desc&per_page=15&page=$page');
      dynamic json = jsonDecode(response.body);

      (json as List).forEach((v) {
        categories.add(PostCategory.fromJson(v));
      });
    } catch (e) {
      //TODO Handle No Internet Response
    }
    return categories;
  }
}

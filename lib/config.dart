import 'dart:convert';

import 'package:http/http.dart' as http;

const String TITLE = "ProPakistani";

/// last slash ' / ' is mandatory
const String URL = "https://propakistani.pk/";
const String BaseUrl = "http://festivalsofearth.com/wp-json/wp/v2/posts?_embed";
const int FEATURED_CATEGORY_ID = 20;
const String FEATURED_CATEGORY_TITLE = 'Featured';

const String REST_URL_PREFIX = 'wp-json';

Future<List> fetchData() async {
   var response = await http.get(BaseUrl, headers: {"Accept": "aplication/json"});
   var convertDataToJson = jsonDecode(response.body);
   print(convertDataToJson);
   return convertDataToJson;
}
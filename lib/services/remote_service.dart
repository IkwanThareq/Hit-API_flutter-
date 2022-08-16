// ini class untuk fetch data dari API via file remote_service.dart

import 'dart:async';

import 'package:newapi/models/post.dart';
import 'package:http/http.dart' as http;

class RemoteService {
  Future<List<Post>?> getPosts() async {
    // disini kita spesifikasikan urlnya, clientnya, dan responsenya
    var client = http.Client();

    var uri = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    var response = await client.get(uri);
    // check responsenya apakah ada atau tidak dan kalau tidak return apa
    if (response.statusCode == 200) {
      var responseJson = response.body;
      // print('isi print' + responseJson);
      // dibawah ini kita return hasil parsingnya ke dalam bentuk json
      return postFromJson(responseJson);
    }
  }
}

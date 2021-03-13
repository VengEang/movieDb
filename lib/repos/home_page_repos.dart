
import 'package:e_sala/models/UsersPost.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Future<MovieDb> get getPost async{
  String url="https://api.themoviedb.org/3/discover/movie?sort_by=popularity.desc&api_key=849e5d36a86018e4860df5f4449df374";
  http.Response res=await http.get(url);
  if(res.statusCode==200){
    return compute(movieDbFromMap,res.body);
  }
  else
    throw Exception("Error Code:${res.statusCode}");
}


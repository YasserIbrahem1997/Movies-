import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import '../modle/movie.dart';
final getdata = ChangeNotifierProvider<GetDataFromApi>((ref)=>GetDataFromApi());

class GetDataFromApi extends ChangeNotifier{
  List<Movie> listDataModel = [];

  GetDataFromApi() {
    getData();
  }
  Future getData() async {
    listDataModel = [];
    listDataModel.clear();
    try {
      String apikey = "9a4536432455e0275e09d75209bdace5";
      var url =Uri.parse(
          "https://api.themoviedb.org/3/movie/popular?api_key=9a4536432455e0275e09d75209bdace5&language=en-US");
      var respons = await http.get(url);
      var responsbody = jsonDecode(respons.body)["results"];
      for (int i = 0;i < responsbody.length;i++){
        listDataModel.add(Movie.fromMap(responsbody[i]));
      }
    } catch (e) {
      print("e => $e");
    }
    notifyListeners();
  }
}
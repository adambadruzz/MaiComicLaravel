import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:maicomic/model/Favorite.dart';

import 'package:maicomic/model/User.dart';

import '../model/Comic.dart';

class ComicService {
  final String Emu = "http://10.0.2.2:3000";
  final String baseUrlApi = "http://192.168.0.123:3000/api";

  // final String baseUrlApi = "http://192.168.31.219:3000/api";
  // final String baseUrlApi = "http://192.168.31.219:3000/api";

  // final String baseUrlApi = "http://192.168.30.220:3000/api";
  // final String baseUrlApi = "http://192.168.30.251:3000";
  // final String baseUrlApi = "http://192.168.31.239:3000";
  // final String baseUrlApi = "http://192.168.43.7:3000";

  Future<List<ComicModel>> fetchDataComic() async {
    Response response = await Dio().get("$baseUrlApi/comic/all");
    List<ComicModel> comic =
        (response.data as List).map((v) => ComicModel.fromJSON(v)).toList();
    return comic;
  }

  Future<List<ComicModel>> fetchDataComicType(String type) async {
    Response response = await Dio().get("$baseUrlApi/comic/type/$type");
    List<ComicModel> comic =
        (response.data as List).map((v) => ComicModel.fromJSON(v)).toList();
    return comic;
  }

  Future<List<UserModel>> fetchDataUser(int idUser) async {
    Response response = await Dio().get("$baseUrlApi/user/$idUser");
    List<UserModel> user =
        (response.data as List).map((v) => UserModel.fromJSON(v)).toList();
    return user;
  }

  // Future<UserModel> fetchDataUser(int idUser) async {
  //   Response response = await Dio().get("$baseUrlApi/user/$idUser");
  //   UserModel user = UserModel.fromJSON(response.data);
  //   return user;
  // }
  Future<List<FavoriteModelDetail>> fetchDataFavorite(
      int comicId, int userId) async {
    Response response =
        await Dio().get("$baseUrlApi/bookmark/$comicId/$userId");

    List<FavoriteModelDetail> favorites = (response.data as List)
        .map((v) => FavoriteModelDetail.fromJSON(v))
        .toList();
    return favorites;
  }

  Future<List<FavoriteModel>> fetchDataFavoriteComic(int userId) async {
    Response response = await Dio().get("$baseUrlApi/bookmark/user/$userId");

    List<FavoriteModel> favoritelist =
        (response.data as List).map((v) => FavoriteModel.fromJSON(v)).toList();
    return favoritelist;
  }

  Future<List<FavoriteModel>> fetchDataFavoriteComicType(
      int userId, String type) async {
    Response response =
        await Dio().get("$baseUrlApi/bookmark/user/$userId/$type");

    List<FavoriteModel> favoritelist =
        (response.data as List).map((v) => FavoriteModel.fromJSON(v)).toList();
    return favoritelist;
  }
}

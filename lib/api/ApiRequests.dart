import 'dart:async' show Future;
import 'dart:convert';
import 'package:flutter_app/api/models/UserAccount.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

import './models/GalleryAlbum.dart';
import './models/GalleryTags.dart';

class ImgurAPi {
  Future<String> _loadAccountInfo(String username, String refreshToken) async {
    final response = await http.get(
      'https://api.imgur.com/3/account/' + username,
      headers: {HttpHeaders.authorizationHeader: "Client-ID 759705448d0ff69",
        HttpHeaders.authorizationHeader: "refresh_token " + refreshToken},
    );
    return response.body;
  }
  Future<String> _loadTags() async {
    final response = await http.get(
      'https://api.imgur.com/3/tags',
      headers: {HttpHeaders.authorizationHeader: "Client-ID 759705448d0ff69"},
    );
    return response.body;
  }
  Future<String> _loadPhotoAsset(int page) async {
    final response = await http.get(
      'https://api.imgur.com/3/gallery/t/cats/' + page.toString(),
      headers: {HttpHeaders.authorizationHeader: "Client-ID 759705448d0ff69"},
    );
    return response.body;
  }

  Future<List<UserAccount>> loadUserAccountInfo(String username, String refreshToken) async {
    String jsonPhotos = await _loadAccountInfo(username, refreshToken);
    final jsonResponse =
    json.decode(jsonPhotos)['data'] as List<dynamic>;
    List<UserAccount> accountInfoList =
    jsonResponse.map((it) => UserAccount.fromJson(it)).toList();
    return accountInfoList;
  }

  Future<List<GalleryAlbum>> loadPhotos(int page) async {
    String jsonPhotos = await _loadPhotoAsset(page);
    final jsonResponse =
        json.decode(jsonPhotos)['data']['items'] as List<dynamic>;
    List<GalleryAlbum> photosList =
        jsonResponse.map((it) => GalleryAlbum.fromJson(it)).toList();
    return photosList;
  }

  Future<List<GalleryTags>> loadTags() async {
    String jsonPhotos = await _loadTags();
    final jsonResponse =
    json.decode(jsonPhotos)['data']['tags'] as List<dynamic>;
    List<GalleryTags> photosList =
    jsonResponse.map((it) => GalleryTags.fromJson(it)).toList();
    return photosList;
  }
}

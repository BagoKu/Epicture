import 'dart:async' show Future;
import 'dart:convert';
import './models/GalleryAlbum.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

class ImgurAPi {
  Future<String> _loadPhotoAsset(int page) async {
    final response = await http.get(
      'https://api.imgur.com/3/gallery/t/cats/' + page.toString(),
      headers: {HttpHeaders.authorizationHeader: "Client-ID 759705448d0ff69"},
    );
    return response.body;
  }

  Future<List<GalleryAlbum>> loadPhotos(int page) async {
    String jsonPhotos = await _loadPhotoAsset(page);
    final jsonResponse =
        json.decode(jsonPhotos)['data']['items'] as List<dynamic>;
    List<GalleryAlbum> photosList =
        jsonResponse.map((it) => GalleryAlbum.fromJson(it)).toList();
    return photosList;
  }
}

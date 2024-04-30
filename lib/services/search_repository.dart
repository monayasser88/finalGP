import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jody/cache/cache_helper.dart';
import 'package:jody/core/api/end_ponits.dart';

class SearchRepository {
  Future<List<Map<String, dynamic>>> tourismSearch(String keyword) async {
    final encodedKeyword = Uri.encodeComponent(keyword);
    final url =
        'https://kemet-gp2024.onrender.com/api/v1/tourismPlaces?keyword=$encodedKeyword';
    print('Search URL: $url');
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      print('API Response: $data');
      final List<Map<String, dynamic>> results = [];
      final List<dynamic> documents = data['document'];
      for (var document in documents) {
        final String name = document['name'];
        final String image = document['imgCover'];
        final String id = document['_id'];
        print(id);
        CacheHelper().saveData(key: ApiKey.tourismId, value: id);
        results.add({'name': name, 'imgCover': image, '_id': id});
      }
      print('Search Results: $results');
      return results;
    } else {
      print('Failed to fetch search results: ${response.statusCode}');
      throw Exception('Failed to fetch search results');
    }
  }

  Future<List<Map<String, dynamic>>> governorateSearch(String keyword) async {
    final encodedKeyword = Uri.encodeComponent(keyword);
    final url =
        'https://kemet-gp2024.onrender.com/api/v1/governrates?keyword=$encodedKeyword';
    print('Search URL: $url');
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      print('API Response: $data');
      final List<Map<String, dynamic>> results = [];
      final List<dynamic> documents = data['document'];
      for (var document in documents) {
        final String name = document['name'];
        final String image = document['image'];
        final String id = document['_id'];
        CacheHelper().saveData(key: ApiKey.governorateId, value: id);
        results.add({'name': name, 'image': image, '_id': id});
      }
      print('Search Results: $results');
      return results;
    } else {
      print('Failed to fetch search results: ${response.statusCode}');
      throw Exception('Failed to fetch search results');
    }
  }

  Future<List<Map<String, dynamic>>> legendSearch(String keyword) async {
    final encodedKeyword = Uri.encodeComponent(keyword);
    final url =
        'https://kemet-gp2024.onrender.com/api/v1/legends?keyword=$encodedKeyword';
    print('Search URL: $url');
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      print('API Response: $data');
      final List<Map<String, dynamic>> results = [];
      final List<dynamic> documents = data['document'];

      for (var document in documents) {
        final String name = document['name'];
        final String image = document['imgCover'];
        final String id = document['_id'];
        CacheHelper().saveData(key: ApiKey.legendId, value: id);
        results.add({'name': name, 'imgCover': image, '_id': id});
      }
      print('Search Results: $results');
      return results;
    } else {
      print('Failed to fetch search results: ${response.statusCode}');
      throw Exception('Failed to fetch search results');
    }
  }

  Future<List<Map<String, dynamic>>> getSearchHistory() async {
    const url = '';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<Map<String, dynamic>> history =
          List<Map<String, dynamic>>.from(data['history']);
      return history;
    } else {
      throw Exception('Failed to fetch search history');
    }
  }
}

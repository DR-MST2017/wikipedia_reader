import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';

import 'summary.dart';

class ArticleModel {
  Future<Summary> getRandomArticleSummary() async {
    final uri = Uri.https(
      'en.wikipedia.org',
      '/api/rest_v1/page/random/summary',
    );

    final response = await get(uri);

    if (response.statusCode != 200) {
      throw HttpException('Requête échouée : ${response.statusCode}');
    }

    return Summary.fromJson(jsonDecode(response.body));
  }
}
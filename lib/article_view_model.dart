import 'dart:io';
import 'package:flutter/foundation.dart' hide Summary;
import 'article_model.dart';
import 'summary.dart';

class ArticleViewModel extends ChangeNotifier {
  final ArticleModel model;

  Summary? summary;
  String? errorMessage;
  bool loading = false;

  ArticleViewModel(this.model) {
    getRandomArticleSummary();
  }

  Future<void> getRandomArticleSummary() async {
    loading = true;
    notifyListeners();

    try {
      summary = await model.getRandomArticleSummary();
      errorMessage = null;
    } on HttpException catch (error) {
      errorMessage = error.message;
      summary = null;
    }

    loading = false;
    notifyListeners();
  }
}
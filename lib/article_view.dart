import 'package:flutter/material.dart';

import 'article_model.dart';
import 'article_page.dart';
import 'article_view_model.dart';
import 'summary.dart';

class ArticleView extends StatelessWidget {
  ArticleView({super.key});

  final ArticleViewModel viewModel = ArticleViewModel(ArticleModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wikipedia Flutter'),
      ),
      body: ListenableBuilder(
        listenable: viewModel,
        builder: (context, child) {
          return switch ((
            viewModel.loading,
            viewModel.summary,
            viewModel.errorMessage,
          )) {
            (true, _, _) => const Center(
                child: CircularProgressIndicator(),
              ),
            (false, _, String message) => Center(
                child: Text(message),
              ),
            (false, null, null) => const Center(
                child: Text('Une erreur inconnue est survenue'),
              ),
            (false, Summary summary, null) => ArticlePage(
                summary: summary,
                onPressed: viewModel.getRandomArticleSummary,
              ),
          };
        },
      ),
    );
  }
}
import 'package:flutter/material.dart';

import 'summary.dart';

class ArticleWidget extends StatelessWidget {
  const ArticleWidget({super.key, required this.summary});

  final Summary summary;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          if (summary.hasImage)
            Image.network(summary.preferredSource!),

          const SizedBox(height: 10),

          Text(
            summary.titles.normalized,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.displaySmall,
          ),

          const SizedBox(height: 10),

          if (summary.description != null)
            Text(
              summary.description!,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodySmall,
            ),

          const SizedBox(height: 10),

          Text(summary.extract),
        ],
      ),
    );
  }
}
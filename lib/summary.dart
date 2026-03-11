const acceptableImageFormats = ['png', 'jpg', 'jpeg'];

class Summary {
  TitlesSet titles;
  int pageid;
  String extract;
  String extractHtml;
  ImageFile? thumbnail;
  ImageFile? originalImage;
  String? description;
  String? url;

  Summary({
    required this.titles,
    required this.pageid,
    required this.extract,
    required this.extractHtml,
    this.thumbnail,
    this.originalImage,
    this.description,
    this.url,
  });

  bool get hasImage =>
      (originalImage != null || thumbnail != null) && preferredSource != null;

  String? get preferredSource =>
      originalImage?.source ?? thumbnail?.source;

  static Summary fromJson(Map<String, dynamic> json) {
    return Summary(
      titles: TitlesSet.fromJson(json['titles']),
      pageid: json['pageid'],
      extract: json['extract'] ?? '',
      extractHtml: json['extract_html'] ?? '',
      thumbnail:
          json['thumbnail'] != null ? ImageFile.fromJson(json['thumbnail']) : null,
      originalImage: json['originalimage'] != null
          ? ImageFile.fromJson(json['originalimage'])
          : null,
      description: json['description'],
      url: json['content_urls']?['desktop']?['page'],
    );
  }
}

class ImageFile {
  String source;

  ImageFile({required this.source});

  static ImageFile fromJson(Map<String, dynamic> json) {
    return ImageFile(
      source: json['source'],
    );
  }
}

class TitlesSet {
  String normalized;

  TitlesSet({required this.normalized});

  static TitlesSet fromJson(Map<String, dynamic> json) {
    return TitlesSet(
      normalized: json['normalized'] ?? '',
    );
  }
}
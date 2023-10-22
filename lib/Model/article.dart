import 'package:uuid/uuid.dart';
final uuid = Uuid();
class Article {
  final String title;
  final String description;
  final String publishedAt;
  final String url;
  bool isFavorite; 
  Article({
    required this.title,
    required this.description,
    required this.publishedAt,
    required this.url,
    this.isFavorite = false, 
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      publishedAt: json['publishedAt'] ?? '',
      url: json['urlToImage'] ?? '',
    );
  }
}

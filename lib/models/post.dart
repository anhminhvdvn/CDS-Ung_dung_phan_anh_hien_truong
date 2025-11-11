// lib/models/post.dart
class Post {
  final String? id;
  final String title;
  final String content;
  final List<String> images;
  final String? relatedReportId;
  final String author;
  final int views;
  final String category;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Post({
    this.id,
    required this.title,
    required this.content,
    this.images = const [],
    this.relatedReportId,
    this.author = 'Cơ quan chức năng',
    this.views = 0,
    this.category = 'announcement',
    this.createdAt,
    this.updatedAt,
  });

  // Chuyển từ JSON thành Object
  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['_id'],
      title: json['title'],
      content: json['content'],
      images: List<String>.from(json['images'] ?? []),
      relatedReportId: json['relatedReportId'],
      author: json['author'],
      views: json['views'] ?? 0,
      category: json['category'],
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
    );
  }

  // Chuyển từ Object thành JSON
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'content': content,
      'images': images,
      'relatedReportId': relatedReportId,
      'author': author,
      'category': category,
    };
  }
}

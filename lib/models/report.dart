// lib/models/report.dart
class Report {
  final String? id;
  final String title;
  final String description;
  final String category;
  final Location location;
  final List<String> images;
  final String reporterName;
  final String reporterPhone;
  final String status;
  final String priority;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Report({
    this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.location,
    this.images = const [],
    required this.reporterName,
    required this.reporterPhone,
    this.status = 'pending',
    this.priority = 'medium',
    this.createdAt,
    this.updatedAt,
  });

  // Chuyển từ JSON thành Object
  factory Report.fromJson(Map<String, dynamic> json) {
    return Report(
      id: json['_id'],
      title: json['title'],
      description: json['description'],
      category: json['category'],
      location: Location.fromJson(json['location']),
      images: List<String>.from(json['images'] ?? []),
      reporterName: json['reporterName'],
      reporterPhone: json['reporterPhone'],
      status: json['status'],
      priority: json['priority'],
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
    );
  }

  // Chuyển từ Object thành JSON
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'category': category,
      'location': location.toJson(),
      'images': images,
      'reporterName': reporterName,
      'reporterPhone': reporterPhone,
      'status': status,
      'priority': priority,
    };
  }
}

class Location {
  final String address;
  final double? latitude;
  final double? longitude;

  Location({
    required this.address,
    this.latitude,
    this.longitude,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      address: json['address'],
      latitude: json['latitude']?.toDouble(),
      longitude: json['longitude']?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'address': address,
      'latitude': latitude,
      'longitude': longitude,
    };
  }
}

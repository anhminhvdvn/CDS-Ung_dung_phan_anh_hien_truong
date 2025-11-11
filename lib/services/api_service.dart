// lib/services/api_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/report.dart';
import '../models/post.dart';

class ApiService {
  // ⚠️ QUAN TRỌNG: Thay đổi địa chỉ này theo thiết bị của bạn
  // Android emulator: http://10.0.2.2:3000/api
  // iOS simulator: http://localhost:3000/api
  // Device thật (cùng WiFi): http://192.168.x.x:3000/api
  static const String baseUrl = 'http://172.16.10.35:3000/api';

  // ============ REPORTS API ============

  // Tạo đơn trình báo mới
  Future<Map<String, dynamic>> createReport(Report report) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/reports'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(report.toJson()),
      );

      if (response.statusCode == 201) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Không thể tạo đơn trình báo');
      }
    } catch (e) {
      throw Exception('Lỗi kết nối: $e');
    }
  }

  // Lấy danh sách đơn trình báo
  Future<List<Report>> getReports({
    String? status,
    String? category,
    int page = 1,
    int limit = 20,
  }) async {
    try {
      String url = '$baseUrl/reports?page=$page&limit=$limit';
      if (status != null) url += '&status=$status';
      if (category != null) url += '&category=$category';

      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final List<dynamic> reportsJson = data['data'];
        return reportsJson.map((json) => Report.fromJson(json)).toList();
      } else {
        throw Exception('Không thể tải danh sách đơn');
      }
    } catch (e) {
      throw Exception('Lỗi kết nối: $e');
    }
  }

  // ============ POSTS API ============

  // Lấy danh sách bài viết
  Future<List<Post>> getPosts({
    String? category,
    int page = 1,
    int limit = 20,
  }) async {
    try {
      String url = '$baseUrl/posts?page=$page&limit=$limit';
      if (category != null) url += '&category=$category';

      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final List<dynamic> postsJson = data['data'];
        return postsJson.map((json) => Post.fromJson(json)).toList();
      } else {
        throw Exception('Không thể tải danh sách bài viết');
      }
    } catch (e) {
      throw Exception('Lỗi kết nối: $e');
    }
  }

  // Lấy chi tiết 1 bài viết
  Future<Post> getPostById(String id) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/posts/$id'));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return Post.fromJson(data['data']);
      } else {
        throw Exception('Không tìm thấy bài viết');
      }
    } catch (e) {
      throw Exception('Lỗi kết nối: $e');
    }
  }
}

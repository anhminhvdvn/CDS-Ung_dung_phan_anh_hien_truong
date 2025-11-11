import 'package:flutter/material.dart';
import '../models/post.dart';
import '../services/api_service.dart';
import 'package:intl/intl.dart';

class PostsTab extends StatefulWidget {
  const PostsTab({super.key});

  @override
  State<PostsTab> createState() => _PostsTabState();
}

class _PostsTabState extends State<PostsTab> {
  final ApiService _apiService = ApiService();
  List<Post> _posts = [];
  bool _isLoading = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _loadPosts();
  }

  Future<void> _loadPosts() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });
    try {
      final posts = await _apiService.getPosts();
      setState(() {
        _posts = posts;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    const primaryGreen = Color(0xFF2E7D32);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tin tức từ cơ quan'),
        backgroundColor: primaryGreen,
        foregroundColor: Colors.white,
        actions: [
          IconButton(icon: const Icon(Icons.refresh), onPressed: _loadPosts),
        ],
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_isLoading) return const Center(child: CircularProgressIndicator());
    if (_errorMessage != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 60, color: Colors.red),
            Text('Lỗi: $_errorMessage', textAlign: TextAlign.center),
            const SizedBox(height: 16),
            ElevatedButton(onPressed: _loadPosts, child: const Text('Thử lại')),
          ],
        ),
      );
    }
    if (_posts.isEmpty) {
      return const Center(child: Text('Chưa có bài viết nào', style: TextStyle(fontSize: 16, color: Colors.grey)));
    }

    return RefreshIndicator(
      onRefresh: _loadPosts,
      child: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: _posts.length,
        itemBuilder: (context, i) => _buildPostCard(_posts[i]),
      ),
    );
  }

  Widget _buildPostCard(Post post) {
    const primaryGreen = Color(0xFF2E7D32);
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 3,
      shadowColor: primaryGreen.withOpacity(0.3),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () => _showPostDetail(post),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(post.title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Text(post.content, maxLines: 3, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 14, height: 1.4)),
              const SizedBox(height: 10),
              Row(
                children: [
                  Icon(Icons.account_circle, size: 16, color: Colors.grey[600]),
                  const SizedBox(width: 4),
                  Text(post.author, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
                  const Spacer(),
                  Icon(Icons.access_time, size: 16, color: Colors.grey[600]),
                  const SizedBox(width: 4),
                  Text(
                    post.createdAt != null ? DateFormat('dd/MM/yyyy').format(post.createdAt!) : '',
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showPostDetail(Post post) {
    const primaryGreen = Color(0xFF2E7D32);
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.9,
        expand: false,
        builder: (context, scrollController) {
          return SingleChildScrollView(
            controller: scrollController,
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text('Chi tiết bài viết',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: primaryGreen)),
                    ),
                    IconButton(icon: const Icon(Icons.close), onPressed: () => Navigator.pop(context)),
                  ],
                ),
                const Divider(),
                const SizedBox(height: 8),
                Text(post.title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Chip(
                      backgroundColor: primaryGreen.withOpacity(0.1),
                      avatar: const Icon(Icons.account_circle, size: 16, color: primaryGreen),
                      label: Text(post.author, style: const TextStyle(color: primaryGreen)),
                    ),
                    const SizedBox(width: 8),
                    if (post.createdAt != null)
                      Text(
                        DateFormat('dd/MM/yyyy HH:mm').format(post.createdAt!),
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(post.content, style: const TextStyle(fontSize: 16, height: 1.5)),
              ],
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../models/report.dart';
import '../services/api_service.dart';

class CreateReportTab extends StatefulWidget {
  const CreateReportTab({super.key});

  @override
  State<CreateReportTab> createState() => _CreateReportTabState();
}

class _CreateReportTabState extends State<CreateReportTab> {
  final _formKey = GlobalKey<FormState>();
  final ApiService _apiService = ApiService();

  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _addressController = TextEditingController();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();

  String _selectedCategory = 'trash';
  bool _isSubmitting = false;

  final Map<String, String> _categories = {
    'trash': '🗑️ Rác thải',
    'flood': '💧 Ngập úng',
    'accident': '🚗 Tai nạn giao thông',
    'infrastructure': '🏗️ Hạ tầng',
    'other': '📋 Khác',
  };

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _addressController.dispose();
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  Future<void> _submitReport() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isSubmitting = true);
    try {
      final report = Report(
        title: _titleController.text,
        description: _descriptionController.text,
        category: _selectedCategory,
        location: Location(address: _addressController.text),
        reporterName: _nameController.text,
        reporterPhone: _phoneController.text,
      );

      await _apiService.createReport(report);

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('✅ Đã gửi đơn thành công!'),
          backgroundColor: Color(0xFF2E7D32),
        ),
      );

      _formKey.currentState!.reset();
      _titleController.clear();
      _descriptionController.clear();
      _addressController.clear();
      _nameController.clear();
      _phoneController.clear();
      setState(() => _selectedCategory = 'trash');
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('❌ Lỗi: ${e.toString()}'),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      if (mounted) setState(() => _isSubmitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    const primaryGreen = Color(0xFF2E7D32);
    const lightGreen = Color(0xFFA5D6A7);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Gửi đơn trình báo'),
        backgroundColor: primaryGreen,
        foregroundColor: Colors.white,
        elevation: 2,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: lightGreen.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: lightGreen),
                ),
                child: Row(
                  children: const [
                    Icon(Icons.info_outline, color: primaryGreen),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Vui lòng điền đầy đủ thông tin để chúng tôi có thể xử lý nhanh chóng',
                        style: TextStyle(fontSize: 13),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Các ô nhập liệu (giữ nguyên logic)
              _buildTextField(_titleController, 'Tiêu đề *',
                  icon: Icons.title,
                  hint: 'Ví dụ: Rác thải tràn lan tại đường ABC',
                  validator: (v) => v!.length < 10 ? 'Tiêu đề phải có ít nhất 10 ký tự' : null),
              const SizedBox(height: 16),

              DropdownButtonFormField<String>(
                value: _selectedCategory,
                decoration: _inputDecoration('Loại sự việc *', Icons.category),
                items: _categories.entries
                    .map((e) => DropdownMenuItem(
                          value: e.key,
                          child: Text(e.value),
                        ))
                    .toList(),
                onChanged: (v) => setState(() => _selectedCategory = v!),
              ),
              const SizedBox(height: 16),

              _buildTextField(_descriptionController, 'Mô tả chi tiết *',
                  icon: Icons.description,
                  hint: 'Mô tả tình trạng hiện tại...',
                  maxLines: 5,
                  validator: (v) => v!.length < 20 ? 'Mô tả phải có ít nhất 20 ký tự' : null),
              const SizedBox(height: 16),

              _buildTextField(_addressController, 'Địa chỉ *', icon: Icons.location_on, hint: 'Số nhà, đường, phường, quận...'),
              const SizedBox(height: 24),

              const Text('Thông tin người gửi', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),

              _buildTextField(_nameController, 'Họ và tên *', icon: Icons.person),
              const SizedBox(height: 16),
              _buildTextField(_phoneController, 'Số điện thoại *',
                  icon: Icons.phone,
                  keyboardType: TextInputType.phone,
                  validator: (v) => !RegExp(r'^[0-9]{10,11}$').hasMatch(v!) ? 'Số điện thoại không hợp lệ' : null),
              const SizedBox(height: 24),

              ElevatedButton(
                onPressed: _isSubmitting ? null : _submitReport,
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryGreen,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  elevation: 3,
                ),
                child: _isSubmitting
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                      )
                    : const Text('Gửi đơn trình báo', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 12),
              Text(
                '* Thông tin của bạn sẽ được bảo mật',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(String label, IconData icon) {
    const primaryGreen = Color(0xFF2E7D32);
    return InputDecoration(
      labelText: label,
      prefixIcon: Icon(icon, color: primaryGreen),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: primaryGreen, width: 2),
      ),
    );
  }

  Widget _buildTextField(
    TextEditingController controller,
    String label, {
    IconData? icon,
    String? hint,
    int maxLines = 1,
    TextInputType? keyboardType,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      decoration: _inputDecoration(label, icon ?? Icons.text_fields).copyWith(hintText: hint),
      keyboardType: keyboardType,
      maxLines: maxLines,
      validator: validator ?? (v) => v!.isEmpty ? 'Vui lòng nhập ${label.toLowerCase()}' : null,
    );
  }
}

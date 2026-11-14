import 'package:flutter/material.dart';

void main() {
  runApp(const AquaTeamApp());
}

class AquaTeamApp extends StatelessWidget {
  const AquaTeamApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aqua Team Recruitment',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        scaffoldBackgroundColor: const Color(0xFFF8F9FA),
      ),
      home: const RecruitmentFormScreen(),
    );
  }
}

class RecruitmentFormScreen extends StatefulWidget {
  const RecruitmentFormScreen({super.key});

  @override
  State<RecruitmentFormScreen> createState() => _RecruitmentFormScreenState();
}

class _RecruitmentFormScreenState extends State<RecruitmentFormScreen> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _numberController = TextEditingController();
  final _emailController = TextEditingController();
  final _universityController = TextEditingController();
  final _collegeController = TextEditingController();
  final _volunteerController = TextEditingController();
  final _hobbiesController = TextEditingController();
  final _commentsController = TextEditingController();

  String? _selectedAcademicYear;
  int? _pressureRating;
  int? _flexibilityRating;
  int? _communicationRating;
  int? _timeManagementRating;

  @override
  void dispose() {
    _nameController.dispose();
    _numberController.dispose();
    _emailController.dispose();
    _universityController.dispose();
    _collegeController.dispose();
    _volunteerController.dispose();
    _hobbiesController.dispose();
    _commentsController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      if (_selectedAcademicYear == null ||
          _pressureRating == null ||
          _flexibilityRating == null ||
          _communicationRating == null ||
          _timeManagementRating == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('الرجاء إكمال اختيار السنة الدراسية وتقييمات المهارات'),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('تم الانضمام بنجاح! 🎉'),
          content: Text(
            'شكراً لكِ يا ${_nameController.text}.\n\nتم استلام بياناتك وإرسالها بنجاح إلى الإدارة:\n• haboba2662006@gmail.com\n• K.h.gad97@gmail.com',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                _formKey.currentState!.reset();
                setState(() {
                  _selectedAcademicYear = null;
                  _pressureRating = null;
                  _flexibilityRating = null;
                  _communicationRating = null;
                  _timeManagementRating = null;
                });
              },
              child: const Text('حسناً'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aqua Team recruitment'),
        backgroundColor: const Color(0xFF673AB7),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Aqua Team recruitment',
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF673AB7)),
                      ),
                      const SizedBox(height: 8),
                      const Text('تسجيل انضمام لاكوا تيم فرع الاسكندرية', style: TextStyle(fontSize: 16)),
                      const SizedBox(height: 12),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: const Color(0xFF673AB7).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text(
                          'Developed by Eng. Malak Elkhefa 💻✨',
                          style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF673AB7)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              _buildTextField(controller: _nameController, label: 'Name *', hint: 'Short-answer text'),
              _buildTextField(controller: _numberController, label: 'Number *', hint: 'Short-answer text', keyboardType: TextInputType.phone),
              _buildTextField(controller: _emailController, label: 'Email *', hint: 'Short-answer text', keyboardType: TextInputType.emailAddress),
              _buildTextField(controller: _universityController, label: 'University *', hint: 'Short-answer text'),
              _buildTextField(controller: _collegeController, label: 'Collage *', hint: 'Short-answer text'),
              _buildRadioGroupCard(
                title: 'Academic year *',
                options: const ['1', '2', '3', '4', '5', 'Other'],
                groupValue: _selectedAcademicYear,
                onChanged: (val) => setState(() => _selectedAcademicYear = val),
              ),
              _buildRatingCard(
                title: 'How Would you rate your working under pressure skills *',
                groupValue: _pressureRating,
                onChanged: (val) => setState(() => _pressureRating = val),
              ),
              _buildTextField(controller: _volunteerController, label: 'How you participated in any volunteer activities before? *', hint: 'Short-answer text', maxLines: 3),
              _buildRatingCard(
                title: 'How Would you rate your flexibility skills *',
                groupValue: _flexibilityRating,
                onChanged: (val) => setState(() => _flexibilityRating = val),
              ),
              _buildRatingCard(
                title: 'How Would you rate your effective communication skills *',
                groupValue: _communicationRating,
                onChanged: (val) => setState(() => _communicationRating = val),
              ),
              _buildRatingCard(
                title: 'How Would you rate your time management skills *',
                groupValue: _timeManagementRating,
                onChanged: (val) => setState(() => _timeManagementRating = val),
              ),
              _buildTextField(controller: _hobbiesController, label: 'What are you hobbies or passions? *', hint: 'Short-answer text'),
              _buildTextField(controller: _commentsController, label: 'Any comments', hint: 'Short-answer text', isRequired: false),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF673AB7)),
                  onPressed: _submitForm,
                  child: const Text('إرسال (Submit)', style: TextStyle(fontSize: 18, color: Colors.white)),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({required TextEditingController controller, required String label, required String hint, TextInputType keyboardType = TextInputType.text, int maxLines = 1, bool isRequired = true}) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            const SizedBox(height: 8),
            TextFormField(
              controller: controller,
              keyboardType: keyboardType,
              maxLines: maxLines,
              validator: isRequired ? (val) => (val == null || val.trim().isEmpty) ? 'هذا الحقل مطلوب' : null : null,
              decoration: InputDecoration(hintText: hint, border: const UnderlineInputBorder()),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRadioGroupCard({required String title, required List<String> options, required String? groupValue, required ValueChanged<String?> onChanged}) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            ...options.map((opt) => RadioListTile<String>(title: Text(opt), value: opt, groupValue: groupValue, onChanged: onChanged, contentPadding: EdgeInsets.zero)),
          ],
        ),
      ),
    );
  }

  Widget _buildRatingCard({required String title, required int? groupValue, required ValueChanged<int?> onChanged}) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(5, (index) {
                int rating = index + 1;
                return Column(
                  children: [
                    Text('$rating', style: const TextStyle(color: Colors.grey)),
                    Radio<int>(value: rating, groupValue: groupValue, onChanged: onChanged),
                  ],
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
                    
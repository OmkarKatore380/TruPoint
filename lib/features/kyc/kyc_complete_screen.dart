import 'package:flutter/material.dart';
import 'package:trupoint/config/themes.dart';
import 'package:trupoint/core/widgets/custom_text_field.dart';
import 'package:trupoint/shared/widgets/skip_floating_button.dart';

class KycScreen extends StatefulWidget {
  const KycScreen({super.key});

  @override
  State<KycScreen> createState() => _KycScreenState();
}

class _KycScreenState extends State<KycScreen> {
  final _panController = TextEditingController();
  final _dobController = TextEditingController();
  final _addressController = TextEditingController();
  final _cityController = TextEditingController();
  final _stateController = TextEditingController();
  bool _isSubmitting = false;

  @override
  void dispose() {
    _panController.dispose();
    _dobController.dispose();
    _addressController.dispose();
    _cityController.dispose();
    _stateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppThemes.backgroundGrey,
      appBar: AppBar(
        title: const Text('Complete KYC'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(AppThemes.radiusMedium),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.info_outline, color: AppThemes.primaryBlue),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          'KYC is mandatory as per SEBI regulations to view stock recommendations',
                          style: TextStyle(fontSize: 13, color: AppThemes.primaryBlue),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  'Identity Verification',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  hint: 'PAN Card Number',
                  controller: _panController,
                  prefixIcon: Icons.credit_card,
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  hint: 'Date of Birth (DD/MM/YYYY)',
                  controller: _dobController,
                  prefixIcon: Icons.cake_outlined,
                  keyboardType: TextInputType.datetime,
                ),
                const SizedBox(height: 24),
                const Text(
                  'Address Details',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  hint: 'Full Address',
                  controller: _addressController,
                  prefixIcon: Icons.location_on_outlined,
                  maxLines: 3,
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  hint: 'City',
                  controller: _cityController,
                  prefixIcon: Icons.location_city_outlined,
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  hint: 'State',
                  controller: _stateController,
                  prefixIcon: Icons.map_outlined,
                ),
                const SizedBox(height: 24),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(AppThemes.radiusMedium),
                    border: Border.all(color: Colors.grey.shade300, width: 2, style: BorderStyle.solid),
                  ),
                  child: Column(
                    children: [
                      Icon(Icons.upload_file, size: 48, color: AppThemes.primaryBlue),
                      const SizedBox(height: 12),
                      const Text(
                        'Upload ID Proof',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'PAN Card, Aadhaar, or Passport',
                        style: TextStyle(
                          fontSize: 12,
                          color: AppThemes.textGrey,
                        ),
                      ),
                      const SizedBox(height: 16),
                      OutlinedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.cloud_upload),
                        label: const Text('Choose File'),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton(
                    onPressed: _isSubmitting
                        ? null
                        : () {
                            setState(() => _isSubmitting = true);
                            Future.delayed(const Duration(seconds: 2), () {
                              if (mounted) {
                                Navigator.of(context).pushReplacementNamed('/dashboard');
                              }
                            });
                          },
                    child: _isSubmitting
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2,
                            ),
                          )
                        : const Text('Submit KYC'),
                  ),
                ),
                const SizedBox(height: 60),
              ],
            ),
          ),
          const SkipFloatingButton(nextRoute: '/dashboard'),
        ],
      ),
    );
  }
}

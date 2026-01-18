import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trupoint/config/routes.dart';
import 'package:trupoint/config/themes.dart';
import 'package:trupoint/shared/widgets/skip_floating_button.dart';

class WhatsAppOtpScreen extends StatefulWidget {
  const WhatsAppOtpScreen({super.key});

  @override
  State<WhatsAppOtpScreen> createState() => _WhatsAppOtpScreenState();
}

class _WhatsAppOtpScreenState extends State<WhatsAppOtpScreen> {
  final _phoneController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                const Text(
                  'WhatsApp Login',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: AppThemes.textDark,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'We\'ll send you an OTP via WhatsApp',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppThemes.textGrey,
                  ),
                ),
                const SizedBox(height: 40),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.green.shade50,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.phone, color: Colors.green.shade700),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'WhatsApp Verification',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Secure OTP via WhatsApp Business API',
                              style: TextStyle(
                                fontSize: 12,
                                color: AppThemes.textGrey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                TextField(
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    hintText: 'Enter WhatsApp Number',
                    prefixIcon: Icon(Icons.phone_outlined),
                    prefixText: '+91 ',
                  ),
                ),
                const SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton(
                    onPressed: _isLoading
                        ? null
                        : () {
                            setState(() => _isLoading = true);
                            Future.delayed(const Duration(seconds: 1), () {
                              context.push(AppRoutes.otp, extra: '1234567890');
                            });
                          },
                    child: _isLoading
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2,
                            ),
                          )
                        : const Text('Send OTP'),
                  ),
                ),
              ],
            ),
          ),
          const SkipFloatingButton(nextRoute: '/packages'),
        ],
      ),
    );
  }
}

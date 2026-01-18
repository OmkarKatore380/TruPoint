import 'package:flutter/material.dart';
import 'package:trupoint/config/themes.dart';
import 'package:trupoint/shared/widgets/skip_floating_button.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Row(
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: AppThemes.primaryBlue,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.shield_outlined, color: Colors.white, size: 18),
            ),
            const SizedBox(width: 8),
            const Text('TruPoint', style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined, color: AppThemes.primaryBlue),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const Icon(Icons.shield_outlined, size: 64, color: Colors.black),
            const SizedBox(height: 16),
            const Text(
              'Privacy Policy',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            const Text(
              'Options Money only collects the necessary personally identifiable Information in order to respond to your requests for our services. Personal identifiable information includes, but is not limited to, first and last name, e-mail address, phone numbers, profession, address and any other information that itself identifies or when tied to the above information, may identify you as a specific individual.',
              style: TextStyle(fontSize: 14, color: AppThemes.textGrey, height: 1.6),
            ),
            const SizedBox(height: 16),
            const Text(
              'This Website does not collect personally identifiable information about you except when you specifically and knowingly provide it.',
              style: TextStyle(fontSize: 14, color: AppThemes.textGrey, height: 1.6),
            ),
            const SizedBox(height: 16),
            const Text(
              'By registering your mobile number on Options Money website, you agree to be contacted by our personnel or send you SMSs even if your contact number is on DND (Do not Disturb).',
              style: TextStyle(fontSize: 14, color: AppThemes.textGrey, height: 1.6),
            ),
            const SizedBox(height: 16),
            const Text(
              'Collecting information about you is necessary in order for us to provide you with high quality services. Purposes for collecting information generally include providing products or services requested, confirming your identity, protecting against fraud, or dealing with matters concerning the relationship between us. As there is a great risk of giving of your personal information and we understand your concern, so, our way of maintaining the information is such that we assure you of the points:',
              style: TextStyle(fontSize: 14, color: AppThemes.textGrey, height: 1.6),
            ),
            const SizedBox(height: 16),
            const Text(
              '• We only use your personal information to provide you the service at your account.',
              style: TextStyle(fontSize: 14, color: AppThemes.textGrey, height: 1.6),
            ),
          ],
        ),
      ),
    );
  }
}

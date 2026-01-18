import 'package:flutter/material.dart';
import 'package:trupoint/config/themes.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppThemes.backgroundGrey,
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
        child: Column(
          children: [
            // Contact Us Header
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: const Center(
                child: Text(
                  'Contact Us',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: AppThemes.primaryBlue,
                  ),
                ),
              ),
            ),
            
            const SizedBox(height: 32),
            
            // Headset Icon
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: AppThemes.primaryBlue.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.headset_mic_outlined,
                size: 40,
                color: AppThemes.primaryBlue,
              ),
            ),
            
            const SizedBox(height: 32),
            
            // Contact Cards
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  _buildContactCard(
                    icon: Icons.access_time,
                    title: 'Office Business hours',
                    subtitle: '9 AM to 6 PM, Monday to Friday',
                  ),
                  const SizedBox(height: 16),
                  _buildContactCard(
                    icon: Icons.phone_outlined,
                    title: 'Customer support',
                    subtitle: '+91-8828842168',
                    isClickable: true,
                  ),
                  const SizedBox(height: 16),
                  _buildContactCard(
                    icon: Icons.email_outlined,
                    title: 'Email Us',
                    subtitle: 'compliance@optionsmoney.in',
                    isClickable: true,
                  ),
                  const SizedBox(height: 16),
                  _buildContactCard(
                    icon: Icons.location_on_outlined,
                    title: 'Address',
                    subtitle: 'Reliable Business Park, Airoli,\nNavi Mumbai, Maharashtra 400708',
                  ),
                  const SizedBox(height: 16),
                  _buildContactCard(
                    icon: Icons.chat_bubble_outline,
                    title: 'Chat with us on WhatsApp',
                    subtitle: '+91 9137394437',
                    isClickable: true,
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildContactCard({
    required IconData icon,
    required String title,
    required String subtitle,
    bool isClickable = false,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: AppThemes.primaryBlue.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, size: 24, color: AppThemes.primaryBlue),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppThemes.textDark,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 14,
                    color: AppThemes.textGrey,
                    decoration: isClickable ? TextDecoration.underline : null,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

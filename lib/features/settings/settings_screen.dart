import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trupoint/config/routes.dart';
import 'package:trupoint/config/themes.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

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
      body: Column(
        children: [
          // Settings Header
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: const Center(
              child: Text(
                'Settings',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: AppThemes.primaryBlue,
                ),
              ),
            ),
          ),
          
          const SizedBox(height: 16),
          
          // Settings List
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                _buildMenuItem(
                  context,
                  icon: Icons.headset_mic_outlined,
                  title: 'Contact Us',
                  onTap: () => context.push(AppRoutes.contactUs),
                ),
                const Divider(height: 1, indent: 56),
                _buildMenuItem(
                  context,
                  icon: Icons.shield_outlined,
                  title: 'Privacy Policy',
                  onTap: () => context.push(AppRoutes.privacyPolicy),
                ),
                const Divider(height: 1, indent: 56),
                _buildMenuItem(
                  context,
                  icon: Icons.description_outlined,
                  title: 'Terms and Conditions',
                  onTap: () => context.push(AppRoutes.termsConditions),
                ),
                const Divider(height: 1, indent: 56),
                _buildMenuItem(
                  context,
                  icon: Icons.receipt_long_outlined,
                  title: 'Refund Policy',
                  onTap: () => context.push(AppRoutes.refundPolicy),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Row(
          children: [
            Icon(icon, size: 24, color: AppThemes.textDark),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppThemes.textDark,
                ),
              ),
            ),
            const Icon(Icons.chevron_right, color: AppThemes.textGrey),
          ],
        ),
      ),
    );
  }
}

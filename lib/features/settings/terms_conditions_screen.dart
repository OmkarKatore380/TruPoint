import 'package:flutter/material.dart';
import 'package:trupoint/config/themes.dart';

class TermsConditionsScreen extends StatelessWidget {
  const TermsConditionsScreen({super.key});

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
            const Icon(Icons.description_outlined, size: 64, color: Colors.black),
            const SizedBox(height: 16),
            const Text(
              'Terms and Conditions',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            const Text(
              'By accessing this website, you agree to be governed by the terms and conditions listed below. We have the right to modify these terms and conditions at any time. Your continuing use shall constitute your agreement to any new or modified terms and conditions that we may impose. "Terms and conditions" also applies to the phrase "Options Money" refers to the website, its owners, and the owner\'s employees and affiliates.',
              style: TextStyle(fontSize: 14, color: AppThemes.textGrey, height: 1.6),
            ),
            const SizedBox(height: 16),
            const Text(
              '• We do not provide any guaranteed profit services or Fixed Returns on investments in the securities market since they are subject to market risk.',
              style: TextStyle(fontSize: 14, color: AppThemes.textGrey, height: 1.6),
            ),
            const SizedBox(height: 12),
            const Text(
              '• Before obtaining Expert Advice or any other services from Options Money, clients should read the company\'s disclaimer, terms and conditions, and refund policy. We do not accept advisory fees in any personal or individual bank account; any payment made should be made in the name of Options Money.',
              style: TextStyle(fontSize: 14, color: AppThemes.textGrey, height: 1.6),
            ),
            const SizedBox(height: 12),
            const Text(
              '• Investing and trading in the stock market is a high-risk endeavor. Profit and loss are both involved. Due to the exaggeration of profit and loss due to leverage, our advisory service provides trading guidance in which both goal and stop loss are indicated; nevertheless, trade execution is exclusively the responsibility of the customer.',
              style: TextStyle(fontSize: 14, color: AppThemes.textGrey, height: 1.6),
            ),
          ],
        ),
      ),
    );
  }
}

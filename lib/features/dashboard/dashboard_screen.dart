import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:trupoint/config/themes.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  String _getUserDisplayName() {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      // Try display name first
      if (user.displayName != null && user.displayName!.isNotEmpty) {
        return user.displayName!;
      }
      // Then email (get part before @)
      if (user.email != null && user.email!.isNotEmpty) {
        return user.email!.split('@')[0];
      }
      // Then phone number
      if (user.phoneNumber != null && user.phoneNumber!.isNotEmpty) {
        return user.phoneNumber!;
      }
    }
    return 'User';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppThemes.backgroundGrey,
      body: SafeArea(
        child: Column(
          children: [
            // Gradient Header with Profile
            Container(
              decoration: const BoxDecoration(
                gradient: AppThemes.headerGradient,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Hi, ${_getUserDisplayName()}',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.person,
                      color: AppThemes.primaryBlue,
                      size: 24,
                    ),
                  ),
                ],
              ),
            ),
            
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Market Today Section
                    const Text(
                      'Market Today',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: AppThemes.textDark,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(child: _buildMarketCard('NIFTY 50', '19650.35')),
                        const SizedBox(width: 12),
                        Expanded(child: _buildMarketCard('SENSEX', '65890.70')),
                        const SizedBox(width: 12),
                        Expanded(child: _buildMarketCard('BANKNIFTY', '44560.05')),
                      ],
                    ),
                    
                    const SizedBox(height: 24),
                    
                    // Today's Picks Section
                    const Text(
                      "Today's Picks",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: AppThemes.textDark,
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildStockPickCard(
                      'NIFTY OCT FUT',
                      'Target: 19800 | SL: 19500',
                    ),
                    const SizedBox(height: 12),
                    _buildStockPickCard(
                      'NIFTY OCT FUT',
                      'Target: 19800 | SL: 19500',
                    ),
                    const SizedBox(height: 12),
                    _buildStockPickCard(
                      'NIFTY OCT FUT',
                      'Target: 19800 | SL: 19500',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMarketCard(String title, String value) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 11,
                color: AppThemes.textGrey,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              value,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: AppThemes.textDark,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStockPickCard(String title, String subtitle) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: AppThemes.primaryBlue,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.show_chart,
                color: Colors.white,
                size: 24,
              ),
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
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 13,
                      color: AppThemes.textGrey,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: AppThemes.primaryBlue.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                'BUY',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: AppThemes.primaryBlue,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

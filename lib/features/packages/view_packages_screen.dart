import 'package:flutter/material.dart';
import 'package:trupoint/config/themes.dart';

class ViewPackagesScreen extends StatelessWidget {
  const ViewPackagesScreen({super.key});

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
        title: const Text('Packages', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildPackageCard(
            name: 'Basic Package',
            price: '₹10,000',
            duration: '1 Month',
            features: [
              'Daily 2-3 Stock Tips',
              'Email Support',
              'Basic Market Analysis',
            ],
            isActive: false,
          ),
          const SizedBox(height: 16),
          _buildPackageCard(
            name: 'Premium Package',
            price: '₹60,000',
            duration: '6 Months',
            features: [
              'Daily 5-7 Stock Tips',
              'Priority Support',
              'Advanced Market Analysis',
              'Weekly Portfolio Review',
              'Dedicated Advisor',
            ],
            isActive: true,
          ),
          const SizedBox(height: 16),
          _buildPackageCard(
            name: 'Elite Package',
            price: '₹1,50,000',
            duration: '1 Year',
            features: [
              'Unlimited Stock Tips',
              '24/7 Support',
              'Premium Market Analysis',
              'Daily Portfolio Review',
              'Personal Advisor',
              'Exclusive Webinars',
            ],
            isActive: false,
          ),
        ],
      ),
    );
  }

  Widget _buildPackageCard({
    required String name,
    required String price,
    required String duration,
    required List<String> features,
    required bool isActive,
  }) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppThemes.textDark,
                  ),
                ),
                if (isActive)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.green.shade50,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.green),
                    ),
                    child: const Text(
                      'Active',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.green,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Text(
                  price,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: AppThemes.primaryBlue,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  '/ $duration',
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppThemes.textGrey,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Divider(),
            const SizedBox(height: 12),
            ...features.map((feature) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                children: [
                  const Icon(Icons.check_circle, color: Colors.green, size: 20),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      feature,
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppThemes.textDark,
                      ),
                    ),
                  ),
                ],
              ),
            )),
            const SizedBox(height: 16),
            if (!isActive)
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Subscribe Now'),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trupoint/config/themes.dart';
import 'package:trupoint/shared/widgets/skip_floating_button.dart';

class PackageSelectionScreen extends StatelessWidget {
  const PackageSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppThemes.backgroundGrey,
      appBar: AppBar(
        title: const Text('Choose Your Package'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          ListView(
            padding: const EdgeInsets.all(20),
            children: [
              const Text(
                'Select the package that fits your needs',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: AppThemes.textGrey,
                ),
              ),
              const SizedBox(height: 24),
              _buildPackageCard(
                context,
                name: 'Basic',
                price: '₹10,000',
                duration: '1 Month',
                features: [
                  '2-3 Stock Tips Daily',
                  'Email Support',
                  'Basic Market Analysis',
                ],
                isPopular: false,
              ),
              const SizedBox(height: 16),
              _buildPackageCard(
                context,
                name: 'Premium',
                price: '₹60,000',
                duration: '6 Months',
                features: [
                  '5-7 Stock Tips Daily',
                  'Priority Support',
                  'Advanced Market Analysis',
                  'Weekly Portfolio Review',
                  'Dedicated Advisor',
                ],
                isPopular: true,
              ),
              const SizedBox(height: 16),
              _buildPackageCard(
                context,
                name: 'Elite',
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
                isPopular: false,
              ),
            ],
          ),
          const SkipFloatingButton(nextRoute: '/kyc'),
        ],
      ),
    );
  }

  Widget _buildPackageCard(
    BuildContext context, {
    required String name,
    required String price,
    required String duration,
    required List<String> features,
    required bool isPopular,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppThemes.radiusMedium),
        border: isPopular
            ? Border.all(color: AppThemes.primaryBlue, width: 2)
            : null,
        boxShadow: AppThemes.softShadow,
      ),
      child: Column(
        children: [
          if (isPopular)
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              decoration: const BoxDecoration(
                gradient: AppThemes.headerGradient,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(14),
                  topRight: Radius.circular(14),
                ),
              ),
              child: const Center(
                child: Text(
                  '🔥 MOST POPULAR',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppThemes.textDark,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      price,
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: AppThemes.primaryBlue,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: Text(
                        '/ $duration',
                        style: const TextStyle(
                          fontSize: 14,
                          color: AppThemes.textGrey,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                ...features.map((feature) => Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.check_circle,
                            color: Colors.green,
                            size: 20,
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              feature,
                              style: const TextStyle(fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                    )),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => context.push('/kyc'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isPopular
                          ? AppThemes.primaryBlue
                          : Colors.white,
                      foregroundColor:
                          isPopular ? Colors.white : AppThemes.primaryBlue,
                      side: isPopular
                          ? null
                          : const BorderSide(color: AppThemes.primaryBlue),
                    ),
                    child: const Text('Buy Now'),
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

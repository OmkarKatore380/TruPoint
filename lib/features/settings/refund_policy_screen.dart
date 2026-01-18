import 'package:flutter/material.dart';
import 'package:trupoint/config/themes.dart';

class RefundPolicyScreen extends StatelessWidget {
  const RefundPolicyScreen({super.key});

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
            const Icon(Icons.receipt_long_outlined, size: 64, color: Colors.black),
            const SizedBox(height: 16),
            const Text(
              'Refund Policy',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            const Text(
              'Our focus is complete customer satisfaction. All payments towards services offered by us are final.',
              style: TextStyle(fontSize: 14, color: AppThemes.textGrey, height: 1.6),
            ),
            const SizedBox(height: 16),
            const Text(
              'Options Money offers a demo evaluation to ensure that our products and services will meet your needs without the need to purchase, there will be ABSOLUTELY NO REFUNDS and CANCELLATIONS.',
              style: TextStyle(fontSize: 14, color: AppThemes.textGrey, height: 1.6),
            ),
            const SizedBox(height: 16),
            const Text(
              'Before deciding to subscribe to our services, please make sure to take a demo, the evaluation version that we provide. Once you start and offer refunds to subscriptions that have already been taken.',
              style: TextStyle(fontSize: 14, color: AppThemes.textGrey, height: 1.6),
            ),
            const SizedBox(height: 16),
            const Text(
              'We value our customers and are committed to providing the best services to our clients. However our clients need to realize that we do not offer a 100% guarantee on our calls, hence cannot offer any refund on subscriptions regardless of the individual client\'s performance. Once a service has been subscribed to and payment made for the same can\'t be cancelled or refunded in any case.',
              style: TextStyle(fontSize: 14, color: AppThemes.textGrey, height: 1.6),
            ),
            const SizedBox(height: 16),
            const Text(
              'If for any unforeseen circumstances, the client is not satisfied with our services, they may call us on our customer care to seek directions on future calls.',
              style: TextStyle(fontSize: 14, color: AppThemes.textGrey, height: 1.6),
            ),
            const SizedBox(height: 16),
            const Text(
              'We will give our best efforts to increase the satisfaction level in such cases. We have clearly communicated the risk of loss of the capital as well as gains to our clients when subscribing to any of our services. Any request to cancel a service or get a refund will NOT be accepted in any case.',
              style: TextStyle(fontSize: 14, color: AppThemes.textGrey, height: 1.6),
            ),
          ],
        ),
      ),
    );
  }
}

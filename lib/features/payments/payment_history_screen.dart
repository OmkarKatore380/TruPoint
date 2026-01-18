import 'package:flutter/material.dart';
import 'package:trupoint/config/themes.dart';

class PaymentHistoryScreen extends StatelessWidget {
  const PaymentHistoryScreen({super.key});

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
        title: const Text('Payment History', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list, color: AppThemes.primaryBlue),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildPaymentCard(
            date: '4th Sept 2024',
            time: '5:00 AM',
            packageName: 'Premium Package',
            amount: '60,000',
            status: 'Success',
            transactionId: 'TXN123456789',
          ),
          const SizedBox(height: 12),
          _buildPaymentCard(
            date: '4th Aug 2024',
            time: '3:30 PM',
            packageName: 'Basic Package',
            amount: '10,000',
            status: 'Success',
            transactionId: 'TXN123456788',
          ),
          const SizedBox(height: 12),
          _buildPaymentCard(
            date: '25th July 2024',
            time: '11:15 AM',
            packageName: 'Premium Package',
            amount: '50,000',
            status: 'Success',
            transactionId: 'TXN123456787',
          ),
          const SizedBox(height: 12),
          _buildPaymentCard(
            date: '15th July 2024',
            time: '2:45 PM',
            packageName: 'Basic Package',
            amount: '2,000',
            status: 'Failed',
            transactionId: 'TXN123456786',
          ),
          const SizedBox(height: 12),
          _buildPaymentCard(
            date: '10th June 2024',
            time: '4:20 PM',
            packageName: 'Premium Package',
            amount: '1,000',
            status: 'Success',
            transactionId: 'TXN123456785',
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentCard({
    required String date,
    required String time,
    required String packageName,
    required String amount,
    required String status,
    required String transactionId,
  }) {
    final bool isSuccess = status == 'Success';
    
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: isSuccess 
                    ? Colors.green.shade50 
                    : Colors.red.shade50,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                isSuccess ? Icons.check_circle : Icons.cancel,
                color: isSuccess ? Colors.green : Colors.red,
                size: 24,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    packageName,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppThemes.textDark,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '$date at $time',
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppThemes.textGrey,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'ID: $transactionId',
                    style: const TextStyle(
                      fontSize: 11,
                      color: AppThemes.textGrey,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '₹$amount',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: isSuccess ? Colors.green : Colors.red,
                  ),
                ),
                const SizedBox(height: 4),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: isSuccess 
                        ? Colors.green.shade50 
                        : Colors.red.shade50,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    status,
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: isSuccess ? Colors.green : Colors.red,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

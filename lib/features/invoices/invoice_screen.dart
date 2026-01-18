import 'package:flutter/material.dart';
import 'package:trupoint/config/themes.dart';

class InvoiceScreen extends StatelessWidget {
  const InvoiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppThemes.backgroundGrey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: const Text('Invoices', style: TextStyle(fontWeight: FontWeight.bold)),
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
          _buildInvoiceCard(
            invoiceNumber: 'INV-2024-001',
            date: '15 Jan 2024',
            packageName: 'Premium Package',
            amount: '60,000',
            status: 'Paid',
            dueDate: '15 Jan 2024',
          ),
          const SizedBox(height: 12),
          _buildInvoiceCard(
            invoiceNumber: 'INV-2023-125',
            date: '10 Dec 2023',
            packageName: 'Basic Package',
            amount: '10,000',
            status: 'Paid',
            dueDate: '10 Dec 2023',
          ),
          const SizedBox(height: 12),
          _buildInvoiceCard(
            invoiceNumber: 'INV-2023-098',
            date: '05 Nov 2023',
            packageName: 'Premium Package',
            amount: '50,000',
            status: 'Paid',
            dueDate: '05 Nov 2023',
          ),
          const SizedBox(height: 12),
          _buildInvoiceCard(
            invoiceNumber: 'INV-2023-067',
            date: '20 Oct 2023',
            packageName: 'Elite Package',
            amount: '1,50,000',
            status: 'Overdue',
            dueDate: '20 Oct 2023',
          ),
        ],
      ),
    );
  }

  Widget _buildInvoiceCard({
    required String invoiceNumber,
    required String date,
    required String packageName,
    required String amount,
    required String status,
    required String dueDate,
  }) {
    final bool isPaid = status == 'Paid';
    
    return Card(
      child: InkWell(
        onTap: () {
          // TODO: Open invoice details
        },
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    invoiceNumber,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppThemes.textDark,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: isPaid ? Colors.green.shade50 : Colors.red.shade50,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: isPaid ? Colors.green : Colors.red,
                      ),
                    ),
                    child: Text(
                      status,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: isPaid ? Colors.green : Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Icon(Icons.calendar_today, size: 16, color: AppThemes.textGrey),
                  const SizedBox(width: 8),
                  Text(
                    'Date: $date',
                    style: const TextStyle(
                      fontSize: 13,
                      color: AppThemes.textGrey,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Icon(Icons.inventory_2_outlined, size: 16, color: AppThemes.textGrey),
                  const SizedBox(width: 8),
                  Text(
                    packageName,
                    style: const TextStyle(
                      fontSize: 13,
                      color: AppThemes.textGrey,
                    ),
                  ),
                ],
              ),
              const Divider(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total Amount',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppThemes.textGrey,
                    ),
                  ),
                  Text(
                    '₹$amount',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppThemes.primaryBlue,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: () {
                    // TODO: Download invoice PDF
                  },
                  icon: const Icon(Icons.download, size: 18),
                  label: const Text('Download Invoice'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppThemes.primaryBlue,
                    side: const BorderSide(color: AppThemes.primaryBlue),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:trupoint/core/widgets/custom_text_field.dart';

class KycScreen extends StatefulWidget {
  const KycScreen({super.key});

  @override
  State<KycScreen> createState() => _KycScreenState();
}

class _KycScreenState extends State<KycScreen> {
  final _panController = TextEditingController();
  final _addressController = TextEditingController();
  bool _isVerifying = false;

  void _startDigioFlow() {
    setState(() => _isVerifying = true);
    // Simulate Digio SDK Flow
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        setState(() => _isVerifying = false);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('KYC Submitted Successfully! Verifying documents...')),
        );
        Navigator.pop(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Complete KYC')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Identity Verification',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'As per SEBI regulations, KYC is mandatory to view stock recommendations.',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 40),
            CustomTextField(
              hint: 'PAN Number (ABCDE1234F)',
              controller: _panController,
            ),
            const SizedBox(height: 24),
            CustomTextField(
              hint: 'Full Address',
              controller: _addressController,
              maxLines: 3,
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: _isVerifying ? null : _startDigioFlow,
                child: _isVerifying
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text('Start Digio KYC Verification'),
              ),
            ),
            const SizedBox(height: 20),
            const Row(
              children: [
                Icon(Icons.security, color: Colors.green, size: 16),
                SizedBox(width: 8),
                Text('Your data is encrypted and secure', style: TextStyle(fontSize: 12, color: Colors.green)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

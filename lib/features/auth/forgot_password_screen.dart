import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trupoint/config/routes.dart';
import 'package:trupoint/core/widgets/custom_text_field.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => context.pop(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 60),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              
              // Lock Icon
              Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.black, width: 2),
                ),
                child: const Icon(Icons.lock_outline, size: 32),
              ),
              
              const SizedBox(height: 24),
              
              // Title
              const Text(
                'Forgot Password',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              
              const SizedBox(height: 16),
              
              // Subtitle
              const Text(
                'Enter Your Email Id or Phone Number to\nSend the OTP Code',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF6B7280),
                  height: 1.5,
                ),
              ),
              
              const SizedBox(height: 40),
              
              // Email/Phone Field
              CustomTextField(
                hint: 'Email Id or Phone Number',
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
              ),
              
              const SizedBox(height: 32),
              
              // Send OTP Button
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: () {
                    // In a real app, send OTP here
                    context.push(AppRoutes.otp, extra: 'dummy_verification_id');
                  },
                  child: const Text('Send OTP'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

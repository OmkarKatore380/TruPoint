import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:trupoint/features/auth/login_screen.dart';
import 'package:trupoint/features/auth/otp_screen.dart';
import 'package:trupoint/features/auth/signup_screen.dart';
import 'package:trupoint/features/auth/forgot_password_screen.dart';
import 'package:trupoint/core/widgets/main_navigation_wrapper.dart';
import 'package:trupoint/features/kyc/kyc_screen.dart';
import 'package:trupoint/features/profile/contact_us_screen.dart';
import 'package:trupoint/features/settings/privacy_policy_screen.dart';
import 'package:trupoint/features/settings/terms_conditions_screen.dart';
import 'package:trupoint/features/settings/refund_policy_screen.dart';
import 'package:trupoint/features/settings/settings_screen.dart';
import 'package:trupoint/features/packages/view_packages_screen.dart';
import 'package:trupoint/features/payments/payment_history_screen.dart';
import 'package:trupoint/features/profile/edit_profile_screen.dart';
import 'package:trupoint/features/notifications/notifications_screen.dart';
import 'package:trupoint/features/auth/splash_screen.dart';
import 'package:trupoint/features/auth/whatsapp_otp_screen.dart';
import 'package:trupoint/features/packages/package_selection_screen.dart';
import 'package:trupoint/features/kyc/kyc_complete_screen.dart' as kyc_complete;
import 'package:trupoint/features/reports/reports_screen.dart';

class AppRoutes {
  static const String login = '/login';
  static const String signup = '/signup';
  static const String forgotPassword = '/forgot-password';
  static const String otp = '/otp';
  static const String dashboard = '/dashboard';
  static const String packages = '/packages';
  static const String kyc = '/kyc';
  static const String contactUs = '/contact-us';
  static const String privacyPolicy = '/privacy-policy';
  static const String termsConditions = '/terms-conditions';
  static const String refundPolicy = '/refund-policy';
  static const String settings = '/settings';
  static const String viewPackages = '/view-packages';
  static const String paymentHistory = '/payment-history';
  static const String editProfile = '/edit-profile';
  static const String notifications = '/notifications';
  static const String splash = '/splash';
  static const String whatsappOtp = '/whatsapp-otp';
  static const String reports = '/reports';

  static final GoRouter router = GoRouter(
    initialLocation: login,
    routes: [
      GoRoute(
        path: login,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: signup,
        builder: (context, state) => const SignupScreen(),
      ),
      GoRoute(
        path: forgotPassword,
        builder: (context, state) => const ForgotPasswordScreen(),
      ),
      GoRoute(
        path: otp,
        builder: (context, state) {
          final verificationId = state.extra as String;
          return OtpVerificationScreen(verificationId: verificationId);
        },
      ),
      GoRoute(
        path: dashboard,
        builder: (context, state) => const MainNavigationWrapper(),
      ),
      GoRoute(
        path: packages,
        builder: (context, state) => const PackageSelectionScreen(),
      ),
      GoRoute(
        path: kyc,
        builder: (context, state) => const kyc_complete.KycScreen(),
      ),
      GoRoute(
        path: contactUs,
        builder: (context, state) => const ContactUsScreen(),
      ),
      GoRoute(
        path: privacyPolicy,
        builder: (context, state) => const PrivacyPolicyScreen(),
      ),
      GoRoute(
        path: termsConditions,
        builder: (context, state) => const TermsConditionsScreen(),
      ),
      GoRoute(
        path: refundPolicy,
        builder: (context, state) => const RefundPolicyScreen(),
      ),
      GoRoute(
        path: settings,
        builder: (context, state) => const SettingsScreen(),
      ),
      GoRoute(
        path: viewPackages,
        builder: (context, state) => const ViewPackagesScreen(),
      ),
      GoRoute(
        path: paymentHistory,
        builder: (context, state) => const PaymentHistoryScreen(),
      ),
      GoRoute(
        path: editProfile,
        builder: (context, state) => const EditProfileScreen(),
      ),
      GoRoute(
        path: notifications,
        builder: (context, state) => const NotificationsScreen(),
      ),
      GoRoute(
        path: splash,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: whatsappOtp,
        builder: (context, state) => const WhatsAppOtpScreen(),
      ),
      GoRoute(
        path: reports,
        builder: (context, state) => const ReportsScreen(),
      ),
    ],
  );
}

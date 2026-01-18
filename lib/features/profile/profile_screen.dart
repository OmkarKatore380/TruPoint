import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:trupoint/config/routes.dart';
import 'package:trupoint/config/themes.dart';
import 'package:trupoint/features/auth/auth_cubit.dart';
import 'package:trupoint/shared/widgets/skip_floating_button.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  String _getUserDisplayName() {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      if (user.displayName != null && user.displayName!.isNotEmpty) {
        return user.displayName!;
      }
      if (user.email != null && user.email!.isNotEmpty) {
        return user.email!.split('@')[0];
      }
      if (user.phoneNumber != null && user.phoneNumber!.isNotEmpty) {
        return user.phoneNumber!;
      }
    }
    return 'User Name';
  }

  String _getUserEmail() {
    final user = FirebaseAuth.instance.currentUser;
    return user?.email ?? 'user@example.com';
  }

  void _showProfileOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.photo_camera, color: AppThemes.primaryBlue),
              title: const Text('Change Profile Picture'),
              onTap: () {
                Navigator.pop(context);
                // TODO: Implement image picker
              },
            ),
            ListTile(
              leading: const Icon(Icons.edit, color: AppThemes.primaryBlue),
              title: const Text('Edit Profile'),
              onTap: () {
                Navigator.pop(context);
                context.push(AppRoutes.editProfile);
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: CustomScrollView(
          slivers: [
            // Gradient App Bar
            SliverAppBar(
              expandedHeight: 280,
              floating: false,
              pinned: true,
              backgroundColor: AppThemes.primaryBlue,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFF1E90FF),
                        Color(0xFF4DA8FF),
                        Color(0xFF7BC8FF),
                      ],
                    ),
                  ),
                  child: SafeArea(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 40),
                        // Profile Photo with Edit Button
                        GestureDetector(
                          onTap: () => _showProfileOptions(context),
                          child: Hero(
                            tag: 'profile_photo',
                            child: Stack(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(color: Colors.white, width: 4),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.2),
                                        blurRadius: 20,
                                        offset: const Offset(0, 10),
                                      ),
                                    ],
                                  ),
                                  child: CircleAvatar(
                                    radius: 60,
                                    backgroundColor: Colors.white,
                                    child: Icon(
                                      Icons.person,
                                      size: 60,
                                      color: AppThemes.primaryBlue,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.2),
                                          blurRadius: 8,
                                        ),
                                      ],
                                    ),
                                    child: const Icon(
                                      Icons.camera_alt,
                                      size: 20,
                                      color: AppThemes.primaryBlue,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        // User Name
                        Text(
                          _getUserDisplayName(),
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 4),
                        // Email
                        Text(
                          _getUserEmail(),
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            
            // Content
            SliverToBoxAdapter(
              child: Container(
                color: AppThemes.backgroundGrey,
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    
                    // Package Cards
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          Expanded(
                            child: _buildAnimatedPackageCard(
                              context: context,
                              title: 'None',
                              subtitle: 'Active Package',
                              icon: Icons.inventory_2_outlined,
                              gradient: const LinearGradient(
                                colors: [Color(0xFF7F7FD5), Color(0xFF86A8E7), Color(0xFF91EAE4)],
                              ),
                              onTap: () => context.push(AppRoutes.viewPackages),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: _buildAnimatedPackageCard(
                              context: context,
                              title: '₹60,000',
                              subtitle: 'Last Payment',
                              icon: Icons.account_balance_wallet_outlined,
                              gradient: const LinearGradient(
                                colors: [Color(0xFFF093FB), Color(0xFFF5576C)],
                              ),
                              onTap: () => context.push(AppRoutes.paymentHistory),
                            ),
                          ),
                        ],
                      ),
                    ),
                    
                    const SizedBox(height: 24),
                    
                    // Settings Menu
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          _buildMenuTile(
                            icon: Icons.edit_outlined,
                            title: 'Edit Profile',
                            subtitle: 'Update your personal information',
                            onTap: () => context.push(AppRoutes.editProfile),
                          ),
                          const Divider(height: 1, indent: 68),
                          _buildMenuTile(
                            icon: Icons.notifications_outlined,
                            title: 'Notifications',
                            subtitle: 'Manage notification settings',
                            onTap: () => context.push(AppRoutes.notifications),
                          ),
                          const Divider(height: 1, indent: 68),
                          _buildMenuTile(
                            icon: Icons.assessment_outlined,
                            title: 'Accuracy Reports',
                            subtitle: 'View your trading performance',
                            onTap: () => context.push(AppRoutes.reports),
                          ),
                          const Divider(height: 1, indent: 68),
                          _buildMenuTile(
                            icon: Icons.settings_outlined,
                            title: 'Settings',
                            subtitle: 'App settings and preferences',
                            onTap: () => context.push(AppRoutes.settings),
                          ),
                          const Divider(height: 1, indent: 68),
                          _buildMenuTile(
                            icon: Icons.logout,
                            title: 'Logout',
                            subtitle: 'Sign out from your account',
                            titleColor: Colors.red,
                            onTap: () {
                              context.read<AuthCubit>().logout();
                              context.go(AppRoutes.login);
                            },
                          ),
                        ],
                      ),
                    ),
                    
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAnimatedPackageCard({
    required BuildContext context,
    required String title,
    required String subtitle,
    required IconData icon,
    required Gradient gradient,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 15,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            children: [
              Positioned(
                right: -20,
                top: -20,
                child: Icon(
                  icon,
                  size: 100,
                  color: Colors.white.withOpacity(0.2),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(icon, color: Colors.white, size: 28),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          subtitle,
                          style: const TextStyle(
                            fontSize: 11,
                            color: Colors.white70,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
    Color? titleColor,
  }) {
    return ListTile(
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      leading: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          color: (titleColor ?? AppThemes.primaryBlue).withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, color: titleColor ?? AppThemes.primaryBlue, size: 24),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: titleColor ?? AppThemes.textDark,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(
          fontSize: 12,
          color: AppThemes.textGrey,
        ),
      ),
      trailing: Icon(
        Icons.chevron_right,
        color: titleColor ?? AppThemes.textGrey,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:trupoint/config/themes.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  
  // Sample notifications data
  final List<Map<String, dynamic>> notifications = [
    {
      'icon': Icons.trending_up,
      'title': 'New Stock Tip Added',
      'message': 'TATA Stocks recommendation added to your portfolio',
      'time': '2 hours ago',
      'read': false,
    },
    {
      'icon': Icons.account_balance_wallet,
      'title': 'Payment Successful',
      'message': 'Your payment of ₹60,000 has been processed',
      'time': '1 day ago',
      'read': false,
    },
    {
      'icon': Icons.celebration,
      'title': 'Target Hit!',
      'message': 'Your NIFTY trade reached target price',
      'time': '2 days ago',
      'read': true,
    },
  ];

  @override
  void initState() {
    super.initState();
   _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _clearAll() {
    setState(() {
      notifications.clear();
    });
  }

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
        title: const Text('Notifications', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          if (notifications.isNotEmpty)
            TextButton(
              onPressed: _clearAll,
              child: const Text('Clear All'),
            ),
        ],
      ),
      body: notifications.isEmpty
          ? _buildEmptyState()
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                final notification = notifications[index];
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(1, 0),
                    end: Offset.zero,
                  ).animate(CurvedAnimation(
                    parent: _controller,
                    curve: Interval(
                      index * 0.1,
                      1.0,
                      curve: Curves.easeOut,
                    ),
                  )),
                  child: _buildNotificationCard(notification, index),
                );
              },
            ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.notifications_off_outlined,
            size: 100,
            color: AppThemes.textGrey.withOpacity(0.5),
          ),
          const SizedBox(height: 24),
          const Text(
            'No New Notifications',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppThemes.textGrey,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'You\'re all caught up!',
            style: TextStyle(
              fontSize: 14,
              color: AppThemes.textGrey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationCard(Map<String, dynamic> notification, int index) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Dismissible(
        key: Key('notification_$index'),
        background: Container(
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(16),
          ),
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.only(right: 20),
          child: const Icon(Icons.delete, color: Colors.white),
        ),
        direction: DismissDirection.endToStart,
        onDismissed: (direction) {
          setState(() {
            notifications.removeAt(index);
          });
        },
        child: ListTile(
          contentPadding: const EdgeInsets.all(16),
          leading: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppThemes.primaryBlue.withOpacity(0.8),
                  AppThemes.primaryBlue,
                ],
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              notification['icon'],
              color: Colors.white,
              size: 24,
            ),
          ),
          title: Text(
            notification['title'],
            style: TextStyle(
              fontSize: 15,
              fontWeight: notification['read'] ? FontWeight.normal : FontWeight.bold,
              color: AppThemes.textDark,
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 4),
              Text(
                notification['message'],
                style: const TextStyle(
                  fontSize: 13,
                  color: AppThemes.textGrey,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                notification['time'],
                style: TextStyle(
                  fontSize: 11,
                  color: AppThemes.textGrey.withOpacity(0.7),
                ),
              ),
            ],
          ),
          trailing: !notification['read']
              ? Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: AppThemes.primaryBlue,
                    shape: BoxShape.circle,
                  ),
                )
              : null,
        ),
      ),
    );
  }
}

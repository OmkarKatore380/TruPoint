import 'package:flutter/material.dart';
import 'package:trupoint/config/themes.dart';

class ReportsScreen extends StatefulWidget {
  const ReportsScreen({super.key});

  @override
  State<ReportsScreen> createState() => _ReportsScreenState();
}

class _ReportsScreenState extends State<ReportsScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppThemes.backgroundGrey,
      appBar: AppBar(
        title: const Text('Accuracy Reports'),
        bottom: TabBar(
          controller: _tabController,
          labelColor: AppThemes.primaryBlue,
          unselectedLabelColor: AppThemes.textGrey,
          indicatorColor: AppThemes.primaryBlue,
          tabs: const [
            Tab(text: 'Weekly'),
            Tab(text: 'Monthly'),
            Tab(text: 'Yearly'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildReportView('Weekly', 85.5, 45, 38, 7),
          _buildReportView('Monthly', 78.2, 182, 142, 40),
          _buildReportView('Yearly', 82.8, 2156, 1786, 370),
        ],
      ),
    );
  }

  Widget _buildReportView(String period, double accuracy, int totalTips, int successful, int failed) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Accuracy Card
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              gradient: AppThemes.headerGradient,
              borderRadius: BorderRadius.circular(AppThemes.radiusMedium),
              boxShadow: AppThemes.mediumShadow,
            ),
            child: Column(
              children: [
                const Text(
                  'Overall Accuracy',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  '${accuracy.toStringAsFixed(1)}%',
                  style: const TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '$period Performance',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          
          // Stats Grid
          Row(
            children: [
              Expanded(
                child: _buildStatCard(
                  'Total Tips',
                  totalTips.toString(),
                  Icons.show_chart,
                  Colors.blue,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildStatCard(
                  'Successful',
                  successful.toString(),
                  Icons.check_circle,
                  Colors.green,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _buildStatCard(
                  'Failed',
                  failed.toString(),
                  Icons.cancel,
                  Colors.red,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildStatCard(
                  'Win Rate',
                  '${((successful / totalTips) * 100).toStringAsFixed(1)}%',
                  Icons.trending_up,
                  Colors.orange,
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 24),
          
          // Performance Breakdown
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(AppThemes.radiusMedium),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Performance Breakdown',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                _buildPerformanceBar('Target Hit', successful, totalTips, Colors.green),
                const SizedBox(height: 12),
                _buildPerformanceBar('Stop Loss Hit', failed, totalTips, Colors.red),
                const SizedBox(height: 20),
                const Divider(),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Average Profit/Trade',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppThemes.textGrey,
                      ),
                    ),
                    const Text(
                      '+2.4%',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(String label, String value, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppThemes.radiusMedium),
        boxShadow: AppThemes.softShadow,
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 32),
          const SizedBox(height: 12),
          Text(
            value,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              color: AppThemes.textGrey,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildPerformanceBar(String label, int value, int total, Color color) {
    final percentage = (value / total * 100).toStringAsFixed(1);
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: const TextStyle(fontSize: 14)),
            Text('$value ($percentage%)', style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
          ],
        ),
        const SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: LinearProgressIndicator(
            value: value / total,
            minHeight: 8,
            backgroundColor: Colors.grey.shade200,
            valueColor: AlwaysStoppedAnimation<Color>(color),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:trupoint/config/themes.dart';

class StockTipsScreen extends StatefulWidget {
  const StockTipsScreen({super.key});

  @override
  State<StockTipsScreen> createState() => _StockTipsScreenState();
}

class _StockTipsScreenState extends State<StockTipsScreen> with SingleTickerProviderStateMixin {
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
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: const Text('Stock Tips', style: TextStyle(fontWeight: FontWeight.bold)),
        bottom: TabBar(
          controller: _tabController,
          labelColor: AppThemes.primaryBlue,
          unselectedLabelColor: AppThemes.textGrey,
          indicatorColor: AppThemes.primaryBlue,
          indicatorWeight: 3,
          tabs: const [
            Tab(text: 'Today'),
            Tab(text: 'This Week'),
            Tab(text: 'All'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildTipsList('today'),
          _buildTipsList('week'),
          _buildTipsList('all'),
        ],
      ),
    );
  }

  Widget _buildTipsList(String filter) {
    final tips = _getSampleTips(filter);
    
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: tips.length,
      itemBuilder: (context, index) {
        final tip = tips[index];
        return _buildTipCard(tip);
      },
    );
  }

  List<Map<String, dynamic>> _getSampleTips(String filter) {
    final allTips = [
      {
        'symbol': 'NIFTY 50',
        'action': 'BUY',
        'entry': '19650',
        'target': '19800',
        'stopLoss': '19500',
        'status': 'Active',
        'date': '18 Jan 2024',
        'time': '9:15 AM',
        'profit': '+0.75%',
      },
      {
        'symbol': 'TATA STEEL',
        'action': 'SELL',
        'entry': '145.50',
        'target': '142.00',
        'stopLoss': '148.00',
        'status': 'Target Hit',
        'date': '17 Jan 2024',
        'time': '10:30 AM',
        'profit': '+2.40%',
      },
      {
        'symbol': 'RELIANCE',
        'action': 'BUY',
        'entry': '2450',
        'target': '2520',
        'stopLoss': '2400',
        'status': 'Active',
        'date': '17 Jan 2024',
        'time': '2:45 PM',
        'profit': '+1.22%',
      },
      {
        'symbol': 'HDFC BANK',
        'action': 'BUY',
        'entry': '1580',
        'target': '1640',
        'stopLoss': '1550',
        'status': 'Stop Loss Hit',
        'date': '16 Jan 2024',
        'time': '11:20 AM',
        'profit': '-1.90%',
      },
      {
        'symbol': 'BANKNIFTY',
        'action': 'BUY',
        'entry': '44500',
        'target': '44900',
        'stopLoss': '44200',
        'status': 'Target Hit',
        'date': '15 Jan 2024',
        'time': '9:30 AM',
        'profit': '+0.89%',
      },
    ];

    if (filter == 'today') {
      return allTips.take(2).toList();
    } else if (filter == 'week') {
      return allTips.take(4).toList();
    }
    return allTips;
  }

  Widget _buildTipCard(Map<String, dynamic> tip) {
    final isBuy = tip['action'] == 'BUY';
    final isProfit = tip['profit'].startsWith('+');
    final status = tip['status'];
    
    Color statusColor;
    if (status == 'Active') {
      statusColor = AppThemes.primaryBlue;
    } else if (status == 'Target Hit') {
      statusColor = Colors.green;
    } else {
      statusColor = Colors.red;
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
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
      child: Column(
        children: [
          // Header
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: isBuy
                    ? [Colors.green.shade400, Colors.green.shade600]
                    : [Colors.red.shade400, Colors.red.shade600],
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        isBuy ? Icons.trending_up : Icons.trending_down,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          tip['symbol'],
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          '${tip['date']} at ${tip['time']}',
                          style: const TextStyle(
                            fontSize: 11,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    tip['action'],
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: isBuy ? Colors.green : Colors.red,
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          // Details
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildDetailItem('Entry', '₹${tip['entry']}'),
                    _buildDetailItem('Target', '₹${tip['target']}'),
                    _buildDetailItem('Stop Loss', '₹${tip['stopLoss']}'),
                  ],
                ),
                const SizedBox(height: 16),
                const Divider(),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: statusColor,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          status,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: statusColor,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      tip['profit'],
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: isProfit ? Colors.green : Colors.red,
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

  Widget _buildDetailItem(String label, String value) {
    return Column(
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: AppThemes.textGrey,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          value,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: AppThemes.textDark,
          ),
        ),
      ],
    );
  }
}

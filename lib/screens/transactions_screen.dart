import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';

class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({super.key});

  final List<Map<String, dynamic>> transactions = const [
    {'title': 'Salary Deposit', 'subtitle': 'Monthly Salary', 'amount': '+\$5,000.00', 'date': 'Today', 'icon': Icons.work, 'color': Colors.green},
    {'title': 'Grocery Store', 'subtitle': 'Whole Foods', 'amount': '-\$156.40', 'date': 'Today', 'icon': Icons.shopping_cart, 'color': Colors.orange},
    {'title': 'Netflix Subscription', 'subtitle': 'Entertainment', 'amount': '-\$15.99', 'date': 'Yesterday', 'icon': Icons.movie, 'color': Colors.red},
    {'title': 'Freelance Payment', 'subtitle': 'Design Project', 'amount': '+\$850.00', 'date': 'Yesterday', 'icon': Icons.design_services, 'color': Colors.green},
    {'title': 'Gas Station', 'subtitle': 'Shell', 'amount': '-\$45.00', 'date': 'Jul 8', 'icon': Icons.local_gas_station, 'color': Colors.blue},
    {'title': 'Restaurant', 'subtitle': 'Olive Garden', 'amount': '-\$78.50', 'date': 'Jul 7', 'icon': Icons.restaurant, 'color': Colors.orange},
    {'title': 'Uber Ride', 'subtitle': 'Transportation', 'amount': '-\$24.30', 'date': 'Jul 6', 'icon': Icons.local_taxi, 'color': Colors.purple},
    {'title': 'Investment Dividend', 'subtitle': 'Stock Portfolio', 'amount': '+\$320.00', 'date': 'Jul 5', 'icon': Icons.trending_up, 'color': Colors.green},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Transactions')),
      drawer: const AppDrawer(currentRoute: 'Transactions'),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.blue.shade700,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildSummaryItem('Income', '+\$6,170', Colors.green.shade300),
                _buildSummaryItem('Expenses', '-\$320', Colors.red.shade300),
                _buildSummaryItem('Net', '+\$5,850', Colors.white),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                final t = transactions[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: ListTile(
                    leading: Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: (t['color'] as Color).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(t['icon'] as IconData, color: t['color'] as Color, size: 20),
                    ),
                    title: Text(
                      t['title'] as String,
                      style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                    ),
                    subtitle: Text(
                      '${t['subtitle']} • ${t['date']}',
                      style: TextStyle(color: Colors.grey.shade500, fontSize: 12),
                    ),
                    trailing: Text(
                      t['amount'] as String,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: (t['amount'] as String).startsWith('+') ? Colors.green.shade700 : Colors.black87,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryItem(String label, String value, Color valueColor) {
    return Column(
      children: [
        Text(label, style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 12)),
        const SizedBox(height: 4),
        Text(value, style: TextStyle(color: valueColor, fontSize: 18, fontWeight: FontWeight.bold)),
      ],
    );
  }
}

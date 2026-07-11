import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  final List<Map<String, dynamic>> cards = const [
    {
      'type': 'Visa',
      'number': '**** **** **** 4521',
      'balance': '\$8,450.00',
      'color': [0xFF1a237e, 0xFF3949ab],
      'expiry': '12/26',
    },
    {
      'type': 'Mastercard',
      'number': '**** **** **** 8834',
      'balance': '\$3,200.00',
      'color': [0xFFb71c1c, 0xFFe53935],
      'expiry': '08/27',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Wallet')),
      drawer: const AppDrawer(currentRoute: 'Wallet'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Your Cards',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: cards.length,
                itemBuilder: (context, index) {
                  final card = cards[index];
                  return Container(
                    width: 320,
                    margin: const EdgeInsets.only(right: 16),
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(card['color'][0]),
                          Color(card['color'][1]),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Color(card['color'][0]).withOpacity(0.3),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              card['type'] as String,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Icon(Icons.wifi_tethering, color: Colors.white70, size: 28),
                          ],
                        ),
                        Text(
                          card['number'] as String,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            letterSpacing: 2,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'BALANCE',
                                  style: TextStyle(color: Colors.white70, fontSize: 10, letterSpacing: 1),
                                ),
                                Text(
                                  card['balance'] as String,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const Text(
                                  'EXPIRES',
                                  style: TextStyle(color: Colors.white70, fontSize: 10, letterSpacing: 1),
                                ),
                                Text(
                                  card['expiry'] as String,
                                  style: const TextStyle(color: Colors.white, fontSize: 14),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 28),
            Text(
              'Quick Actions',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildActionButton(Icons.add_card, 'Add Card', Colors.blue),
                _buildActionButton(Icons.send, 'Transfer', Colors.green),
                _buildActionButton(Icons.qr_code_scanner, 'Scan', Colors.purple),
                _buildActionButton(Icons.history, 'History', Colors.orange),
              ],
            ),
            const SizedBox(height: 28),
            Text(
              'Recent Transfers',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 16),
            _buildTransferItem('Alice Johnson', 'Today', '-\$120.00', Colors.red),
            _buildTransferItem('Bob Smith', 'Yesterday', '+\$350.00', Colors.green),
            _buildTransferItem('Carol White', 'Jul 8', '-\$45.00', Colors.red),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton(IconData icon, String label, Color color) {
    return Column(
      children: [
        Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Icon(icon, color: color, size: 24),
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
      ],
    );
  }

  Widget _buildTransferItem(String name, String date, String amount, Color amountColor) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.grey.shade200,
          child: Text(name[0], style: TextStyle(color: Colors.blue.shade700, fontWeight: FontWeight.bold)),
        ),
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
        subtitle: Text(date, style: TextStyle(color: Colors.grey.shade500, fontSize: 12)),
        trailing: Text(
          amount,
          style: TextStyle(color: amountColor, fontWeight: FontWeight.bold, fontSize: 14),
        ),
      ),
    );
  }
}

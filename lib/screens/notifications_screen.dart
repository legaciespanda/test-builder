import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  final List<Map<String, dynamic>> notifications = const [
    {
      'title': 'Payment Received',
      'message': 'You received \$250.00 from John Doe',
      'time': '2 min ago',
      'icon': Icons.arrow_downward,
      'color': Colors.green,
      'read': false,
    },
    {
      'title': 'Security Alert',
      'message': 'New login detected from Chrome on Windows',
      'time': '1 hr ago',
      'icon': Icons.security,
      'color': Colors.orange,
      'read': false,
    },
    {
      'title': 'Bill Reminder',
      'message': 'Your electricity bill of \$145.00 is due tomorrow',
      'time': '3 hr ago',
      'icon': Icons.electric_bolt,
      'color': Colors.blue,
      'read': true,
    },
    {
      'title': 'Transfer Complete',
      'message': 'Your transfer of \$500.00 to Savings Account is complete',
      'time': 'Yesterday',
      'icon': Icons.check_circle,
      'color': Colors.green,
      'read': true,
    },
    {
      'title': 'Promotional Offer',
      'message': 'Get 5% cashback on all purchases this weekend!',
      'time': 'Yesterday',
      'icon': Icons.local_offer,
      'color': Colors.purple,
      'read': true,
    },
    {
      'title': 'Account Update',
      'message': 'Your profile information has been updated successfully',
      'time': '2 days ago',
      'icon': Icons.person,
      'color': Colors.grey,
      'read': true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text('Mark All Read', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
      drawer: const AppDrawer(currentRoute: 'Notifications'),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final n = notifications[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 10),
            color: n['read'] as bool ? null : Colors.blue.shade50,
            child: ListTile(
              leading: Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: (n['color'] as Color).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(n['icon'] as IconData, color: n['color'] as Color, size: 20),
              ),
              title: Row(
                children: [
                  Text(
                    n['title'] as String,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: n['read'] as bool ? Colors.black87 : Colors.blue.shade900,
                    ),
                  ),
                  if (!(n['read'] as bool)) ...[
                    const SizedBox(width: 8),
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ],
                ],
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 4),
                  Text(
                    n['message'] as String,
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    n['time'] as String,
                    style: TextStyle(color: Colors.grey.shade400, fontSize: 11),
                  ),
                ],
              ),
              isThreeLine: true,
              onTap: () {},
            ),
          );
        },
      ),
    );
  }
}

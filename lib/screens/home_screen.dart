import 'package:flutter/material.dart';
import '../generated/build_config.dart';
import '../models/screen_registry.dart';
import '../widgets/app_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Map<String, dynamic>> _quickActions = [
    {'icon': Icons.send, 'label': 'Send', 'color': Colors.blue},
    {'icon': Icons.download, 'label': 'Receive', 'color': Colors.green},
    {'icon': Icons.qr_code, 'label': 'Scan', 'color': Colors.purple},
    {'icon': Icons.history, 'label': 'History', 'color': Colors.orange},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(BuildConfig.appName),
        actions: [
          if (ScreenRegistry.hasScreen('Notifications'))
            Stack(
              children: [
                IconButton(
                  icon: const Icon(Icons.notifications_outlined),
                  onPressed: () {
                    final builder = ScreenRegistry.getScreen('Notifications');
                    if (builder != null) {
                      Navigator.push(context, MaterialPageRoute(builder: builder));
                    }
                  },
                ),
                Positioned(
                  right: 8,
                  top: 8,
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
      drawer: const AppDrawer(currentRoute: 'Home'),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Balance Card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.blue.shade700, Colors.blue.shade500],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.shade200.withOpacity(0.5),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total Balance',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      '\$12,450.00',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Row(
                            children: [
                              Icon(Icons.trending_up, color: Colors.white, size: 16),
                              SizedBox(width: 4),
                              Text('+8.2%', style: TextStyle(color: Colors.white, fontSize: 12)),
                            ],
                          ),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          'This month',
                          style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 28),

              // Quick Actions
              Text(
                'Quick Actions',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: _quickActions.map((action) {
                  return _buildQuickAction(
                    icon: action['icon'] as IconData,
                    label: action['label'] as String,
                    color: action['color'] as Color,
                  );
                }).toList(),
              ),
              const SizedBox(height: 28),

              // Recent Activity
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Recent Activity',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  TextButton(
                    onPressed: () {
                      if (ScreenRegistry.hasScreen('Transactions')) {
                        final builder = ScreenRegistry.getScreen('Transactions');
                        if (builder != null) {
                          Navigator.push(context, MaterialPageRoute(builder: builder));
                        }
                      }
                    },
                    child: Text('See All', style: TextStyle(color: Colors.blue.shade700)),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              _buildActivityItem(
                icon: Icons.shopping_bag,
                title: 'Shopping',
                subtitle: 'Amazon',
                amount: '-\$89.99',
                color: Colors.red,
                time: '2 min ago',
              ),
              _buildActivityItem(
                icon: Icons.restaurant,
                title: 'Food & Dining',
                subtitle: 'Starbucks',
                amount: '-\$12.50',
                color: Colors.orange,
                time: '1 hr ago',
              ),
              _buildActivityItem(
                icon: Icons.arrow_downward,
                title: 'Received',
                subtitle: 'John Doe',
                amount: '+\$250.00',
                color: Colors.green,
                time: '3 hr ago',
              ),
              _buildActivityItem(
                icon: Icons.electric_bolt,
                title: 'Utilities',
                subtitle: 'Electric Bill',
                amount: '-\$145.00',
                color: Colors.yellow.shade700,
                time: 'Yesterday',
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        selectedItemColor: Colors.blue.shade700,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.credit_card), label: 'Cards'),
          BottomNavigationBarItem(icon: Icon(Icons.analytics), label: 'Analytics'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }

  Widget _buildQuickAction({
    required IconData icon,
    required String label,
    required Color color,
  }) {
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

  Widget _buildActivityItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required String amount,
    required Color color,
    required String time,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: color, size: 22),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
        subtitle: Text(subtitle, style: TextStyle(color: Colors.grey.shade500, fontSize: 12)),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              amount,
              style: TextStyle(
                color: amount.startsWith('+') ? Colors.green : Colors.black87,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
            Text(time, style: TextStyle(color: Colors.grey.shade400, fontSize: 11)),
          ],
        ),
      ),
    );
  }
}

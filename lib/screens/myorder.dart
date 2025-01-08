import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../constants/styles.dart';
import '../routes/app_routes.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFFB800),
        title: const Text('MY ORDER'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                const Text(
                  'Sort my order by:',
                  style: AppStyles.subheading,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    decoration: AppStyles.inputDecoration(''),
                    value: 'Month',
                    items: ['Month', 'Week', 'Year']
                        .map((type) => DropdownMenuItem(
                              value: type,
                              child: Text(type),
                            ))
                        .toList(),
                    onChanged: (value) {},
                  ),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 247, 176, 22),
                  ),
                  child: const Text(
                    'SHOW',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Text(
                  'HISTORY',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                _buildOrderItem(
                  'Flight Booking',
                  'Complete payment',
                  -1000.00,
                  Colors.blue,
                ),
                _buildOrderItem(
                  'Culinary Booking',
                  'Complete payment',
                  200,
                  Colors.orange,
                  isPoints: true,
                ),
                _buildOrderItem(
                  'Train Booking',
                  'Complete payment',
                  -200.00,
                  Colors.purple,
                ),
                _buildOrderItem(
                  'Car Rentals Booking',
                  'Complete payment',
                  -110.00,
                  Colors.red,
                ),
                _buildOrderItem(
                  'Flight Booking',
                  'Refundable',
                  -20.00,
                  Colors.blue,
                ),
                _buildOrderItem(
                  'Events',
                  'Complete payment',
                  300,
                  Colors.green,
                  isPoints: true,
                ),
                _buildOrderItem(
                  'Buy Coupons',
                  'Complete payment',
                  250,
                  Colors.indigo,
                  isPoints: true,
                ),
              ],
            ),
          ),
          BottomNavigationBar(
            backgroundColor: const Color.fromARGB(255, 247, 173, 37),
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.receipt), label: 'My order'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.notifications), label: 'Notifications'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.account_box), label: 'Account'),
            ],
            currentIndex: 1,
            selectedItemColor: AppColors.appbotton,
            onTap: (index) {
              if (index == 1) {
                // Nếu chọn "Home", không làm gì vì đã ở trang My order.
              } else if (index == 0) {
                // Nếu chọn "Home", chuyển đến màn hình Home
                Navigator.pushNamed(context, AppRoutes.home);
              } else if (index == 2) {
                // Nếu chọn "Notifications", xử lý ở đâyr
              } else if (index == 3) {
                // Nếu chọn "Profile", chuyển đến màn hình AccountScreen
                Navigator.pushNamed(context, AppRoutes.account);
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildOrderItem(
      String title, String status, double amount, Color color,
      {bool isPoints = false}) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color.withOpacity(0.2),
          child: Icon(
            Icons.description,
            color: color,
          ),
        ),
        title: Text(title),
        subtitle: Text(status),
        trailing: Text(
          isPoints
              ? '${amount.abs()} Points'
              : '\$${amount.abs().toStringAsFixed(2)}',
          style: TextStyle(
            color: amount < 0 ? Colors.red : Colors.green,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

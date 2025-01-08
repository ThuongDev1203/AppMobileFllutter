import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/styles.dart';
import '../routes/app_routes.dart';

class FlightBookingScreen extends StatelessWidget {
  const FlightBookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FLIGHT BOOKING'),
        backgroundColor: Color(0xFFFFB800),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'From',
              style: AppStyles.subheading,
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                // TextField có prefixIcon
                Expanded(
                  child: TextField(
                    decoration:
                        AppStyles.inputDecoration('Select Airport').copyWith(
                      prefixIcon: const Icon(Icons.flight_takeoff),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                // IconButton ở cuối hàng
                IconButton(
                  onPressed: () {
                    // Xử lý sự kiện khi nhấn
                    print('Swap icon clicked!');
                  },
                  icon: const Icon(Icons.swap_vert, color: AppColors.secondary),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              'To',
              style: AppStyles.subheading,
            ),
            const SizedBox(height: 8),
            TextField(
              decoration: AppStyles.inputDecoration('Select Airport').copyWith(
                prefixIcon: const Icon(Icons.flight_land), // Đặt Icon lên trước
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Departure Date',
              style: AppStyles.subheading,
            ),
            const SizedBox(height: 8),
            TextField(
              decoration: AppStyles.inputDecoration('Select Date')
                  .copyWith(suffixIcon: const Icon(Icons.calendar_today)),
              readOnly: true,
              onTap: () => Navigator.pushNamed(context, AppRoutes.travelDate),
            ),
            const SizedBox(height: 16),
            const Text(
              'Return Date',
              style: AppStyles.subheading,
            ),
            const SizedBox(height: 8),
            TextField(
              decoration: AppStyles.inputDecoration('Select Date')
                  .copyWith(suffixIcon: const Icon(Icons.calendar_today)),
              readOnly: true,
            ),
            const SizedBox(height: 16),
            const Text(
              'Passenger',
              style: AppStyles.subheading,
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              decoration: AppStyles.inputDecoration(''),
              value: 'Adult',
              items: ['Adult', 'Child', 'Infant']
                  .map((type) => DropdownMenuItem(
                        value: type,
                        child: Text(type),
                      ))
                  .toList(),
              onChanged: (value) {},
            ),
            const SizedBox(height: 16),
            const Text(
              'Cabin Class',
              style: AppStyles.subheading,
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              decoration: AppStyles.inputDecoration(''),
              value: 'Economy',
              items: ['Economy', 'Business', 'First Class']
                  .map((type) => DropdownMenuItem(
                        value: type,
                        child: Text(type),
                      ))
                  .toList(),
              onChanged: (value) {},
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () =>
                    Navigator.pushNamed(context, AppRoutes.selectFlight),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.appbottons,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text(
                  'SEARCH',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Recently Searched',
              style: AppStyles.subheading,
            ),
            const SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  const SizedBox(width: 14),
                  _buildRecentSearch('JKT', 'SBY', '24 Sep'),
                  const SizedBox(width: 16),
                  _buildRecentSearch('SBY', 'JKT', '26 Sep'),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 247, 173, 37),
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.receipt), label: 'My Order'),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: 'Notification'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
        ],
        selectedItemColor: AppColors.appbotton,
      ),
    );
  }

  Widget _buildRecentSearch(String from, String to, String date) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Text(
            from,
            style: AppStyles.subheading,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Icon(Icons.arrow_forward, size: 16),
          ),
          Text(
            to,
            style: AppStyles.subheading,
          ),
          const SizedBox(width: 8),
          Text(
            date,
            style: AppStyles.body,
          ),
        ],
      ),
    );
  }
}

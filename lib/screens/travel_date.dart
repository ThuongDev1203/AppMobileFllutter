import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myapp_giuaki/constants/colors.dart';

//import '../routes/app_routes.dart';

class TravelDateScreen extends StatefulWidget {
  const TravelDateScreen({super.key});

  @override
  State<TravelDateScreen> createState() => _TravelDateScreenState();
}

class _TravelDateScreenState extends State<TravelDateScreen> {
  DateTime? departureDate;
  DateTime? returnDate;
  DateTime today = DateTime.now();

  void _selectDate(BuildContext context, bool isDepartureDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: isDepartureDate
          ? (departureDate ?? today)
          : (returnDate ?? departureDate ?? today),
      firstDate: today,
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        if (isDepartureDate) {
          departureDate = picked;
          if (returnDate != null && picked.isAfter(returnDate!)) {
            returnDate = null;
          }
        } else {
          returnDate = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow[700],
        title: const Text(
          'TRAVEL DATE',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: const Color.fromARGB(255, 250, 159, 22),
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildDateSelector(
                    title: 'Departure Date',
                    date: departureDate,
                    onTap: () => _selectDate(context, true),
                  ),
                  const Icon(Icons.swap_horiz, color: Colors.white),
                  _buildDateSelector(
                    title: 'Return Date',
                    date: returnDate,
                    onTap: () => _selectDate(context, false),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Column(
              children: [
                _buildCalendarHeader(),
                _buildCalendarGrid(),
                const SizedBox(height: 16),
                ListTile(
                  title: const Text(
                    'Find cheapest price estimates',
                    style: TextStyle(fontSize: 16),
                  ),
                  trailing: Switch(
                    value: false,
                    onChanged: (bool value) {},
                  ),
                ),
              ],
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
        // showUnselectedLabels: true,
        // currentIndex: 0,
        // onTap: (index) {
        //   if (index == 0) {
        //     // Nếu chọn "Home", không làm gì vì đã ở trang My order.
        //   } else if (index == 1) {
        //     // Nếu chọn "Home", chuyển đến màn hình Home
        //     Navigator.pushNamed(context, AppRoutes.home);
        //   } else if (index == 2) {
        //     // Nếu chọn "Notifications", xử lý ở đâyr
        //   } else if (index == 3) {
        //     // Nếu chọn "Profile", chuyển đến màn hình AccountScreen
        //     Navigator.pushNamed(context, AppRoutes.account);
        //   }
        // },
      ),
    );
  }

  Widget _buildDateSelector(
      {required String title, DateTime? date, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 14),
          ),
          const SizedBox(height: 4),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              date != null
                  ? DateFormat('E, d MMM yyyy').format(date)
                  : 'Select Date',
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCalendarHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: () {},
        ),
        const Text(
          'September 2021',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        IconButton(
          icon: const Icon(Icons.chevron_right),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildCalendarGrid() {
    return AspectRatio(
      aspectRatio: 1.2, // Điều chỉnh tỷ lệ lưới lịch
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(), // Ngăn cuộn bên trong
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 7,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
        ),
        itemCount: 30,
        itemBuilder: (context, index) {
          final date = DateTime(today.year, today.month, index + 1);
          final isInRange = departureDate != null &&
              returnDate != null &&
              date.isAfter(departureDate!.subtract(const Duration(days: 1))) &&
              date.isBefore(returnDate!.add(const Duration(days: 1)));
          final isSelected = date == departureDate || date == returnDate;

          return GestureDetector(
            onTap: () {
              if (departureDate == null ||
                  (departureDate != null && returnDate != null)) {
                setState(() {
                  departureDate = date;
                  returnDate = null;
                });
              } else if (returnDate == null && date.isAfter(departureDate!)) {
                setState(() {
                  returnDate = date;
                });
              }
            },
            child: Container(
              decoration: BoxDecoration(
                color: isSelected
                    ? Colors.yellow[700]
                    : isInRange
                        ? Colors.yellow[300]
                        : Colors.white,
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: Colors.grey[300]!),
              ),
              child: Center(
                child: Text(
                  '${index + 1}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color:
                        isSelected || isInRange ? Colors.white : Colors.black,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

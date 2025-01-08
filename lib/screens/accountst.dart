import 'package:flutter/material.dart';
import 'package:myapp_giuaki/constants/colors.dart';

import '../routes/app_routes.dart';

class AccountSettingsScreen extends StatelessWidget {
  const AccountSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account Settings'),
        backgroundColor: const Color.fromARGB(255, 229, 162, 16),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous screen
          },
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 236, 176, 64),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 40),
            // Account Settings Form Container
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: Text(
                      'ACCOUNT SETTING',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.blue[100],
                        child: const Icon(Icons.person,
                            size: 40, color: Colors.blue),
                      ),
                      const SizedBox(width: 20),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Your Name'),
                            TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                              ),
                            ),
                            SizedBox(height: 10),
                            Text('Bank Account'),
                            TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  _buildTextField('Email', ''),
                  const SizedBox(height: 10),
                  _buildTextField('Password', '', isPassword: true),
                  const SizedBox(height: 10),
                  _buildTextField('Phone Number', ''),
                  const SizedBox(height: 10),
                  _buildTextField('Your Address', '', maxLines: 2),
                  const SizedBox(height: 10),
                  _buildTextField('Credit/debit Card', ''),
                  const SizedBox(height: 20),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        // Add save functionality here
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 229, 162, 16),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 15),
                        textStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      child: const Text('SAVE'),
                    ),
                  ),
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
          BottomNavigationBarItem(icon: Icon(Icons.receipt), label: 'My order'),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: 'Notifications'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box), label: 'Account'),
        ],
        currentIndex: 3,
        selectedItemColor: AppColors.appbotton,
        onTap: (index) {
          if (index == 3) {
            // Nếu chọn "Account", không làm gì vì đã ở trang AcountSt.
          } else if (index == 0) {
            // Nếu chọn "Account", chuyển đến màn hình Account
            Navigator.pushNamed(context, AppRoutes.home);
          } else if (index == 2) {
            // Nếu chọn "Notifications", xử lý ở đâyr
          } else if (index == 1) {
            // Nếu chọn "Home", chuyển đến màn hình Home
            Navigator.pushNamed(context, AppRoutes.order);
          }
        },
      ),
    );
  }

  Widget _buildTextField(String label, String hint,
      {bool isPassword = false, int maxLines = 1}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        const SizedBox(height: 5),
        TextField(
          obscureText: isPassword,
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: hint,
            border: const OutlineInputBorder(),
          ),
        ),
      ],
    );
  }
}

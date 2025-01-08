//import 'package:carousel_slider/carousel_slider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../routes/app_routes.dart';
import '../../constants/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Top Section with Profile and Points
          Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.yellow, Color.fromARGB(255, 243, 205, 33)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: const Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.account_circle,
                            size: 40, color: Colors.black87),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'YOUR NAME',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            Text(
                              'youremail@example.com',
                              style: TextStyle(
                                  fontSize: 12, color: Colors.black54),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'POINT',
                          style: TextStyle(fontSize: 12, color: Colors.black54),
                        ),
                        Text(
                          '825',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            //flex: 2,
            child: ListView(
              children: [
                CarouselSlider(
                  items: [
                    Container(
                      //margin: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: const DecorationImage(
                          image: AssetImage('assets/slider1.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      //margin: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: const DecorationImage(
                          image: AssetImage('assets/slider2.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      //margin: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: const DecorationImage(
                          image: AssetImage('assets/slider3.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                  options: CarouselOptions(
                    height: 200.0,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    aspectRatio: 16 / 9,
                    autoPlayInterval: const Duration(seconds: 3),
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    viewportFraction: 0.8,
                  ),
                ),
              ],
            ),
          ),
          //Image.asset('assets/slider1.png'),
          // Icons Grid
          Expanded(
            flex: 2,
            child: GridView.count(
              padding: const EdgeInsets.all(20),
              crossAxisCount: 3,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
              children: [
                Column(
                  children: [
                    Container(
                      width: 75,
                      height: 75,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromARGB(255, 167, 232, 218),
                      ),
                      child: IconButton(
                        onPressed: () => {
                          Navigator.pushNamed(context, AppRoutes.flightBooking)
                        },
                        icon: Image.asset(
                          'assets/airplane.png',
                          width: 70,
                          height: 70,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text("Flights"),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      width: 75,
                      height: 75,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromARGB(255, 167, 232, 218),
                      ),
                      child: IconButton(
                        onPressed: () => {},
                        icon: Image.asset(
                          'assets/destination.png',
                          width: 70,
                          height: 70,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text("Destinations"),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      width: 75,
                      height: 75,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromARGB(255, 167, 232, 218),
                      ),
                      child: IconButton(
                        onPressed: () => {},
                        icon: Image.asset(
                          'assets/hotel.png',
                          width: 70,
                          height: 70,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text("Hotels"),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      width: 75,
                      height: 75,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromARGB(255, 167, 232, 218),
                      ),
                      child: IconButton(
                        onPressed: () => {},
                        icon: Image.asset(
                          'assets/car-rent.png',
                          width: 70,
                          height: 70,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text("Car Rentals"),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      width: 75,
                      height: 75,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromARGB(255, 167, 232, 218),
                      ),
                      child: IconButton(
                        onPressed: () => {},
                        icon: Image.asset(
                          'assets/rail.png',
                          width: 70,
                          height: 70,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text("Trains"),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      width: 75,
                      height: 75,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromARGB(255, 167, 232, 218),
                      ),
                      child: IconButton(
                        onPressed: () => {},
                        icon: Image.asset(
                          'assets/culinary.png',
                          width: 70,
                          height: 70,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text("Culinary"),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      width: 75,
                      height: 75,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromARGB(255, 167, 232, 218),
                      ),
                      child: IconButton(
                        onPressed: () => {},
                        icon: Image.asset(
                          'assets/family.png',
                          width: 70,
                          height: 70,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text("Insurance"),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      width: 75,
                      height: 75,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromARGB(255, 167, 232, 218),
                      ),
                      child: IconButton(
                        onPressed: () => {},
                        icon: Image.asset(
                          'assets/voucher.png',
                          width: 70,
                          height: 70,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text("Coupons"),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      width: 75,
                      height: 75,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromARGB(255, 167, 232, 218),
                      ),
                      child: IconButton(
                        onPressed: () => {},
                        icon: Image.asset(
                          'assets/event-list.png',
                          width: 70,
                          height: 70,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text("Events"),
                  ],
                ),
              ],
            ),
          ),
          BottomNavigationBar(
            backgroundColor: const Color.fromARGB(255, 247, 173, 37),
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.receipt), label: 'My order'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.notifications), label: 'Notification'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.account_box), label: "Account")
            ],
            currentIndex: 0,
            selectedItemColor: AppColors.appbotton,
            onTap: (index) {
              if (index == 0) {
                // Nếu chọn "Home", không làm gì vì đã ở trang Home.
              } else if (index == 1) {
                // Nếu chọn "My Order", chuyển đến màn hình OrderScreen
                Navigator.pushNamed(context, AppRoutes.order);
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
}

import 'package:flutter/material.dart';
import '../screens/accountst.dart';
import '../screens/createAccount.dart';
import '../screens/flight_booking.dart';
import '../screens/homeScene.dart';
import '../screens/myorder.dart';
import '../screens/select_flight.dart';
import '../screens/signin.dart';
import '../screens/travel_date.dart';

class AppRoutes {
  static const String login = '/';
  static const String signup = '/signup';
  static const String home = '/home';
  static const String account = '/account';
  static const String flightBooking = '/flight-booking';
  static const String travelDate = '/travel-date';
  static const String selectFlight = '/select-flight';
  static const String order = '/order';

  static Map<String, WidgetBuilder> get routes => {
        login: (context) => const Signin(),
        signup: (context) => const SignUpAccount(),
        home: (context) => const HomeScreen(),
        account: (context) => const AccountSettingsScreen(),
        flightBooking: (context) => const FlightBookingScreen(),
        travelDate: (context) => const TravelDateScreen(),
        selectFlight: (context) => const SelectFlightScreen(),
        order: (context) => const OrderScreen(),
      };
}

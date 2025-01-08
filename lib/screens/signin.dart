import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../sql/database_helper.dart';
import 'createAccount.dart';
import 'homeScene.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _dbHelper = DatabaseHelper();
  String _errorMessage = '';

  // Hàm xử lý đăng nhập
  Future<void> _handleLogin() async {
    final username = _usernameController.text.trim();
    final password = _passwordController.text.trim();

    if (username.isEmpty || password.isEmpty) {
      setState(() {
        _errorMessage = "Please fill in all fields.";
      });
      return;
    }

    // Kiểm tra đăng nhập
    final isSuccess = await _dbHelper.loginUser(username, password);

    if (isSuccess) {
      setState(() {
        _errorMessage = '';
      });
      // Chuyển tới màn hình Home
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    } else {
      setState(() {
        _errorMessage = "Invalid username or password.";
      });
    }
  }

  // Hàm xây dựng UI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.orange, Colors.yellow],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Lottie Animation cho logo
              Lottie.asset('assets/logo.json'),
              const SizedBox(height: 30),

              // TextField cho Username
              TextField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  label: Center(child: Text("Username or Email")),
                  labelStyle: TextStyle(fontSize: 20),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),

              // TextField cho Password
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  label: Center(child: Text("Password")),
                  labelStyle: TextStyle(fontSize: 20),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),

              // Hiển thị thông báo lỗi nếu có
              if (_errorMessage.isNotEmpty)
                Text(
                  _errorMessage,
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 16,
                  ),
                ),
              const SizedBox(height: 20),

              // Nút Đăng Nhập
              SizedBox(
                width: 150,
                child: ElevatedButton(
                  onPressed: _handleLogin,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(10),
                    backgroundColor: const Color.fromARGB(255, 232, 130, 28),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    "Log In",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 50),

              // Nút quên mật khẩu
              TextButton(
                onPressed: () {
                  // Chuyển tới màn hình quên mật khẩu
                },
                child: const Text(
                  "Forgot Password?",
                  style: TextStyle(
                    fontSize: 18,
                    color: Color.fromARGB(255, 11, 39, 91),
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),

              // Nút chuyển tới màn hình đăng ký
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignUpAccount()),
                  );
                },
                child: const Text.rich(
                  TextSpan(
                    text: "New to Bank Apps? ",
                    style: TextStyle(
                      fontSize: 18,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                    children: [
                      TextSpan(
                        text: "Sign Up",
                        style: TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 11, 39, 91),
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

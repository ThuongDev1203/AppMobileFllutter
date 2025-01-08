import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:crypto/crypto.dart'; // Thư viện mã hóa
import 'dart:convert'; // Để mã hóa mật khẩu

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper() {
    return _instance;
  }

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'users.db'); // Tên file database
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE users (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        firstname TEXT NOT NULL,
        lastname TEXT NOT NULL,
        username TEXT NOT NULL UNIQUE,
        password TEXT NOT NULL
      )
    ''');
  }

  // Hàm mã hóa mật khẩu
  String _hashPassword(String password) {
    return sha256.convert(utf8.encode(password)).toString();
  }

  // Hàm đăng ký
  Future<int> registerUser(String firstname, String lastname, String username,
      String password) async {
    try {
      final db = await database;
      final hashedPassword = _hashPassword(password); // Mã hóa mật khẩu

      final result = await db.insert('users', {
        'firstname': firstname,
        'lastname': lastname,
        'username': username,
        'password': hashedPassword, // Lưu mật khẩu đã mã hóa
      });
      return result;
    } catch (e) {
      print("Error during registration: $e");
      return -1; // Trả về -1 khi có lỗi
    }
  }

  // Hàm kiểm tra đăng nhập
  Future<bool> loginUser(String username, String password) async {
    try {
      final db = await database;
      final hashedPassword =
          _hashPassword(password); // Mã hóa mật khẩu khi đăng nhập

      final result = await db.query(
        'users',
        where: 'username = ? AND password = ?',
        whereArgs: [username, hashedPassword], // Kiểm tra mật khẩu đã mã hóa
      );
      return result.isNotEmpty; // Nếu có kết quả thì đăng nhập thành công
    } catch (e) {
      print("Error during login: $e");
      return false;
    }
  }

  // Hàm lấy thông tin người dùng
  Future<List<Map<String, dynamic>>> getAllUsers() async {
    try {
      final db = await database;
      return await db.query('users');
    } catch (e) {
      print("Error retrieving users: $e");
      return []; // Trả về danh sách trống khi có lỗi
    }
  }
}

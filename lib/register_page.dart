import 'package:flutter/material.dart';
import 'package:mini_project_selatan/data/user_data.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _fullNameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  void _register() {
    String fullName = _fullNameController.text;
    String username = _usernameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;
    String confirmPassword = _confirmPasswordController.text;

    // Validasi sederhana
    if (fullName.isEmpty || username.isEmpty || email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      _showDialog("Registrasi Gagal", "Harap isi semua kolom.");
      return;
    }

    if (!email.contains('@')) {
      _showDialog("Email tidak valid", "Pastikan email mengandung '@'.");
      return;
    }

    if (password.length < 8) {
      _showDialog("Password terlalu pendek", "Password minimal 8 karakter.");
      return;
    }

    if (password != confirmPassword) {
      _showDialog("Password tidak cocok", "Konfirmasi password harus sama.");
      return;
    }

    // Simpan user
    userData[email] = {
      'fullName': fullName,
      'username': username,
      'password': password,
    };

    _showDialog(
      "Registrasi Berhasil",
      "Akun Anda telah dibuat. Silakan login.",
      onOk: () {
        Navigator.pop(context); // tutup dialog
        Navigator.pop(context); // kembali ke login
      },
    );
  }

  void _showDialog(String title, String message, {VoidCallback? onOk}) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              if (onOk != null) onOk();
            },
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Icon Logo
                const Icon(
                  Icons.shopping_bag,
                  size: 80,
                  color: Color(0xFF0088FF), // warna #0088FF
                ),
                const SizedBox(height: 10),

                // Title
                const Text(
                  'Create Account',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 4),

                const Text(
                  'Join us today !',
                  style: TextStyle(
                    color: Color(0xFF0088FF),
                    fontSize: 14,
                  ),
                ),

                const SizedBox(height: 30),

                // Fullname
                TextField(
                  controller: _fullNameController,
                  decoration: const InputDecoration(
                    labelText: 'Fullname',
                    border: UnderlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 15),

                // Username
                TextField(
                  controller: _usernameController,
                  decoration: const InputDecoration(
                    labelText: 'Username',
                    border: UnderlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 15),

                // Email
                TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: UnderlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 15),

                // Password
                TextField(
                  controller: _passwordController,
                  obscureText: _obscurePassword,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: const UnderlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 15),

                // Confirm Password
                TextField(
                  controller: _confirmPasswordController,
                  obscureText: _obscureConfirmPassword,
                  decoration: InputDecoration(
                    labelText: 'Confirm Password',
                    border: const UnderlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureConfirmPassword ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureConfirmPassword = !_obscureConfirmPassword;
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 30),

                // Register Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _register,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF0088FF), // warna #0088FF
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Register',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Sign In Link
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account? "),
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Text(
                        "Sign In",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

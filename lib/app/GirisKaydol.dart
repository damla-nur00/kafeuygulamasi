//GirisKaydol.dart
import 'package:flutter/material.dart';
import 'frame9.dart';
import 'menu_icerik_sf.dart';
import 'sepetim_sf.dart';
import 'bakery.dart';
import 'satinal.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart'; // inputFormatters için gerekli
import 'package:flutter/services.dart'; // inputFormatters için gerekli

// Giriş Yapma Fonksiyonu
Future<void> girisYap({
  required String phone,
  required String password,
  required BuildContext context,
}) async {
  try {
    final response = await http.post(
      Uri.parse('http://10.0.2.2:8080/api/users/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'phone': phone, 'password': password}),
    );

    if (response.statusCode == 200) {
      final user = jsonDecode(response.body);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Bakery()),
      );
    } else {
      showDialog(
        context: context,
        builder:
            (_) => AlertDialog(
              title: Text("Hata"),
              content: Text("Telefon veya şifre yanlış."),
            ),
      );
    }
  } catch (e) {
    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            title: SizedBox(child: Text("Hata")),
            content: Text("Bir hata oluştu: $e"),
          ),
    );
  }
}

// Kayıt Olma Fonksiyonu
Future<void> kayitOl({
  required String firstName,
  required String lastName,
  required String phone,
  required String password,
  required BuildContext context,
}) async {
  try {
    final response = await http.post(
      Uri.parse('http://10.0.2.2:8080/api/users/register'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'firstName': firstName,
        'lastName': lastName,
        'phone': phone,
        'password': password,
      }),
    );

    print("Status Code: ${response.statusCode}");
    print("Response Body: ${response.body}");

    if (response.statusCode == 200 || response.statusCode == 201) {
      showDialog(
        context: context,
        builder:
            (_) => AlertDialog(
              title: Text("Başarılı!"),
              content: Text("Kayıt tamamlandı, şimdi giriş yapabilirsin."),
            ),
      );
    } else {
      showDialog(
        context: context,
        builder:
            (_) => AlertDialog(
              title: Text("Kayıt Hatası"),
              content: Text(
                "Kullanıcı zaten kayıtlı olabilir ya da hata oluştu.",
              ),
            ),
      );
    }
  } catch (e) {
    print("Hata: $e");
    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            title: Text("Hata"),
            content: Text("Bir hata oluştu: $e"),
          ),
    );
  }
}

class GirisKaydol extends StatefulWidget {
  const GirisKaydol({super.key});

  @override
  _GirisKaydolState createState() => _GirisKaydolState();
}

class _GirisKaydolState extends State<GirisKaydol> {
  final TextEditingController telefonController = TextEditingController();
  final TextEditingController sifreController = TextEditingController();
  final TextEditingController isimController = TextEditingController();
  final TextEditingController soyisimController = TextEditingController();
  final TextEditingController kayitTelefonController = TextEditingController();
  final TextEditingController kayitSifreController = TextEditingController();

  bool isLogin =
      true; // Giriş ve kayıt sayfaları arasında geçiş yapmak için bir değişken

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        elevation: 0,
          automaticallyImplyLeading: false, // Geri butonunu gizler
        title: const Text(
          'THE Coffee',
          style: TextStyle(
            color: Color(0xFFF05454),
            fontSize: 32,
            fontWeight: FontWeight.bold,
            shadows: [
              Shadow(
                offset: Offset(0, 4),
                blurRadius: 4,
                color: Color.fromARGB(64, 255, 255, 255),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              constraints: BoxConstraints(maxWidth: 500),
              child: Column(
                children: [
                  SizedBox(height: 30),
                  if (isLogin) ...[
                    _buildInputField(
                      controller: telefonController,
                      hint: 'Telefon Numarası',
                      maxLength: 11,
                      keyboardType: TextInputType.phone,
                      inputFormatter: FilteringTextInputFormatter.digitsOnly,
                    ),
                    SizedBox(height: 15),
                    _buildInputField(
                      controller: sifreController,
                      hint: 'Şifre',
                      obscureText: true,
                      inputFormatter: FilteringTextInputFormatter.allow(
                        RegExp('[a-zA-Z0-9]'),
                      ), // Harf ve rakam kabul et
                    ),

                    _buildButton(
                      'Giriş',
                      onPressed: () {
                        final phone = telefonController.text.trim();
                        final password = sifreController.text.trim();

                        if (phone.isEmpty || password.isEmpty) {
                          showDialog(
                            context: context,
                            builder:
                                (_) => const AlertDialog(
                                  title: Text("Eksik Bilgi"),
                                  content: Text(
                                    "Lütfen telefon numarası ve şifreyi girin.",
                                  ),
                                ),
                          );
                          return;
                        }

                        girisYap(
                          phone: phone,
                          password: password,
                          context: context,
                        );
                      },
                    ),
                    SizedBox(height: 30),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          isLogin = false; // Kayıt olma sayfasına geçiş
                        });
                      },
                      child: Text(
                        'Hesabınız yok mu? Kaydolun',
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ] else ...[
                    _buildInputField(
                      controller: isimController,
                      hint: 'İsim',
                      inputFormatter: FilteringTextInputFormatter.allow(
                        RegExp('[a-zA-ZçÇğĞıİöÖşŞüÜ ]'),
                      ), // Yalnızca harfler
                    ),
                    SizedBox(height: 15),
                    _buildInputField(
                      controller: soyisimController,
                      hint: 'Soyisim',
                      inputFormatter: FilteringTextInputFormatter.allow(
                        RegExp('[a-zA-ZçÇğĞıİöÖşŞüÜ ]'),
                      ), // Yalnızca harfler
                    ),
                    SizedBox(height: 15),
                    _buildInputField(
                      controller: kayitTelefonController,
                      hint: 'Telefon Numarası',
                      maxLength: 11,
                      keyboardType: TextInputType.phone,
                      inputFormatter:
                          FilteringTextInputFormatter
                              .digitsOnly, // Sadece rakamlar
                    ),
                    SizedBox(height: 15),
                    _buildInputField(
                      controller: kayitSifreController,
                      hint: 'Şifre',
                      obscureText: true,
                      inputFormatter: FilteringTextInputFormatter.allow(
                        RegExp('[a-zA-Z0-9]'),
                      ), // Harf ve rakam kabul et
                    ),
                    _buildButton(
                      'Kaydol',
                      onPressed: () {
                        kayitOl(
                          firstName: isimController.text,
                          lastName: soyisimController.text,
                          phone: kayitTelefonController.text,
                          password: kayitSifreController.text,
                          context: context,
                        );
                      },
                    ),
                    SizedBox(height: 30),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          isLogin = true; // Giriş sayfasına geri dön
                        });
                      },
                      child: Text(
                        'Zaten hesabınız var mı? Giriş yapın',
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
      
    );
  }

  Widget _buildInputField({
    required TextEditingController controller,
    required String hint,
    bool obscureText = false,
    int? maxLength,
    TextInputType keyboardType = TextInputType.text,
    required TextInputFormatter inputFormatter,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFD9D9D9),
        borderRadius: BorderRadius.circular(27),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: TextField(
          controller: controller,
          obscureText: obscureText,
          maxLength: maxLength,
          keyboardType: keyboardType,
          inputFormatters: [inputFormatter], // Verilen formatı kullanıyoruz
          style: TextStyle(
            fontSize: 18,
            color: Color.fromARGB(255, 31, 24, 24),
          ),
          decoration: InputDecoration(
            hintText: hint,
            border: InputBorder.none,
            hintStyle: TextStyle(
              fontSize: 18,
              color: Color.fromARGB(255, 199, 158, 158),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildButton(String text, {required VoidCallback onPressed}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFFE16076),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

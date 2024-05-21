import 'package:flutter/material.dart';
import 'package:nokta_atisi/ml_kit/text_detector.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String text = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text('Nokta Atışı'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  TextField(
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w500),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        borderSide: BorderSide(width: 1.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        borderSide: BorderSide(color: Colors.green, width: 1.0),
                      ),
                      contentPadding: EdgeInsets.all(10.0),
                      hintText: 'Aradığınız kelimeyi girin...',
                      prefixIcon: Icon(Icons.search, color: Colors.blue),
                    ),
                    onChanged: (val) {
                      setState(() {
                        text = val;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(150, 40),
                        padding: const EdgeInsets.symmetric(horizontal: 22),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        elevation: 1),
                    onPressed: text.isEmpty
                        ? null
                        : () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        TextRecognizerView(text: text)));
                          },
                    child: const Text('Bul'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

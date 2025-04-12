import 'package:flutter/material.dart';

class GenerateImagePage extends StatelessWidget {
  GenerateImagePage({super.key});
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'VISONARY',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: SizedBox(
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(color: Colors.amber),
                child: Image.asset('assets/image.avif', fit: BoxFit.fill),
              ),
            ),
            SizedBox(
              height: 240,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextField(
                      controller: controller,
                      decoration: InputDecoration(
                        hintStyle: TextStyle(color: Colors.white70),
                        hintText: 'Generate an Image 🚀',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.purple),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: SizedBox(
                      width: double.maxFinite,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple,
                        ),
                        onPressed: () {},
                        child: Text(
                          'Generate',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

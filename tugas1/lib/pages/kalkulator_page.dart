import 'package:flutter/material.dart';

class KalkulatorPage extends StatefulWidget {
  @override
  _AdditionPageState createState() => _AdditionPageState();
}

class _AdditionPageState extends State<KalkulatorPage> {
  TextEditingController firstNumberController = TextEditingController();
  TextEditingController secondNumberController = TextEditingController();
  String result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kalklator'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: firstNumberController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Masukkan angka pertama',
                ),
              ),
              TextField(
                controller: secondNumberController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Masukkan angka kedua',
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  int firstNumber = int.tryParse(firstNumberController.text) ?? 0;
                  int secondNumber = int.tryParse(secondNumberController.text) ?? 0;
                  setState(() {
                    result = 'Hasil penjumlahan: ${firstNumber + secondNumber}';
                  });
                },
                child: const Text('Tambah'),
              ),
              ElevatedButton(
                onPressed: () {
                  int firstNumber = int.tryParse(firstNumberController.text) ?? 0;
                  int secondNumber = int.tryParse(secondNumberController.text) ?? 0;
                  setState(() {
                    result = 'Hasil penjumlahan: ${firstNumber - secondNumber}';
                  });
                },
                child: const Text('Kurang'),
              ),
              Text(result),
            ],
          ),
        ),
      ),
    );
  }
}

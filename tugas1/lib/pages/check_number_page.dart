import 'package:flutter/material.dart';

class OddEvenPage extends StatefulWidget {
  @override
  _OddEvenPageState createState() => _OddEvenPageState();
}

class _OddEvenPageState extends State<OddEvenPage> {
  TextEditingController numberController = TextEditingController();
  String result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ganjil atau Genap'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: numberController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Masukkan angka',
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  int number = int.tryParse(numberController.text) ?? 0;
                  setState(() {
                    if (number % 2 == 0) {
                      result = 'Angka $number adalah genap';
                    } else {
                      result = 'Angka $number adalah ganjil';
                    }
                  });
                },
                child: const Text('Cek Ganjil atau Genap'),
              ),
              Text(result),
            ],
          ),
        )
      ),
    );
  }
}
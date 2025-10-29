import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: Palindromo()));

class Palindromo extends StatefulWidget {
  @override
  State<Palindromo> createState() => _PalindromoState();
}

class _PalindromoState extends State<Palindromo> {
  final c = TextEditingController(); String r = '';
  void check() {
    var t = c.text.toLowerCase().replaceAll(' ', '');
    setState(() => r = t == t.split('').reversed.join() ? 'Palíndromo' : 'No lo es');
  }

  @override
  Widget build(_) => Scaffold(
    appBar: AppBar(title: Text('Palíndromo')),
    body: Padding(
      padding: EdgeInsets.all(20),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        TextField(controller: c, decoration: InputDecoration(labelText: 'Palabra')),
        ElevatedButton (onPressed: check, child: Text('Verificar')),
        Text(r, style: TextStyle(fontSize: 20))
      ]),
    ),
  );
}

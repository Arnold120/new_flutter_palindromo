import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MaterialApp(home: Palindromo()));

class Palindromo extends StatefulWidget {
  @override
  State<Palindromo> createState() => _PalindromoState();
}

class _PalindromoState extends State<Palindromo> with SingleTickerProviderStateMixin {
  final c = TextEditingController(); String r = '';
  Color color = Colors.black;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
    );
    _animation = Tween<double>(begin: 0, end: 8)
        .chain(CurveTween(curve: Curves.elasticIn))
        .animate(_controller);
  }

  void check() {
    var t = c.text.toLowerCase().replaceAll(' ', '');
    bool esPalindromo = t == t.split('').reversed.join();
    setState(() {
      r = esPalindromo ? 'Es palindromo' : 'No es palindromo';
      color = esPalindromo ? Colors.green : Colors.red;
    });
    if (!esPalindromo) _controller.forward(from: 0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(_) => Scaffold(
    appBar: AppBar(title: Text('Palíndromo')),
    body: Padding(
      padding: EdgeInsets.all(20),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        TextField(controller: c, decoration: InputDecoration(labelText: 'Palabra')),
        ElevatedButton (onPressed: check, child: Text('Verificar')),
        AnimatedBuilder(
          animation: _animation,
          builder: (context, child) => Transform.translate(
            offset: Offset(sin(_animation.value) * 8, 0),
            child: AnimatedDefaultTextStyle(
              duration: Duration(milliseconds: 300),
              style: TextStyle(fontSize: 20, color: color),
              child: Text(r),
            ),
          ),
        ),
      ]),
    ),
  );
}
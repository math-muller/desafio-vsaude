import 'package:flutter/material.dart';

class SaudeTab extends StatelessWidget {
  const SaudeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.pinkAccent.withOpacity(0.4),
      child: Center(
        child: Text(
          'LOGADO COM SUCESSO',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
    );
  }
}

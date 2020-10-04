import 'package:flutter/material.dart';

class EmptyListImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Nenhuma transação encontrada!',
          style: TextStyle(
            fontSize: 20,
            color: Colors.grey[500],
          ),
        ),
        Image.asset('assets/images/empty-list.png')
      ],
    );
  }
}
import 'package:flutter/material.dart';

class PageLoading extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 35,
        height: 35,
        child: CircularProgressIndicator(
          strokeWidth: 2,
        ),
      ),
    );
  }
}
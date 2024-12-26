import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Container();
        },
        separatorBuilder: (context, index) {
          return Divider();
        },
        
      ),
    );
  }
}

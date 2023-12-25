import 'package:flutter/material.dart';
class MassageDisplayWidget extends StatelessWidget {
  String massage;
   MassageDisplayWidget({Key? key ,required this.massage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(massage));
  }
}

import 'package:flutter/material.dart';
import '../widgets/expense_screen/expense_fetcher.dart';

class ExpenseScreen extends StatelessWidget {
  const ExpenseScreen({super.key});
  static const name = '/expense_screen';
  @override
  Widget build(BuildContext context) {
   
    final category = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
          iconTheme:const IconThemeData(color: Colors.black),
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50))),
          backgroundColor: Colors.cyan,
          centerTitle: true,
          elevation: 0,
          title:const  Text(
            'EXPENSES',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900),
          )),
      body: ExpenseFetcher(category),
    );
  }
}

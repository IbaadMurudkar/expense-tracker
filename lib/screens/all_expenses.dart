import 'package:flutter/material.dart';
import '../widgets/all_expenses_screen/all_expenses_fetcher.dart';

class AllExpenses extends StatefulWidget {
  const AllExpenses({super.key});
  static const name = '/all_expenses';

  @override
  State<AllExpenses> createState() => _AllExpensesState();
}

class _AllExpensesState extends State<AllExpenses> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50))),
          backgroundColor: Colors.cyan,
          centerTitle: true,
          elevation: 0,
          title: const Text(
            'ALL EXPENSES',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900),
          )),
      body: const AllExpensesFetcher(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/database_provider.dart';

class TotalExpense extends StatefulWidget {
  const TotalExpense({super.key});

  @override
  State<TotalExpense> createState() => _TotalExpenseState();
}

class _TotalExpenseState extends State<TotalExpense> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DatabaseProvider>(builder: (_, db, __) {
      var total = db.calculateTotalExpenses();
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Total Expenses: ₹ ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Text(
            '$total',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.red),
          ),
        ],
      );
    });
  }
}

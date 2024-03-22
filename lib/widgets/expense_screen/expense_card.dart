import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:intl/intl.dart';
import '../../models/expense.dart';

import '../../utils/constants/icons.dart';
import './confirm_box.dart';

class ExpenseCard extends StatelessWidget {
  final Expense exp;
  const ExpenseCard(this.exp, {super.key});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
        key: ValueKey(exp.id),
        confirmDismiss: (_) async {
          showDialog(
            context: context,
            builder: (_) => ConfirmBox(exp: exp),
          );
          return null;
        },
        child: Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: SizedBox(
            width: double.infinity,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: const GradientBoxBorder(
                  gradient: LinearGradient(colors: [
                    Color.fromRGBO(51, 206, 255, 0.56),
                    Color.fromRGBO(55, 244, 250, 1),
                    Color.fromRGBO(51, 66, 255, 0),
                    Color.fromRGBO(55, 244, 250, 1),
                  ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                  width: 1.5,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Icon(icons[exp.category]),
                    ),
                    Expanded(
                      child: SizedBox(
                        width: 200,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              exp.title,
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            FittedBox(
                              child: Text(
                                DateFormat('MMMM dd, yyyy').format(exp.date),
                                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                              ),
                            ),
                            Text(
                              exp.description,
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            NumberFormat.currency(locale: 'en_IN', symbol: '₹').format(exp.amount),
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}

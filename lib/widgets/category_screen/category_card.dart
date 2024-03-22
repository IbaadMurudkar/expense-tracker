import 'package:expense/utils/reusable_widgets.dart/divider_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../models/ex_category.dart';
import '../../screens/expense_screen.dart';

class CategoryCard extends StatelessWidget {
  final ExpenseCategory category;
  const CategoryCard(this.category, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: () {
            Navigator.of(context).pushNamed(
              ExpenseScreen.name,
              arguments: category.title, 
            );
          },
          leading: Icon(
            category.icon,
            color: Colors.cyan,
          ),
          title: Text(category.title),
          subtitle: Text('entries: ${category.entries}'),
          trailing: Text(NumberFormat.currency(locale: 'en_IN', symbol: '₹').format(category.totalAmount)),
        ),
        const DividerWidget()
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/database_provider.dart';

class ExpenseSearch extends StatefulWidget {
  const ExpenseSearch({Key? key}) : super(key: key);

  @override
  State<ExpenseSearch> createState() => _ExpenseSearchState();
}

class _ExpenseSearchState extends State<ExpenseSearch> {
  bool _isAscending = true;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DatabaseProvider>(context, listen: false);

    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          width: double.infinity,
          height: 50,
          child: TextField(
            onChanged: (value) {
              provider.searchText = value;
            },
            decoration: const InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.cyan,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.cyan,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
              labelText: 'Search expenses',
              labelStyle: TextStyle(color: Color.fromRGBO(189, 189, 189, 1)),
              prefixIcon: Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              height: 40,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.cyan),
                  onPressed: () {
                    setState(() {
                      _isAscending = !_isAscending;
                    });
                    _sortExpenses(provider);
                  },
                  child: Row(
                    children: [
                      const Text(
                        'Sort By Date',
                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Icon(
                        _isAscending ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                        color: Colors.black,
                        size: 20,
                      ),
                    ],
                  )),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }

  void _sortExpenses(DatabaseProvider provider) async {
    await provider.sortExpensesByDate(ascending: _isAscending);
  }
}

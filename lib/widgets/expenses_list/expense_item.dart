import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:expense_tracker/models/expense.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem (this.expense, {super.key});

  final Expense expense; 


  @override
  Widget build(BuildContext context) {
    return Card(
      
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(expense.title, style: Theme.of(context).textTheme.titleLarge,),
            const SizedBox(height: 4,),
            Row(
              children: [
                Text('\$${expense.amount.toStringAsFixed(2)}'), // the 2 represents the decimal eg instead of 12.3456 it will be 12.34
               const Spacer(),//spacer is a widget that can be used in any column or row to tell flutter that it should create a widget that takes up all the space it can get between which it is placed 
                Row(
                  children: [
                   Icon(categoryIcons[expense.category]),
                    const SizedBox(width: 8,),
                    Text(expense.formattedDate),
                
                  ],
                ),
              ],
            )
          ],
        ),
      ),
      );
  }
}

import 'package:uuid/uuid.dart';
import 'package:uuid/v4.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();

const uuid = Uuid(); // this is done outside of the class here because it doesnt belong to the class necessarily. instead its just a utility object which we can use anywhere in the file to getnerate Unique Id

enum Category{food, travel, leisure, work}     //enum is a keyword that allows us to create a custom type 

// for unique ID  run 'flutter pub add uuid' in the terminal  

const categoryIcons = {
 Category.food: Icons.lunch_dining,
 Category.travel:Icons.flight_takeoff,
 Category.leisure:Icons.movie,
 Category.work:Icons.work,
};


class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  
  }) : id = uuid.v4(); 
  
  // we could use positional parameters here, but here,
  // since we will need a couple of parameters, ill actually go for named parameter because if you expect more than two or three parameters in a function or in a construction,
  // like here, i personally find it easier to call that constructor function if you can target the different parameters by name instead of having to remember their position
  // and passing data in the right order to that function. using named parameter can simply be a bit easier here.


final String id; // you can also use an integer id suchas int id; for numbers like 1, 2, 3, 4
final String title;
final double amount; // this is a number with decimal eg 1.99
final  DateTime date; // DateTime is simply a special DATA TYPE that allows us to store date information in a singlr Value
final Category category;

String get formattedDate{
  return formatter.format(date);
}
}

class ExpenseBucket {
  const ExpenseBucket ({
    required this.category,
    required this.expenses,
  });

  ExpenseBucket.forCategory(List<Expense>allExpense, this.category)
  : expenses = allExpense.where((expense) => expense.category == category).toList();

  final Category category;
  final List<Expense> expenses;

  double get totalExpenses {
    double sum = 0;
   for (final expense in expenses) {
    sum += expense.amount; //sum = sum + expense.amount
   }

    return sum;
  }
}
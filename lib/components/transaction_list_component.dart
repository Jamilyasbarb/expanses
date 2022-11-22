import 'package:expanses/models/transaction_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {

  final List<Transaction> transactions;

  const TransactionList(this.transactions,{super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: ListView(
        children: transactions.map((tr) {
          return Card(
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 15, 
                    vertical: 10
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.purple,
                      width: 2,
                    ),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    'R\$ ${tr.value.toString()}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Theme.of(context).primaryColor
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tr.title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
          
                      ),
                    ),
                    Text(
                      DateFormat('d MMM y').format(tr.date), 
                        style: TextStyle(
                        color: Colors.grey
                      ),
                    )
                  ],
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
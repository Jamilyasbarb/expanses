import 'dart:math';

import 'package:flutter/material.dart';

import 'components/transaction_form_component.dart';
import 'components/transaction_list_component.dart';
import 'models/transaction_model.dart';

main(){
  runApp(const ExpansesApp());
}

class ExpansesApp extends StatelessWidget {
  const ExpansesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
   MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 final _transactions = [
    Transaction(
      id: 't1', 
      title: 'Novo Tênis corrida', 
      value: 310.76, 
      date: DateTime.now()
    ),
    Transaction(
      id: 't2', 
      title: 'Conta de luz', 
      value: 80.79, 
      date: DateTime.now()
    ),
  ];
  _openTransactionFormModal(BuildContext context){
    showModalBottomSheet(
      context: context, 
      builder: (ctx){
        return TransactionForm(_addTransaction);
      },
    );
    print(context);
    // Navigator.of(context).pop();
  }

  _addTransaction(String title, double value){
    final newTransiction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: DateTime.now()
    );
    setState(() {
      _transactions.add(newTransiction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Despesas Pessoais'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.add),
          onPressed: (){
            _openTransactionFormModal(context);
          },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              width: MediaQuery.of(context).size.width,
              // height: MediaQuery.of(context).size.height,
              child: Card(
                color: Colors.pink[50],
                child: Text('Gráfico'),
                elevation: 5,
              ),
            ),
            Column(
              children: [
                TransactionList(_transactions),
              ],
            ),
            // TransactionUser()
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          _openTransactionFormModal(context);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
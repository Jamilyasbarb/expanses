import 'package:flutter/material.dart';
import 'package:expanses/models/transaction_model.dart';
import 'package:intl/intl.dart';

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

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
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
            children: _transactions.map((tr) {
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
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'R\$ ${tr.value.toString()}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.purple
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
              // return ListTile(
              //   leading: ClipRRect(
              //     borderRadius: BorderRadius.circular(50),
              //     child: Container(
              //       height: 150,
              //       width: 58,
              //       color: Colors.blue,
              //       child: Center(child: Text(tr.value.toString())),
              //     ),
              //   ),
              //   title: Text(tr.title),
              //   subtitle: Text(tr.date.toString()),
              // );
            }).toList(),
          ),
          Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Título',
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'R\$ Valor'
                      // border: OutlineInputBorder()
                    ),
                  ),
                  TextButton(
                    onPressed: (){}, 
                    child: Text('Nova Transação', style: TextStyle(color: Colors.purple),),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
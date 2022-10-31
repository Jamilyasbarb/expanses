import 'package:flutter/material.dart';


class TransactionForm extends StatefulWidget {

  final void Function(String, double) OnSubmit;

  TransactionForm(this.OnSubmit);

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final titleController = TextEditingController();

  final valueController = TextEditingController();

  _submitForm(){
    final title = titleController.text;
    final value = double.tryParse(valueController.text) ?? 0.0;

    if(title.isEmpty || value <= 0){
      return;
    }
    widget.OnSubmit(title, value);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextField(
                    //funcionar tanto pra windows como pra ios
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    onSubmitted: ((_) => _submitForm()),
                    controller: titleController,
                    decoration: InputDecoration(
                      labelText: 'Título',
                    ),
                  ),
                  TextField(
                    controller: valueController,
                    onSubmitted: ((_) => _submitForm()),
                    decoration: InputDecoration(
                      labelText: 'R\$ Valor'
                      // border: OutlineInputBorder()
                    ),
                  ),
                  TextButton(
                    onPressed: _submitForm, 
                    child: Text('Nova Transação', style: TextStyle(color: Colors.purple),),
                  ),
                ],
              ),
            ),
          );
  }
}
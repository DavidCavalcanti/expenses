import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  late final void Function(String, double)? onSubmit;

  TransactionForm(this.onSubmit);

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  late final titleController = TextEditingController();

  late final valueController = TextEditingController();

  _submitForm() {
    final title = titleController.text;
    final value =
        double.tryParse(valueController.text) ?? 0.0; // converter em double

    // Verificar dados inválidos
    if (title.isEmpty || value <= 0) {
      return;
    }
    widget.onSubmit!(title, value);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              onSubmitted: (_) => _submitForm(),
              decoration: InputDecoration(
                labelText: 'Título',
              ),
            ),
            TextField(
              controller: valueController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) =>
                  _submitForm(), // "_" usado para informar que o parâmetro não será usado
              decoration: InputDecoration(
                labelText: 'Valor (R\$)',
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.purple,
                  ),
                  child: const Text('Nova Transação'),
                  onPressed: _submitForm,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

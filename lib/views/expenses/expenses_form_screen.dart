import 'package:fcash_app/controllers/expenses/expenses_form_controller.dart';
import 'package:fcash_app/data/models/expense.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';

class ExpensesFormScreen extends StatefulWidget {
  @override
  _ExpensesFormScreenState createState() => _ExpensesFormScreenState();
}

class _ExpensesFormScreenState extends State<ExpensesFormScreen> {
  final controller = ExpensesFormController();

  ReactionDisposer disposer;

  @override
  void initState() {
    super.initState();

    disposer = autorun((_) {
      if (controller.isFormSaved) {
        Navigator.of(context).pop();
        Flushbar(
          message: 'Despensa foi salva com sucesso!',
          duration: Duration(seconds: 3),
        ).show(context);
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final expense = ModalRoute.of(context).settings.arguments as Expense;

    if (expense != null) {
      controller.setExpense(expense);
    }
  }

  @override
  void dispose() {
    disposer();
    super.dispose();
  }

  _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2050),
    ).then(controller.setDate);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Nova despesa',
        ),
        backgroundColor: Colors.red[400],
      ),
      body: Observer(
        builder: (_) {
          return controller.isBusy
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  child: Column(
                    children: [
                      Observer(
                        builder: (_) {
                          return Container(
                            child: TextFormField(
                              initialValue: controller.description,
                              autovalidate: controller.autovalidate,
                              validator: controller.descriptionValidation,
                              onChanged: controller.setDescription,
                              decoration: InputDecoration(
                                labelText: 'Descrição',
                              ),
                            ),
                          );
                        },
                      ),
                      Observer(
                        builder: (_) {
                          return Container(
                            child: TextFormField(
                              initialValue: controller.expenseValue,
                              autovalidate: controller.autovalidate,
                              decoration: InputDecoration(
                                labelText: 'Valor (R\$)',
                                fillColor: Colors.white,
                              ),
                              keyboardType: TextInputType.number,
                              validator: controller.expenseValueValidation,
                              onChanged: controller.setExpenseValue,
                            ),
                          );
                        },
                      ),
                      Observer(
                        builder: (_) {
                          final format = new DateFormat(
                            'dd/MM/yyyy',
                          );
                          return Container(
                            child: TextFormField(
                              autovalidate: controller.autovalidate,
                              controller: TextEditingController(
                                text: controller.isDateValid
                                    ? format.format(controller.date)
                                    : null,
                              ),
                              decoration: InputDecoration(
                                labelText: 'Data',
                                fillColor: Colors.white,
                              ),
                              onTap: _showDatePicker,
                              keyboardType: TextInputType.datetime,
                              validator: controller.dateValidation,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                DataInputFormatter()
                              ],
                            ),
                          );
                        },
                      ),
                      Observer(
                        builder: (_) {
                          return Container(
                            child: DropdownButtonFormField(
                              value: controller.categorie,
                              isExpanded: true,
                              autovalidate: controller.autovalidate,
                              decoration: InputDecoration(
                                labelText: 'Categoria',
                                fillColor: Colors.white,
                              ),
                              validator: controller.categorieValidation,
                              items: [
                                DropdownMenuItem(
                                  child: Text(
                                    'Alimentação',
                                  ),
                                  value: 'alimentacao',
                                ),
                                DropdownMenuItem(
                                  child: Text(
                                    'Educação',
                                  ),
                                  value: 'educacao',
                                ),
                                DropdownMenuItem(
                                  child: Text(
                                    'Lazer',
                                  ),
                                  value: 'lazer',
                                ),
                                DropdownMenuItem(
                                  child: Text(
                                    'Moradia',
                                  ),
                                  value: 'moradia',
                                ),
                                DropdownMenuItem(
                                  child: Text(
                                    'Pagamentos',
                                  ),
                                  value: 'pagamentos',
                                ),
                                DropdownMenuItem(
                                  child: Text(
                                    'Roupa',
                                  ),
                                  value: 'roupa',
                                ),
                                DropdownMenuItem(
                                  child: Text(
                                    'Saúde',
                                  ),
                                  value: 'saude',
                                ),
                                DropdownMenuItem(
                                  child: Text(
                                    'Transporte',
                                  ),
                                  value: 'transporte',
                                )
                              ],
                              onChanged: controller.setCategorie,
                            ),
                          );
                        },
                      ),
                      Container(
                        child: TextFormField(
                          initialValue: controller.observation,
                          maxLines: 3,
                          decoration: InputDecoration(
                            labelText: 'Observação',
                          ),
                          onChanged: controller.setObservation,
                        ),
                      ),
                    ],
                  ),
                );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.save,
          color: Colors.black,
        ),
        backgroundColor: Colors.amber[600],
        onPressed: () {
          controller.setAutovalidate();
          controller.saveButtonPressed();
        },
      ),
    );
  }
}

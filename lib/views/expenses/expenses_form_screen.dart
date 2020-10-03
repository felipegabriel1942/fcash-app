import 'package:fcash_app/controllers/expenses/expenses_form_controller.dart';
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
  void didChangeDependencies() {
    super.didChangeDependencies();

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
                              autovalidate: controller.autovalidate,
                              decoration: InputDecoration(
                                labelText: 'Descrição',
                              ),
                              validator: controller.descriptionValidation,
                              onChanged: controller.setDescription,
                            ),
                          );
                        },
                      ),
                      Observer(
                        builder: (_) {
                          return Container(
                            child: TextFormField(
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
                                )
                              ],
                              onChanged: controller.setCategorie,
                            ),
                          );
                        },
                      ),
                      Container(
                        child: TextFormField(
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
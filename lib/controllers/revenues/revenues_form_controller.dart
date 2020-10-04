import 'package:fcash_app/controllers/revenues/revenues_controller.dart';
import 'package:fcash_app/data/models/revenue.dart';
import 'package:fcash_app/data/repositories/revenue_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
part 'revenues_form_controller.g.dart';

class RevenuesFormController = _RevenuesFormControllerBase
    with _$RevenuesFormController;

abstract class _RevenuesFormControllerBase with Store {
  final revenuesRepository = RevenuesRepository();
  final revenuesController = GetIt.I<RevenuesController>();

  @observable
  bool autovalidate = false;

  @observable
  int id;

  void setAutovalidate() => autovalidate = !autovalidate;

  @observable
  String description;

  @action
  void setDescription(String value) => description = value;

  @computed
  bool get isDescriptionValid => description != null && description.isNotEmpty;

  @action
  String descriptionValidation(String value) {
    if (!isDescriptionValid) {
      return 'Campo obrigatório';
    }
    return null;
  }

  @observable
  String revenueValue;

  @action
  void setRevenueValue(String value) => revenueValue = value;

  @computed
  bool get isRevenueValueValid =>
      revenueValue != null && revenueValue.isNotEmpty;

  @action
  String revenueValueValidation(String value) {
    if (!isRevenueValueValid) {
      return 'Campo obrigatório';
    }
    return null;
  }

  @observable
  DateTime date = DateTime.now();

  @action
  void setDate(DateTime value) => date = value;

  @computed
  bool get isDateValid => date != null;

  @action
  String dateValidation(String value) {
    if (!isDateValid) {
      return 'Campo obrigatório';
    }
    return null;
  }

  @observable
  String categorie;

  @action
  void setCategorie(String value) => categorie = value;

  @action
  String categorieValidation(String value) {
    if (value == null || value.isEmpty) {
      return 'Campo obrigatório';
    }
    return null;
  }

  @observable
  String observation;

  @observable
  bool isBusy = false;

  @action
  void setObservation(String value) => observation = value;

  @computed
  bool get isFormValid =>
      isDescriptionValid && isRevenueValueValid && isDateValid;

  @computed
  Function get saveButtonPressed => isFormValid ? _saveRevenue : () {};

  @observable
  bool isFormSaved = false;

  @action
  void setRevenue(Revenue revenue) {
    id = revenue.id;
    description = revenue.description;
    revenueValue = revenue.value.toStringAsFixed(2);
    date = DateTime.parse(revenue.date);
    categorie = revenue.categorie;
    observation = revenue.observation;
  }

  Future<void> _saveRevenue() async {
    isBusy = true;

    final newRevenue = Revenue(
      id: id,
      description: description,
      value: double.parse(revenueValue),
      date: date.toIso8601String(),
      categorie: categorie,
      observation: observation,
    );

    try {
      id == null
          ? await revenuesRepository.insertRevenue(newRevenue)
          : await revenuesRepository.updateRevenue(newRevenue);

      await revenuesController.loadRevenues();
      isFormSaved = true;
    } catch (e) {
      print(e);
    } finally {
      isBusy = false;
    }
  }
}

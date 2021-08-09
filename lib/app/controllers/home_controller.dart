import 'package:currency_converter/app/Models/currency_model.dart';
import 'package:flutter/cupertino.dart';

class HomeController {
  late List<CurrencyModel> currencies;

  // Pegar o que foi inserido
  final TextEditingController toText;
  final TextEditingController fromText;

  late CurrencyModel toCurrency;
  late CurrencyModel fromCurrency;

  HomeController({required this.toText, required this.fromText}) {
    // vai me dar a lista (array) das moedas
    currencies = CurrencyModel.getCurrencies();
    toCurrency = currencies[0];
    fromCurrency = currencies[1];
  }

  void convert() {
    String text = toText.text;
    double value = double.tryParse(text.replaceAll(
      ',', '.')) ?? 1.0;
    double totalValue = 0;

    switch (fromCurrency.name) {
      case 'Real':
        totalValue = value * toCurrency.real;
        break;
      case 'Dólar':
        totalValue = value * toCurrency.dolar;
        break;
      case 'Euro':
        totalValue = value * toCurrency.euro;
        break;
      case 'Bitcoin':
        totalValue = value * toCurrency.bitcoin;
        break;
    }

    fromText.text = totalValue.toStringAsFixed(3);
  }
}

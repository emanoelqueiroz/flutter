import 'package:flutter/material.dart';

import 'package:salario/common/format_number.dart';
import 'package:salario/widget/discount_row.widget.dart';

class ResultPage extends StatefulWidget {
  final double salarioBruto;

  ResultPage({
    @required this.salarioBruto,
  });

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  double inssValue = 0;
  double irrfValue = 0;
  double salarioLiquido = 0;

  double calculaINSS() {
    double value = widget.salarioBruto;

    if (value <= 1100) return value * 7.5 / 100;

    if (value <= 2203.48) return value * 9 / 100;

    if (value <= 3305.22) return value * 12 / 100;

    return value * 14 / 100;
  }

  double calculaIRRF() {
    double value = widget.salarioBruto - inssValue;

    if (value <= 1903.98) return 0;

    if (value <= 2826.66) return (value * 7.5 / 100) - 142.80;

    if (value <= 3751.05) return (value * 15 / 100) - 354.80;

    if (value <= 4664.68) return (value * 22.5 / 100) - 636.13;

    return (value * 27.5 / 100) - 869.36;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    setState(() {
      inssValue = calculaINSS();
      irrfValue = calculaIRRF();
      salarioLiquido = widget.salarioBruto - inssValue - irrfValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resultado'),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 12,
          ),
          const Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Salário Líquido'),
          ),
          Text(
            FormatNumber.money(salarioLiquido),
            style: const TextStyle(
              color: Colors.green,
              fontSize: 45,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Divider(),
          const Text(
            'Descontos',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          DiscountRow(
            title: 'INSS',
            value: inssValue,
          ),
          DiscountRow(
            title: 'IRRF',
            value: irrfValue,
          ),
        ],
      ),
    );
  }
}

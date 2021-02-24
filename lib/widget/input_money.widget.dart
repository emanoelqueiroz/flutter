import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class InputMoney extends StatefulWidget {
  final String labelText;
  final TextEditingController textEditingController;

  InputMoney({
    @required this.textEditingController,
    this.labelText = '',
  });

  @override
  _InputMoneyState createState() => _InputMoneyState();
}

class _InputMoneyState extends State<InputMoney> {
  final MoneyMaskedTextController controller = new MoneyMaskedTextController(
    leftSymbol: 'R\$ ',
  );

  @override
  void initState() {
    super.initState();

    widget.textEditingController.addListener(() {
      controller.updateValue(double.parse(widget.textEditingController.text));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: TextFormField(
        keyboardType: TextInputType.number,
        controller: controller,
        decoration: InputDecoration(
          labelText: widget.labelText,
        ),
        textAlign: TextAlign.right,
        onChanged: (value) {
          widget.textEditingController.value = TextEditingValue(
            text: controller.numberValue.toString(),
          );
        },
      ),
    );
  }
}

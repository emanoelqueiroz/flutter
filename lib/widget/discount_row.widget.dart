import 'package:flutter/material.dart';

import 'package:salario/common/format_number.dart';

class DiscountRow extends StatelessWidget {
  final String title;
  final double value;
  final Color color;

  DiscountRow({
    this.title,
    this.value,
    this.color = Colors.red,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              color: color,
              fontSize: 16,
            ),
          ),
          Container(
            child: Row(
              children: [
                Icon(
                  Icons.remove,
                  size: 16,
                  color: color,
                ),
                Text(
                  FormatNumber.money(value),
                  style: TextStyle(
                    color: color,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

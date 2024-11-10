import 'package:flutter/material.dart';

class CurrencyInputField extends StatelessWidget {
  final TextEditingController controller;
  final String selectedCurrency;
  final List<String> currencies;
  final Function(String?) onCurrencyChanged;
  final String hintText;
  final bool isEditable;

  const CurrencyInputField({
    Key? key,
    required this.controller,
    required this.selectedCurrency,
    required this.currencies,
    required this.onCurrencyChanged,
    required this.hintText,
    this.isEditable = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300, width: 1.5),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: controller,
              enabled: isEditable,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
                hintText: hintText,
              ),
            ),
          ),
          const VerticalDivider(
            color: Colors.grey,
            width: 1,
            thickness: 1,
            indent: 5,
            endIndent: 5,
          ),
          DropdownButton<String>(
            value: selectedCurrency,
            onChanged: onCurrencyChanged,
            underline: Container(),
            items: currencies.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(value),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

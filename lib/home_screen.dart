import 'package:currencyconversionapp/components/inputfield_widget.dart';
import 'package:currencyconversionapp/components/text_widget.dart';
import 'package:currencyconversionapp/components/themecolor_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:currencyconversionapp/screens/about_screen.dart';
import 'package:currencyconversionapp/screens/contact_screen.dart';

class CurrencyConversion extends StatefulWidget {
  const CurrencyConversion({super.key});

  @override
  State<CurrencyConversion> createState() => _CurrencyConversionState();
}

class _CurrencyConversionState extends State<CurrencyConversion> {
  final TextEditingController amountController = TextEditingController();
  final TextEditingController resultController = TextEditingController();
  String baseCurrency = 'USD';
  String targetCurrency = 'PKR';
  double conversionRate = 0.0;
  bool isLoading = false;

  final List<String> currencies = [
    'USD', 'EUR', 'GBP', 'INR', 'CNY', 'JPY', 'AUD', 'PKR', 'CAD', 'CHF'
  ];

  Future<void> fetchConversionRate() async {
    if (baseCurrency == targetCurrency) {
      setState(() {
        conversionRate = 1.0;
        double amount = double.tryParse(amountController.text) ?? 0.0;
        resultController.text = amount.toStringAsFixed(2);
      });
      return;
    }

    setState(() {
      isLoading = true;
    });

    final url = 'https://api.exchangerate-api.com/v4/latest/$baseCurrency';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          conversionRate = data['rates'][targetCurrency];
        });
        double amount = double.tryParse(amountController.text) ?? 0.0;
        resultController.text = (amount * conversionRate).toStringAsFixed(2);
      } else {
        throw Exception('Failed to fetch data');
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Currency Conversion',
          style: TextComponents.pageTitle,
        ),
        backgroundColor: ThemeColors.primaryColor,
        elevation: 0,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(
                color: ThemeColors.primaryColor,
              ),
              child: Text(
                'Menu',
                style: TextComponents.titleText.copyWith(color: Colors.white),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home', style: TextComponents.bodyText),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('About', style: TextComponents.bodyText),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AboutScreen(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.contact_mail),
              title: const Text('Contact Us', style: TextComponents.bodyText),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ContactUsScreen(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text('Exit', style: TextComponents.bodyText),
              onTap: () {
                _showExitDialog(context);
              },
            ),
          ],
        ),
      ),
      resizeToAvoidBottomInset: true, // Ensures layout adjusts when keyboard is open
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Image.asset(
                'lib/assets/homeicon.png',
                height: 170,
                width: 170,
              ),
            ),
            CurrencyInputField(
              controller: amountController,
              selectedCurrency: baseCurrency,
              currencies: currencies,
              onCurrencyChanged: (newCurrency) {
                setState(() {
                  baseCurrency = newCurrency!;
                });
                fetchConversionRate();
              },
              hintText: 'Enter amount',
            ),
            const SizedBox(height: 20),
            CurrencyInputField(
              controller: resultController,
              selectedCurrency: targetCurrency,
              currencies: currencies,
              onCurrencyChanged: (newCurrency) {
                setState(() {
                  targetCurrency = newCurrency!;
                });
                fetchConversionRate();
              },
              hintText: 'Converted amount',
              isEditable: false,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: isLoading ? null : fetchConversionRate,
              style: ElevatedButton.styleFrom(
                backgroundColor: ThemeColors.primaryColor,
                minimumSize: const Size.fromHeight(50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              child: isLoading
                  ? const CircularProgressIndicator(color: Colors.white)
                  : const Text(
                'Convert',
                style: TextComponents.buttonText,
              ),
            ),
            const SizedBox(height: 200),
            const Text(
              'Developed by Muhammad Asghar',
              style: TextComponents.footerText,
            ),
          ],
        ),
      ),
    );
  }

  void _showExitDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Exit App'),
          content: const Text('Do you want to exit the app?'),
          actions: <Widget>[
            TextButton(
              child: const Text('No'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Yes'),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

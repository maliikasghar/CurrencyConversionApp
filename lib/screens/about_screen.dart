import 'package:flutter/material.dart';
import 'package:currencyconversionapp/components/themecolor_widget.dart';
import 'package:currencyconversionapp/components/text_widget.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'About',
          style: TextComponents.pageTitle,
        ),
        backgroundColor: ThemeColors.primaryColor,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Currency Converter App',
                style: TextComponents.titleText.copyWith(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: Text(
                'Version 1.0.0',
                style: TextComponents.bodyText.copyWith(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
            ),
            const Divider(height: 30, color: Colors.grey),
            _buildSectionTitle('About the App'),
            _buildSectionContent(
              'This Currency Converter app allows you to easily convert between different currencies. '
                  'Simply select the base currency and the target currency, enter the amount, and get the converted result. '
                  'This app fetches real-time conversion rates to provide you with the latest currency exchange information.',
            ),
            const SizedBox(height: 20),
            _buildSectionTitle('Features'),
            _buildSectionContent(
              '• Real-time currency conversion\n'
                  '• Support for multiple currencies\n'
                  '• Clean and user-friendly interface\n'
                  '• Simple navigation and usage',
            ),
            const Divider(height: 30, color: Colors.grey),
            _buildSectionTitle('Developer'),
            _buildSectionContent(
              'This app was developed by Muhammad Asghar, a Flutter developer focused on building high-quality, efficient mobile applications.',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextComponents.subtitleText.copyWith(
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _buildSectionContent(String content) {
    return Text(
      content,
      style: TextComponents.bodyText.copyWith(
        fontSize: 16,
        height: 1.4,
      ),
    );
  }
}

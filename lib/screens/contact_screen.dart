import 'package:flutter/material.dart';
import 'package:currencyconversionapp/components/themecolor_widget.dart';
import 'package:currencyconversionapp/components/text_widget.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // Ensure this is correct

class ContactUsScreen extends StatelessWidget {
  final String contactEmail = 'maliikasgharr@gmail.com';
  final String whatsappNumber = '+923419739125';

  // Method to launch email client
  Future<void> _launchEmail() async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: contactEmail,
      query: 'subject=Contact%20Support&body=Hello,',
    );

    if (await canLaunchUrl(emailLaunchUri)) {
      await launchUrl(emailLaunchUri);
    } else {
      throw 'Could not launch $emailLaunchUri';
    }
  }

  // Method to open WhatsApp chat
  Future<void> _launchWhatsApp() async {
    final Uri whatsappUri = Uri.parse(
        'https://wa.me/$whatsappNumber?text=Hello,%20I%20would%20like%20to%20get%20in%20touch%20regarding%20your%20app.');

    if (await canLaunchUrl(whatsappUri)) {
      await launchUrl(whatsappUri);
    } else {
      throw 'Could not launch $whatsappUri';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Contact Us',
          style: TextComponents.pageTitle,
        ),
        backgroundColor: ThemeColors.primaryColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Text(
              'Get in Touch',
              style: TextComponents.titleText.copyWith(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              'We’re always here to help! Whether you have questions, need support, or just want to say hello, feel free to reach out to us.',
              style: TextComponents.bodyText.copyWith(
                fontSize: 16,
                height: 1.4,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 4,
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Icon(
                      Icons.email,
                      color: ThemeColors.primaryColor,
                      size: 30,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Email Us',
                      style: TextComponents.subtitleText.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,

                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      contactEmail,
                      style: TextComponents.bodyText.copyWith(
                        fontSize: 16,
                        color: ThemeColors.primaryColor,
                      ),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton.icon(
                      onPressed: _launchEmail,
                      icon: Icon(Icons.email),
                      label: Text('Send an Email'),
                      style: ElevatedButton.styleFrom(
                        iconColor: Colors.white,
                        backgroundColor: ThemeColors.primaryColor,
                        minimumSize: const Size(150, 45),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 4,
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    FaIcon(
                      FontAwesomeIcons.whatsapp,
                      color: Colors.green,
                      size: 30,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'WhatsApp Us',
                      style: TextComponents.subtitleText.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      whatsappNumber,
                      style: TextComponents.bodyText.copyWith(
                        fontSize: 16,
                        color: Colors.green,
                      ),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton.icon(
                      onPressed: _launchWhatsApp,
                      icon: FaIcon(FontAwesomeIcons.whatsapp),
                      label: Text('Message on WhatsApp'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        iconColor: Colors.white,
                        minimumSize: const Size(150, 45),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

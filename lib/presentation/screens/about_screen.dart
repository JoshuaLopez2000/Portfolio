import 'package:flutter/material.dart';
import 'package:untitled/l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  Future<void> _sendEmail() async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'joshualopez2000@hotmail.com',
      queryParameters: {'subject': 'Contacto desde mi App'},
    );

    if (await canLaunchUrl(emailLaunchUri)) {
      await launchUrl(emailLaunchUri);
    } else {
      debugPrint('No se pudo abrir la aplicación de correo');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.aboutMe)),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Hero(
                tag: 'avatar-hero',
                child: CircleAvatar(
                  radius: 70, // Un poco más grande para el efecto
                  child: Icon(Icons.person, size: 70),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'López Nava Joshua Ivan',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              Text(
                AppLocalizations.of(context)!.myDescription,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 30),
              Card(
                elevation: 4,
                child: ListTile(
                  leading: const Icon(Icons.email, color: Colors.blue),
                  title: const Text('Enviame un correo'),
                  subtitle: const Text('joshualopez2000@hotmail.com'),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: _sendEmail,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'dart:io' show Platform;

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';

// Serviço de Notificações
class NotificationService {
  static final _notifications = FlutterLocalNotificationsPlugin();

  Future<void> init() async {
    const AndroidInitializationSettings androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings initSettings =
        InitializationSettings(android: androidSettings);

    await _notifications.initialize(initSettings);

    if (Platform.isAndroid) {
      await _notifications
          .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
          ?.requestNotificationsPermission();
    }
  }

  Future<void> scheduleDailyNotification() async {
    const AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
      'daily_reminder_channel',
      'Lembretes Diários',
      channelDescription: 'Lembrete diário para cuidar da sua saúde mental.',
      importance: Importance.max,
      priority: Priority.high,
    );

    const NotificationDetails notificationDetails =
        NotificationDetails(android: androidDetails);

    // await _notifications.periodicallyShowWithDuration(
    //   0, // ID da notificação
    //   'Hora de cuidar de você!',
    //   'Reserve um momento para seu bem-estar.',
      
    //   const Duration(minutes: 1), // 9h da manhã
      
    //   notificationDetails,
      
    // );

    await _notifications.show(
      0, // ID da notificação
      'Hora de cuidar de você!',
      'Reserve um momento para seu bem-estar.',
      notificationDetails,
      
    );
  }

  Future<void> cancelAllNotifications() async {
    await _notifications.cancelAll();
  }
}

// Estado de Configurações do App
class AppSettings extends ChangeNotifier {
  bool isDarkMode = false;
  bool isSoundOn = true;
  bool isNotificationOn = false;

  void toggleDarkMode() {
    isDarkMode = !isDarkMode;
    notifyListeners();
  }

  void toggleSound() async{
    isSoundOn = !isSoundOn;
    if(!isSoundOn){
      final audio = AudioPlayer();
      await audio.stop();
    }    
    notifyListeners();
  }

  void toggleNotification() async {
    isNotificationOn = !isNotificationOn;
    if (isNotificationOn) {
      await NotificationService().scheduleDailyNotification();
    } else {
      await NotificationService().cancelAllNotifications();
    }
    notifyListeners();
  }
}

// Aplicativo Principal
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final settings = Provider.of<AppSettings>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'S.depressão',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: settings.isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: const SettingsScreen(),
    );
  }
}

// Tela de Ajustes
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final settings = Provider.of<AppSettings>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ajustes'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            SwitchListTile(
              title: const Text('Modo Escuro'),
              value: settings.isDarkMode,
              onChanged: (value) => settings.toggleDarkMode(),
            ),
            const Divider(),
            // SwitchListTile(
            //   title: const Text('Som Ativado'),
            //   value: settings.isSoundOn,
            //   onChanged: (value) => settings.toggleSound(),
            // ),
            // const Divider(),
            SwitchListTile(
              title: const Text('Notificações e Lembretes Diários'),
              value: settings.isNotificationOn,
              onChanged: (value) => settings.toggleNotification(),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.support_agent),
              title: const Text('Apoio e Suporte'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const SupportScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// Tela de Apoio e Suporte
class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Apoio e Suporte'),
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Você não está sozinho!',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                '\nSe estiver precisando de apoio emocional ou orientações, estamos aqui para ajudar!\n\nEntre em contato com nossa equipe:\nsuporte@sdepressao.com',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/screens/user_profile_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User Profile App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF7BBF4B),
        fontFamily: 'Inter',
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFF9F9F9),
          elevation: 0,
          iconTheme: IconThemeData(
            color: Color(0xFF8CC75D),
          ),
        ),
      ),
      home: const UserProfileScreen(),
      routes: {
        '/profile': (context) => const UserProfileScreen(),
        '/economic-advancement': (context) => Scaffold(
              appBar: AppBar(title: const Text('Economic Advancement')),
              body: const Center(child: Text('Economic Advancement Details')),
            ),
        '/boys-and-girls-club': (context) => Scaffold(
              appBar: AppBar(title: const Text('Boys & Girls Club')),
              body: const Center(child: Text('Boys & Girls Club Details')),
            ),
        '/education': (context) => Scaffold(
              appBar: AppBar(title: const Text('Education')),
              body: const Center(child: Text('Education Details')),
            ),
        '/egt-solar': (context) => Scaffold(
              appBar: AppBar(title: const Text('EGT Solar')),
              body: const Center(child: Text('EGT Solar Details')),
            ),
        '/networked-capital': (context) => Scaffold(
              appBar: AppBar(title: const Text('Networked Capital')),
              body: const Center(child: Text('Networked Capital Details')),
            ),
        '/actions': (context) => Scaffold(
              appBar: AppBar(title: const Text('Actions')),
              body: const Center(child: Text('Actions Page')),
            ),
        '/messaging': (context) => Scaffold(
              appBar: AppBar(title: const Text('Messaging')),
              body: const Center(child: Text('Messaging Page')),
            ),
      },
    );
  }
}
import 'package:flutter/material.dart';
import 'widgets/mission_nc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Networked Capital',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Inter',
      ),
      home: const MissionNCScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MissionNCScreen extends StatelessWidget {
  const MissionNCScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: MissionNC(
          projectTitle: "Networked Capital",
          projectImage: "https://cdn.builder.io/api/v1/image/assets/TEMP/06a95f73d05bfcc82110cc68bcd20d051cd1d57dac200d36449bddeae10773f2",
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'widgets/mission_nc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Networked Capital',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Inter',
      ),
      home: const MissionNCScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MissionNCScreen extends StatelessWidget {
  const MissionNCScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: MissionNC(
          projectTitle: "Networked Capital",
          projectImage: "https://cdn.builder.io/api/v1/image/assets/TEMP/06a95f73d05bfcc82110cc68bcd20d051cd1d57dac200d36449bddeae10773f2",
        ),
      ),
    );
  }
}
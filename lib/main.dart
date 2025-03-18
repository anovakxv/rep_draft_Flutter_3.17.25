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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User Profile App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF7BBF4B),
        fontFamily: 'Inter',
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFFF9F9F9),
          elevation: 0,
          iconTheme: IconThemeData(
            color: Color(0xFF8CC75D),
          ),
        ),
      ),
      home: UserProfileScreen(),
      routes: {
        '/profile': (context) => UserProfileScreen(),
        '/economic-advancement': (context) => Scaffold(
              appBar: AppBar(title: Text('Economic Advancement')),
              body: Center(child: Text('Economic Advancement Details')),
            ),
        '/boys-and-girls-club': (context) => Scaffold(
              appBar: AppBar(title: Text('Boys & Girls Club')),
              body: Center(child: Text('Boys & Girls Club Details')),
            ),
        '/education': (context) => Scaffold(
              appBar: AppBar(title: Text('Education')),
              body: Center(child: Text('Education Details')),
            ),
        '/egt-solar': (context) => Scaffold(
              appBar: AppBar(title: Text('EGT Solar')),
              body: Center(child: Text('EGT Solar Details')),
            ),
        '/networked-capital': (context) => Scaffold(
              appBar: AppBar(title: Text('Networked Capital')),
              body: Center(child: Text('Networked Capital Details')),
            ),
        '/actions': (context) => Scaffold(
              appBar: AppBar(title: Text('Actions')),
              body: Center(child: Text('Actions Page')),
            ),
        '/messaging': (context) => Scaffold(
              appBar: AppBar(title: Text('Messaging')),
              body: Center(child: Text('Messaging Page')),
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
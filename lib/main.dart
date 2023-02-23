import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'theme_model.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  static const String _title = 'Flutter Code Sample';

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: MyApp._title,
            home: MyStatefulWidget(),
          );
        }
  }

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    Widget child = Container();

    switch(_index) {
      case 0:
        child = Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/oamk.png"),
              fit: BoxFit.scaleDown,
            ),
          ),
        );
        break;
      case 1:
        child = SecondRoute();
        break;
    }
      return Scaffold(
          appBar: AppBar(
            title: const Text('Mobile App'),
          ),
          bottomNavigationBar: _bottomTab(),
          body: SizedBox.expand(child: child),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                const DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    image: DecorationImage(
                      image: AssetImage("images/oamk.png"),
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                  child: Text(''),
                ),
                ListTile(
                  leading: Icon(Icons.info),
                  title: const Text('About'),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => const AlertDialog(
                        title: Text('About'),
                        content: Text(
                          'This is a bad mobile app made for a student project in 2023',
                        ),
                      ),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: const Text('Settings'),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => const AlertDialog(
                        title: Text('Settings'),
                        content: Text(
                          'No settings available xd',
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      }
Widget _bottomTab() {
  return BottomNavigationBar(
    currentIndex: _index,
    onTap: (int index) => setState(() => _index = index),
    items: [
      BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
                BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'OAMK',
          ),
    ],
  );
}
}



//####################//



class SecondRoute extends StatelessWidget {
  const SecondRoute({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MySecondPage(),
    );
  }
}

class MySecondPage extends StatelessWidget {
  static String myVideoId = 'iKrJxxX6ucA';
  // the full url: https://www.youtube.com/watch?v=iKrJxxX6ucA

  // Initiate the Youtube player controller
  final YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: myVideoId,
    flags: const YoutubePlayerFlags(
      autoPlay: false,
      mute: false,
    ),
  );

  MySecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(    
          title: const Text('OAMK - Kampuskierros'),
        ),
        body: YoutubePlayer(
          controller: _controller,
          liveUIColor: Colors.amber,
        ));
  }
}

/*
class themeToggle extends StatefulWidget {
  const themeToggle({super.key});

  @override
  State<themeToggle> createState() => _themeToggleState();
}

class _themeToggleState extends State<themeToggle> {

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ThemeModel themeNotifier, child) {
      return Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: () {
                    themeNotifier.isDark
                        ? themeNotifier.isDark = false
                        : themeNotifier.isDark = true;
                  },
                  icon: Icon(themeNotifier.isDark
                      ? Icons.nightlight_round
                      : Icons.wb_sunny))
            ],
          ),
       ); // This trailing comma makes auto-formatting nicer for build methods.
    });
  }
}*/

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:ui_samples_practice/l10n/l10n.dart';
import 'package:ui_samples_practice/sound_play/sound_play.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: SoundplayTheme.themeData(Brightness.dark),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const SoundplayApp(),
    );
  }
}

final audioPlayerProvider = Provider.autoDispose(
  (ref) {
    final audioPlayer = AudioPlayer();
    audioPlayer
        .setAudioSource(
      ConcatenatingAudioSource(
        children: [
          AudioSource.uri(
            Uri.parse(
              'https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview122/v4/72/a3/ab/72a3ab79-0066-f773-6618-7a53adc250b3/mzaf_17921540907592750976.plus.aac.p.m4a',
            ),
          ),
          AudioSource.uri(
            Uri.parse(
              'https://archive.org/download/IGM-V7/IGM%20-%20Vol.%207/25%20Diablo%20-%20Tristram%20%28Blizzard%29.mp3',
            ),
          ),
        ],
      ),
    )
        .catchError((dynamic error) {
      debugPrint('An error occured $error');
      return null;
    });

    return audioPlayer;
  },
);

class SoundplayApp extends StatefulWidget {
  const SoundplayApp({super.key});

  @override
  State<SoundplayApp> createState() => _SoundplayAppState();
}

class _SoundplayAppState extends State<SoundplayApp> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        elevation: 0,
        shadowColor: Colors.black,
        backgroundColor: Colors.black,
        surfaceTintColor: Colors.black,
        selectedIndex: index,
        onDestinationSelected: (value) => setState(() {
          index = value;
        }),
        destinations: const [
          NavigationDestination(
            selectedIcon: FaIcon(FontAwesomeIcons.house),
            icon: FaIcon(FontAwesomeIcons.house),
            label: '',
          ),
          NavigationDestination(
            icon: FaIcon(FontAwesomeIcons.magnifyingGlass),
            label: '',
          ),
          NavigationDestination(
            icon: FaIcon(FontAwesomeIcons.heart),
            selectedIcon: FaIcon(FontAwesomeIcons.solidHeart),
            label: '',
          ),
          NavigationDestination(
            icon: FaIcon(FontAwesomeIcons.user),
            selectedIcon: FaIcon(FontAwesomeIcons.solidUser),
            label: '',
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: IndexedStack(
              index: index,
              children: const [
                SoundplayHomePage(),
                SoundplayNowPlayingPage(),
                Placeholder(),
                SoundplayProfilePage(),
              ],
            ),
          ),
          const NowPlayingWidget(),
        ],
      ),
    );
  }
}

class SoundplayProfilePage extends StatelessWidget {
  const SoundplayProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class SoundplayTheme {
  static ThemeData themeData(Brightness brightness) {
    final baseTheme = ThemeData(brightness: brightness);

    return baseTheme.copyWith(
      navigationBarTheme: const NavigationBarThemeData(
        shadowColor: Colors.black,
        backgroundColor: Colors.black,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        surfaceTintColor: Colors.black,
      ),
      scaffoldBackgroundColor: Colors.black,
      appBarTheme: const AppBarTheme(color: Colors.black),
      textTheme: GoogleFonts.ralewayTextTheme(baseTheme.textTheme),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue.shade800,
        ),
      ),
      sliderTheme: SliderThemeData(
        overlayShape: SliderComponentShape.noOverlay,
      ),
      useMaterial3: true,
    );
  }
}

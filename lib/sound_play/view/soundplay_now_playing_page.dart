import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:just_audio/just_audio.dart';
import 'package:ui_samples_practice/counter/counter.dart';

class SoundplayNowPlayingPage extends StatelessWidget {
  const SoundplayNowPlayingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterCubit(),
      child: const SoundplayNowPlayingView(music: treasure),
    );
  }
}

const treasure = Music(
  imgUrl:
      'https://static.wikia.nocookie.net/treasuremaker/images/6/64/THE_FIRST_STEP_-_TREASURE_EFFECT_digital_album_cover.jpg/revision/latest/scale-to-width-down/1000?cb=20210111130209',
  lyric: 'lyric[0]',
  artist: 'Treasure',
  name: 'HOLD IT IN (묻어둔다)',
);

class Music {
  const Music({
    required this.name,
    required this.imgUrl,
    required this.lyric,
    required this.artist,
  });

  final String name;
  final String imgUrl;
  final String lyric;
  final String artist;
}

class SoundplayNowPlayingView extends StatefulWidget {
  const SoundplayNowPlayingView({super.key, required this.music});

  final Music music;

  @override
  State<SoundplayNowPlayingView> createState() =>
      _SoundplayNowPlayingViewState();
}

class _SoundplayNowPlayingViewState extends State<SoundplayNowPlayingView> {
  bool liked = false;
  bool isPlaying = false;
  late AudioPlayer _audioPlayer;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();

    // Set a sequence of audio sources that will be played by the audio player.
    _audioPlayer
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
          AudioSource.uri(
            Uri.parse(
              'https://archive.org/download/igm-v8_202101/IGM%20-%20Vol.%208/15%20Pokemon%20Red%20-%20Cerulean%20City%20%28Game%20Freak%29.mp3',
            ),
          ),
          AudioSource.uri(
            Uri.parse(
              'https://scummbar.com/mi2/MI1-CD/01%20-%20Opening%20Themes%20-%20Introduction.mp3',
            ),
          ),
        ],
      ),
    )
        .catchError((dynamic error) {
      // catch load errors: 404, invalid url ...
      debugPrint('An error occured $error');
      return null;
    });
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const FaIcon(FontAwesomeIcons.bell),
            Text(
              widget.music.artist,
              style: const TextStyle(color: Colors.white),
            ),
            const FaIcon(FontAwesomeIcons.heart),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 8),
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(widget.music.imgUrl),
            ),
            const SizedBox(height: 16),
            Center(
              child: Column(
                children: [
                  Text(
                    widget.music.name,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(widget.music.artist),
                  const SizedBox(height: 10),
                ],
              ),
            ),
            Expanded(
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    children: const [
                      Text(
                        'Saebyeoge nuneul tteumyeon jeil meonjeo hwagin neoui dapjang',
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        'Bogo sipdageona geureon geon an barae dangjang',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text(
                        'Gamjeongeul sumgigo pyojeongeul garigo',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text(
                        'Yeonineseo chinguro jeogeungi pillyohae, wait for me, yeah',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text(
                        'Ajikkkaji neoneun naege yejeonmankeum boda naege',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: DecoratedBox(
                      decoration: const BoxDecoration(
                        boxShadow: [BoxShadow(blurRadius: 20)],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const FaIcon(FontAwesomeIcons.backwardStep),
                          const FaIcon(FontAwesomeIcons.rotateLeft),
                          IconButton(
                            onPressed: () {
                              setState(() => isPlaying = !isPlaying);
                            },
                            icon: FaIcon(
                              isPlaying
                                  ? FontAwesomeIcons.solidCirclePlay
                                  : FontAwesomeIcons.solidCirclePause,
                              size: 64,
                            ),
                          ),
                          const FaIcon(FontAwesomeIcons.rotateRight),
                          const FaIcon(FontAwesomeIcons.forwardStep),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Slider(value: 0.75, onChanged: (v) {}),
          ],
        ),
      ),
    );
  }
}

class CounterText extends StatelessWidget {
  const CounterText({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final count = context.select((CounterCubit cubit) => cubit.state);
    return Text('$count', style: theme.textTheme.headlineLarge);
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SoundplayHomePage extends StatelessWidget {
  const SoundplayHomePage({super.key});

  @override
  Widget build(BuildContext context) {
class FeaturedArtists extends StatelessWidget {
  const FeaturedArtists({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: Theme.of(context).textTheme.headlineSmall),
              const SizedBox(height: 8),
              SizedBox(
                height: width / 3 - 30,
                child: ListView.separated(
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (_, __) => const SizedBox(width: 16),
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        CircleAvatar(radius: width / 10),
                        const SizedBox(height: 8),
                        const Text('Justin Bieber'),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}

class AlbumsTile extends StatelessWidget {
  const AlbumsTile({super.key, required this.track});
  final Track track;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    final txtStyle = Theme.of(context).textTheme.labelLarge;

    return SizedBox(
      width: width / 3,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(track.imageUrl),
          ),
          const SizedBox(height: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                track.name,
                overflow: TextOverflow.ellipsis,
                style: txtStyle?.copyWith(fontWeight: FontWeight.w600),
              ),
              Text(track.artistName, style: txtStyle),
            ],
          )
        ],
      ),
    );
  }
}
    );
  }
}

class NowPlayingWidget extends StatelessWidget {
  const NowPlayingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      decoration: BoxDecoration(
        boxShadow: const [BoxShadow(blurRadius: 20)],
        borderRadius: BorderRadius.circular(8),
        color: const Color.fromRGBO(6, 7, 37, 1),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  'https://static.wikia.nocookie.net/treasuremaker/images/6/64/THE_FIRST_STEP_-_TREASURE_EFFECT_digital_album_cover.jpg/revision/latest/scale-to-width-down/1000?cb=20210111130209',
                  height: 50,
                  width: 50,
                ),
              ),
              const SizedBox(width: 8),
              Column(
                children: const [
                  Text('Hold It In'),
                  Text('Treasure'),
                ],
              ),
              const Spacer(),
              const FaIcon(FontAwesomeIcons.play),
              const SizedBox(width: 8),
            ],
          ),
          const SizedBox(height: 4),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: const LinearProgressIndicator(
              value: 0.7,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

const categories = ['Music', 'Podcast', 'Event', 'Artist'];
const featureds = [
  {'name': '2 Babbies', 'artists': 'NCT, NCT 127'},
  {'name': 'Hold It In', 'artists': 'Treasure'},
  {'name': "Don't Let Me Down", 'artists': 'The Beatles'},
  {'name': 'Hay Trao Cho Anh', 'artists': 'Son Tung M-TP'},
];

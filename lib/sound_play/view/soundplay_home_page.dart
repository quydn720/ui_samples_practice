import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SoundplayHomePage extends StatelessWidget {
  const SoundplayHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: const [
                  _GreetingWidget(),
                  SizedBox(height: 16),
                  _Categories(),
                  SizedBox(height: 16),
                  FeaturedAlbumsList(title: 'Recent Playing'),
                  FeaturedArtists(title: 'Artists'),
                  FeaturedAlbumsList(title: 'Popular Today'),
                  FeaturedAlbumsList(title: 'Recommended for you'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FeaturedAlbumsList extends StatelessWidget {
  const FeaturedAlbumsList({super.key, required this.title});

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
              Text(
                title,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: width / 3 + 45,
                child: ListView.separated(
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 8),
                  itemBuilder: (context, index) {
                    return AlbumsTile(
                      track: Track(
                        artistName: 'NCT, NCT 127',
                        name: 'Hold It In',
                        imageUrl:
                            'https://static.wikia.nocookie.net/treasuremaker/images/6/64/THE_FIRST_STEP_-_TREASURE_EFFECT_digital_album_cover.jpg/revision/latest/scale-to-width-down/1000?cb=20210111130209',
                      ),
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

class Track {
  Track({
    required this.artistName,
    required this.name,
    required this.imageUrl,
  });

  final String artistName;

  final String name;

  final String imageUrl;
}

class _Categories extends StatelessWidget {
  const _Categories();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Center(
        child: ListView.builder(
          itemCount: categories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) => Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Chip(
              elevation: 0,
              side: BorderSide.none,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              label: Padding(
                padding: const EdgeInsets.all(4),
                child: Text(categories[index]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _GreetingWidget extends StatelessWidget {
  const _GreetingWidget();

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.headlineSmall?.copyWith(
          fontWeight: FontWeight.w600,
        );
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Good morning', style: style),
            Text('Have a nice day!', style: style),
          ],
        ),
        const Spacer(),
        const FaIcon(FontAwesomeIcons.bell),
      ],
    );
  }
}

class NowPlayingWidget extends ConsumerWidget {
  const NowPlayingWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
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
              minHeight: 2,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

const categories = ['Music', 'Podcast', 'Event', 'Artist', 'Artist', 'Artist'];
final featureds = [
  {
    'name': 'CHARLIE',
    'artist': 'Charlie Puth',
    'image': 'assets/images/album_charlie.jpeg',
  },
  {
    'name': 'Favorite',
    'artist': 'NCT 127',
    'image': 'assets/images/album_favorite.jpeg',
  },
  {
    'name': 'Indigo',
    'artist': 'RM',
    'image': 'assets/images/album_indigo.png',
  },
  {
    'name': 'Tomorrow',
    'artist': 'Chanyeol',
    'image': 'assets/images/album_tomorrow.jpeg',
  },
  {
    'name': 'Wonder',
    'artist': 'Shawn Mendes',
    'image': 'assets/images/album_wonder.png',
  },
];

const artists = [
  {'name': 'Justin Bieber', 'image': 'assets/images/artist_justin_bieber.jpeg'},
  {'name': 'Bigbang', 'image': 'assets/images/artist_bigbang.jpeg'},
  {'name': 'NewJeans', 'image': 'assets/images/artist_newjeans.jpeg'},
  {'name': 'Taylor Swift', 'image': 'assets/images/artist_taylor_swift.jpeg'},
  {'name': 'Da LAB', 'image': 'assets/images/artist_dalab.jpeg'},
];

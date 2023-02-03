import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SoundplayHomePage extends StatelessWidget {
  const SoundplayHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Good morning', style: textTheme.titleLarge),
                            Text(
                              'Have a nice day!',
                              style: textTheme.titleLarge,
                            ),
                          ],
                        ),
                        const Spacer(),
                        const FaIcon(FontAwesomeIcons.bell),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: List.generate(
                        4,
                        (index) => Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: Chip(
                            elevation: 0,
                            side: BorderSide.none,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            label: Text(categories[index]),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      height: 100,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (_, __) => const SizedBox(width: 8),
                        itemCount: featureds.length,
                        shrinkWrap: true,
                        itemBuilder: (ctx, index) {
                          return SizedBox(
                            height: 100,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  children: [
                                    SizedBox(
                                      height: 120,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(16),
                                        child: Image.network(
                                          'https://static.wikia.nocookie.net/treasuremaker/images/6/64/THE_FIRST_STEP_-_TREASURE_EFFECT_digital_album_cover.jpg/revision/latest/scale-to-width-down/1000?cb=20210111130209',
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 8,
                                      left: 8,
                                      child: DecoratedBox(
                                        decoration: BoxDecoration(
                                          color: Colors.black.withOpacity(0.4),
                                          shape: BoxShape.circle,
                                        ),
                                        child: const Padding(
                                          padding: EdgeInsets.all(10),
                                          child: FaIcon(
                                            FontAwesomeIcons.play,
                                            size: 14,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                Text(featureds[index]['name']!),
                                Text(featureds[index]['artists']!),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    const Text('Artist'),
                    const SizedBox(height: 8),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 80,
                            child: Column(
                              children: [
                                Container(
                                  height: 50,
                                  width: 50,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.green,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  featureds[0]['artists']!,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 80,
                            child: Column(
                              children: [
                                Container(
                                  height: 50,
                                  width: 50,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.green,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  featureds[0]['artists']!,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 80,
                            child: Column(
                              children: [
                                Container(
                                  height: 50,
                                  width: 50,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.green,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  featureds[0]['artists']!,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 80,
                            child: Column(
                              children: [
                                Container(
                                  height: 50,
                                  width: 50,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.green,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  featureds[0]['artists']!,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 80,
                            child: Column(
                              children: [
                                Container(
                                  height: 50,
                                  width: 50,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.green,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  featureds[0]['artists']!,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 80,
                            child: Column(
                              children: [
                                Container(
                                  height: 50,
                                  width: 50,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.green,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  featureds[0]['artists']!,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 80,
                            child: Column(
                              children: [
                                Container(
                                  height: 50,
                                  width: 50,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.green,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  featureds[0]['artists']!,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ],
                        // scrollDirection: Axis.horizontal,
                        // separatorBuilder: (_, __) => const SizedBox(width: 8),
                        // itemCount: featureds.length,
                        // shrinkWrap: true,
                        // itemBuilder: (ctx, index) {
                        // return SizedBox(
                        //   width: 80,
                        //   child: Column(
                        //     // crossAxisAlignment: CrossAxisAlignment.center,

                        //     children: [
                        //       Container(
                        //         height: 50,
                        //         width: 50,
                        //         decoration: const BoxDecoration(
                        //           shape: BoxShape.circle,
                        //           color: Colors.green,
                        //         ),
                        //       ),
                        //       const SizedBox(height: 4),
                        //       Text(
                        //         featureds[index]['artists']!,
                        //         overflow: TextOverflow.ellipsis,
                        //       ),
                        //     ],
                        //   ),
                        // );
                        // },
                      ),
                    ),
                    const Text('Artist'),
                    const SizedBox(height: 8),
                    SizedBox(
                      height: 240,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (_, __) => const SizedBox(width: 8),
                        itemCount: featureds.length,
                        shrinkWrap: true,
                        itemBuilder: (ctx, index) {
                          return SizedBox(
                            width: 80,
                            child: Column(
                              children: [
                                Container(
                                  height: 50,
                                  width: 50,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.green,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  featureds[index]['artists']!,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const Align(
                alignment: Alignment.bottomCenter,
                child: NowPlayingWidget(),
              ),
            ],
          ),
        ),
      ),
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

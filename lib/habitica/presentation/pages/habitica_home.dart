import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ui_samples_practice/habitica/data/models/priority.dart';
import 'package:ui_samples_practice/habitica/mocks.dart';
import 'package:ui_samples_practice/habitica/presentation/widgets/task_card.dart';

class HabiticaHome extends StatelessWidget {
  const HabiticaHome({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const _ProfileTile(),
                const SizedBox(height: 8),
                const RecentTasks(),
                const SizedBox(height: 16),
                Text('Ongoing Tasks', style: textTheme.titleLarge),
                const SizedBox(height: 16),
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    itemCount: 4,
                    itemBuilder: (_, __) {
                      return Card(
                        elevation: 5,
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          width: double.infinity,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    width: 8,
                                    height: 75,
                                  ),
                                  const SizedBox(width: 8),
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Learn Spanish',
                                        style: textTheme.titleLarge,
                                      ),
                                      const SizedBox(height: 4),
                                      const Text('Kiam Robert'),
                                    ],
                                  ),
                                  const Spacer(),
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(FontAwesomeIcons.ellipsis),
                                  )
                                ],
                              ),
                              const SizedBox(height: 8),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                // textBaseline: TextBaseline.ideographic,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.baseline,
                                    textBaseline: TextBaseline.alphabetic,
                                    children: [
                                      const Text('Teammates'),
                                      const SizedBox(height: 8),
                                      Row(
                                        children: const [
                                          CircleAvatar(),
                                          CircleAvatar(),
                                          CircleAvatar(),
                                        ],
                                      )
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text('Scheduled date'),
                                      const SizedBox(height: 8),
                                      Row(
                                        children: const [
                                          Icon(FontAwesomeIcons.calendar),
                                          Text('Thursday 9, 2023'),
                                        ],
                                      )
                                    ],
                                  ),
                                  const CircularProgressIndicator(
                                    value: 0.6,
                                    backgroundColor: Colors.red,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.house),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.message),
            label: 'Message',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.bookmark),
            label: 'Saved',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.user),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class RecentTasks extends StatefulWidget {
  const RecentTasks({super.key});

  @override
  State<RecentTasks> createState() => _RecentTasksState();
}

class _RecentTasksState extends State<RecentTasks> {
  final scrollController = ScrollController();
  double currentIndex = 0;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      var d = scrollController.offset / 344.0;
      if (d < 0) d = 0;
      setState(() => currentIndex = d);
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Recent Tasks', style: textTheme.titleLarge),
        const SizedBox(height: 12),
        SingleChildScrollView(
          controller: scrollController,
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              TaskCard(
                cardColor: Colors.pink.shade100,
                title: 'Creating SaaS Product Landing Page',
                priority: Priority.high,
                progressValue: 0.20,
                conversations: '121',
                attachments: '22',
                time: '25 weeks',
              ),
              TaskCard(
                cardColor: Colors.purple.shade100,
                title: 'Creating SaaS Product Landing Page',
                priority: Priority.medium,
                progressValue: 0.75,
                conversations: '1',
                attachments: '2',
                time: '5 weeks',
              ),
              TaskCard(
                cardColor: Colors.blue.shade100,
                title: 'Creating SaaS Product Landing Page',
                priority: Priority.medium,
                progressValue: 0.75,
                conversations: '1',
                attachments: '2',
                time: '5 weeks',
              ),
              TaskCard(
                cardColor: Colors.yellow.shade100,
                title: 'Creating SaaS Product Landing Page',
                priority: Priority.high,
                progressValue: 0.75,
                conversations: '1',
                attachments: '2',
                time: '5 weeks',
              ),
            ],
          ),
        ),
        Center(
          child: DotsIndicator(
            dotsCount: 4,
            position: currentIndex,
            decorator: DotsDecorator(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              activeSize: const Size(20, 10),
              activeColor: const Color.fromRGBO(34, 37, 96, 1),
              size: const Size(10, 10),
              activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              spacing: const EdgeInsets.only(right: 4),
            ),
          ),
        ),
      ],
    );
  }
}

class _ProfileTile extends StatelessWidget {
  const _ProfileTile();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return ListTile(
      contentPadding: EdgeInsets.zero,
      minVerticalPadding: 0,
      leading: CircleAvatar(
        radius: 30,
        backgroundImage: AssetImage(mockAvatars[0]),
      ),
      title: Text('Murad Zaman', style: textTheme.titleLarge),
      subtitle: const Text("You've 5 tasks today"),
      trailing: const Icon(FontAwesomeIcons.bell),
    );
  }
}

class TaskTile extends StatelessWidget {
  const TaskTile({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Chip(label: Text('High')),
                const Spacer(),
                IconButton(
                  padding: EdgeInsets.zero,
                  icon: const Icon(FontAwesomeIcons.bookmark),
                  onPressed: () {},
                ),
                IconButton(
                  padding: EdgeInsets.zero,
                  icon: const Icon(FontAwesomeIcons.ellipsisVertical),
                  onPressed: () {},
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  width: 20,
                  color: Colors.amber,
                  height: double.infinity,
                ),
                Expanded(
                  child: Text(
                    'Creating SaaS Product Landing Page',
                    style: textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            Container(width: 100),
            const SizedBox(height: 8),
            const Text('Progress'),
            Row(
              children: const [
                Expanded(child: LinearProgressIndicator(value: 0.5)),
                SizedBox(width: 8),
                Text('75%'),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: const [
                CircleAvatar(),
                Spacer(),
                Icon(FontAwesomeIcons.message),
                Text('7'),
                Icon(FontAwesomeIcons.paperclip),
                Text('4'),
                Icon(FontAwesomeIcons.clock),
                Text('6 days'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

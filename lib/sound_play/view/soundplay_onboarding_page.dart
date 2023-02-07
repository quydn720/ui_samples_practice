// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';

class SoundplayOnboardingPage extends StatelessWidget {
  const SoundplayOnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        top: false,
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  alignment: Alignment(0.55, 0.1),
                  fit: BoxFit.none,
                  scale: 1.2,
                  image: NetworkImage(
                    'https://i.pinimg.com/originals/1f/cb/e6/1fcbe69411d2b113db9741fb3589c039.jpg',
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                height: 220,
                decoration: BoxDecoration(
                  boxShadow: const [BoxShadow(blurRadius: 50)],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Create Your Own Playlist',
                      textAlign: TextAlign.center,
                      style: textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'Share It With Others',
                      textAlign: TextAlign.center,
                      style: textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Choose music according to your taste, create your own playlist to accompany your day!',
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: textTheme.labelLarge?.copyWith(
                        color: Colors.grey.shade400,
                      ),
                    ),
                    const Spacer(),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Text('Get Started', style: textTheme.labelLarge),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

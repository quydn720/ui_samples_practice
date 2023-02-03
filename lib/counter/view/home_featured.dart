import 'package:flutter/material.dart';
import 'package:ui_samples_practice/gen/assets.gen.dart';

class Featured extends StatelessWidget {
  const Featured({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Featured',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              TextButton(
                child: const Text('See all'),
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 300,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (context, index) => const EstateCarousel(),
            ),
          )
        ],
      ),
    );
  }
}

class EstateCarousel extends StatelessWidget {
  const EstateCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Assets.images.realEstate1.path),
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 200,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Semi Modern House',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    const Text('4.7 ⭐️'),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  'Baratajaya, Surabaya City, Jawa Timur',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: 12),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Icon(Icons.bed, size: 16),
                    const Text('2'),
                    const SizedBox(width: 12),
                    const Icon(Icons.bathtub_outlined, size: 16),
                    const Text('1'),
                    const SizedBox(width: 12),
                    const Icon(Icons.other_houses_outlined, size: 16),
                    const Text('Penthouse'),
                    const SizedBox(width: 12),
                    Text(
                      r'$500/',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Text(
                      'day',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(color: Colors.grey),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

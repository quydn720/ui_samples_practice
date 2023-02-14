import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ui_samples_practice/extensions.dart';
import 'package:ui_samples_practice/habitica/data/models/priority.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key,
    required this.cardColor,
    required this.title,
    required this.priority,
    required this.progressValue,
    required this.conversations,
    required this.attachments,
    required this.time,
  });

  final Color cardColor;
  final String title;
  final Priority priority;
  final double progressValue;
  final String conversations;
  final String attachments;
  // Should not be > 10 weeks
  final String time;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    final titleStyle = textTheme.titleLarge?.copyWith(
      fontWeight: FontWeight.bold,
    );
    final labelStyle = textTheme.bodySmall?.copyWith(
      fontSize: 13,
      color: Colors.grey.shade600,
    );

    final textStyle = textTheme.bodyMedium?.copyWith(
      fontWeight: FontWeight.w600,
    );

    return Container(
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(16),
      ),
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      width: size.width * 0.8,
      child: Card(
        color: cardColor,
        elevation: 0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Chip(
                  label: Text(priority.name.capitalize()),
                  backgroundColor: cardColor.withOpacity(0.6),
                ),
                const Spacer(),
                const FaIcon(FontAwesomeIcons.bookmark),
                const SizedBox(width: 12),
                const FaIcon(FontAwesomeIcons.ellipsisVertical),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(child: Text(title, style: titleStyle)),
                SizedBox(width: size.width * 0.1), // 1/4 of the card
              ],
            ),
            const SizedBox(height: 8),
            Text('Progress', style: labelStyle),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: LinearProgressIndicator(
                      value: progressValue,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Text('${(progressValue * 100).toInt()}%', style: textStyle),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  // width: (size.width - 24) * 0.3,
                  child: Stack(
                    children: const [
                      CircleAvatar(radius: 18),
                      Positioned(
                        left: 25,
                        child: CircleAvatar(
                          radius: 18,
                          backgroundColor: Colors.green,
                        ),
                      ),
                      Positioned(
                        left: 50,
                        child: CircleAvatar(
                          radius: 18,
                          backgroundColor: Colors.yellow,
                        ),
                      ),
                      Positioned(
                        left: 75,
                        child: CircleAvatar(
                          radius: 18,
                          backgroundColor: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const FaIcon(FontAwesomeIcons.message, size: 16),
                    const SizedBox(width: 4),
                    Text(conversations, style: textStyle),
                    const SizedBox(width: 12),
                    const FaIcon(FontAwesomeIcons.compassDrafting, size: 16),
                    const SizedBox(width: 4),
                    Text(attachments, style: textStyle),
                    const SizedBox(width: 12),
                    const FaIcon(FontAwesomeIcons.clock, size: 16),
                    const SizedBox(width: 4),
                    Text(time, style: textStyle),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

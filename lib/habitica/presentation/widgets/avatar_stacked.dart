import 'package:flutter/material.dart';

class AvatarStacked extends StatelessWidget {
  const AvatarStacked({
    super.key,
    required this.avatars,
    this.avatarRadius,
  });

  static const maxLength = 4;
  static const cutPortion = 0.75;

  final List<String> avatars;
  final double? avatarRadius;

  @override
  Widget build(BuildContext context) {
    final diameter = (avatarRadius ?? 20) * 2;
    final left = cutPortion * diameter;

    return SizedBox(
      height: 36,
      child: Stack(
        children: [
          ...List.generate(
            4,
            (index) {
              if (index == 3) {
                return Positioned(
                  left: left * index,
                  child: CircleAvatar(
                    radius: avatarRadius,
                    backgroundColor: Colors.black,
                    child: Text(
                      '+${avatars.length - 3}',
                      style: const TextStyle(color: Colors.white, fontSize: 13),
                    ),
                  ),
                );
              }
              return Positioned(
                left: left * index,
                child: CircleAvatar(
                  backgroundImage: AssetImage(avatars[index]),
                  radius: avatarRadius,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

// import 'dart:math';

import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class HerMessageBubble extends StatelessWidget {
  final Message message;

  const HerMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
              color: colors.secondary, borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              this.message.text,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(height: 5),
        _ImageBubble(
          imageUrl: this.message.imageUrl!,
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  final String imageUrl;

  const _ImageBubble({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    // final colors = Theme.of(context).colorScheme;
    // final rand = Random();
    // final int randomNumber =
    //     rand.nextInt(100); // Generates a random integer between 0 and 99

    final double imageWidth = deviceSize.width * 0.5;
    const double imageHeight = 150;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        this.imageUrl,

        width: imageWidth, // 50% del total del width del dispositivo
        height: imageHeight,
        fit: BoxFit.cover,

        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) {
            return Container(
                decoration: const BoxDecoration(
                    color: Color.fromARGB(31, 165, 165, 165)),
                child: child);
          }

          return Container(
            width: imageWidth,
            height: imageHeight,
            decoration: const BoxDecoration(
              color: Color.fromARGB(31, 165, 165, 165),
            ),
            alignment: Alignment.center,
            padding: const EdgeInsets.all(2.0),
            child: const CircularProgressIndicator(
              color: Colors.indigo,
              strokeWidth: 3,
            ),
          );
        },
      ),
    );
  }
}

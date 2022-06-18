import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AppBarArea extends StatelessWidget {
  const AppBarArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 32.0,
          vertical: 8.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CachedNetworkImage(
              imageUrl:
                  'https://iconape.com/wp-content/files/yn/145105/png/145105.png',
              fit: BoxFit.cover,
              color: Colors.blue,
            ),
            Text(
              'Pedometer',
              style: Theme.of(context).textTheme.headline6!.copyWith(
                    color: Colors.blue,
                  ),
            ),
            const Icon(
              Icons.sunny,
              color: Colors.amber,
              size: 25,
            ),
          ],
        ),
      ),
    );
  }
}

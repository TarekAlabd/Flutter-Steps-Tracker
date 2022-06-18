import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_steps_tracker/utilities/constants/assets.dart';

class AdArea extends StatelessWidget {
  const AdArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: double.infinity,
      height: size.height * 0.12,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(24.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'More coming soon!',
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                            color: Colors.white,
                          ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8.0),
              CachedNetworkImage(
                imageUrl: AppAssets.strongArm,
                fit: BoxFit.cover,
                height: 80,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

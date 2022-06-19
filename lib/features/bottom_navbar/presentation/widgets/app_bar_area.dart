import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_steps_tracker/utilities/constants/assets.dart';
import 'package:flutter_steps_tracker/utilities/locale/cubit/utility_cubit.dart';
import 'package:provider/provider.dart';

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
              imageUrl: AppAssets.logo,
              fit: BoxFit.cover,
              color: Theme.of(context).primaryColor,
            ),
            Text(
              'Pedometer',
              style: Theme.of(context).textTheme.headline6!.copyWith(
                    color: Theme.of(context).primaryColor,
                  ),
            ),
            IconButton(
              icon: const Icon(
                Icons.sunny,
                size: 25,
              ),
              onPressed: () async =>
                  await Provider.of<UtilityCubit>(context, listen: false)
                      .switchTheme(),
              color: Theme.of(context).primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}

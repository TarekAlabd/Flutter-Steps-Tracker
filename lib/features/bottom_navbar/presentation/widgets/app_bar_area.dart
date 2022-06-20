import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_steps_tracker/generated/l10n.dart';
import 'package:flutter_steps_tracker/utilities/constants/assets.dart';
import 'package:flutter_steps_tracker/utilities/constants/key_constants.dart';
import 'package:flutter_steps_tracker/utilities/locale/cubit/utility_cubit.dart';
import 'package:provider/provider.dart';

class AppBarArea extends StatelessWidget {
  const AppBarArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final utilityCubit = Provider.of<UtilityCubit>(context);
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
              S.of(context).pedometer,
              style: Theme.of(context).textTheme.headline6!.copyWith(
                    color: Theme.of(context).primaryColor,
                  ),
            ),
            Row(
              children: [
                InkWell(
                  onTap: () async =>
                      await Provider.of<UtilityCubit>(context, listen: false)
                          .switchTheme(),
                  child: Icon(
                    utilityCubit.isDark
                        ? Icons.sunny
                        : CupertinoIcons.moon_fill,
                    size: 25,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                const SizedBox(width: 6.0),
                InkWell(
                  onTap: () async => await utilityCubit.changeLocale(
                    utilityCubit.locale == KeyConstants.arabicLocale
                        ? KeyConstants.englishLocale
                        : KeyConstants.arabicLocale,
                  ),
                  child: Text(
                    utilityCubit.locale == KeyConstants.arabicLocale
                        ? 'EN'
                        : 'AR',
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(color: Theme.of(context).primaryColor),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

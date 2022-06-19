import 'package:flutter/material.dart';

class HealthPointsAndCaloriesItem extends StatelessWidget {
  final Color color;
  final String mainTitle;
  final IconData iconData;
  final String number;
  final String unit;

  const HealthPointsAndCaloriesItem({
    Key? key,
    this.color = Colors.blue,
    required this.mainTitle,
    required this.iconData,
    this.number = '-',
    this.unit = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  iconData,
                  size: 30,
                ),
                const SizedBox(width: 4.0),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: number.toString(),
                        style: Theme.of(context).textTheme.headline5!.copyWith(
                              color: Theme.of(context).scaffoldBackgroundColor,
                            ),
                      ),
                      if (unit.isNotEmpty)
                        TextSpan(
                          text: ' $unit',
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                              ),
                        ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 8.0),
            Text(
              mainTitle,
              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

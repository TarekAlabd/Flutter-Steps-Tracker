import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_steps_tracker/core/presentation/widgets/android_dialog.dart';
import 'package:flutter_steps_tracker/core/presentation/widgets/ios_dialog.dart';
import 'package:flutter_steps_tracker/features/bottom_navbar/presentation/manager/rewards/rewards_cubit.dart';
import 'package:flutter_steps_tracker/features/bottom_navbar/presentation/manager/rewards/rewards_state.dart';

/// TODO: We need to refactor this especially this cubit
Future showAlertDialog(
  BuildContext context, {
  required String title,
  String? content,
  Widget? contentWidget,
  String? cancelActionText,
  required String defaultActionText,
  VoidCallback? defaultAction,
  RewardsCubit? cubit,
}) {
  if (!Platform.isIOS) {
    return showDialog(
      context: context,
      builder: (context) => cubit == null
          ? AndroidDialog(
              title: title,
              defaultActionText: defaultActionText,
              content: content,
              contentWidget: contentWidget,
              cancelActionText: cancelActionText,
              defaultAction: defaultAction,
            )
          : BlocConsumer<RewardsCubit, RewardsState>(
              bloc: cubit,
              listener: (context, state) {
                state.maybeWhen(
                  earnLoaded: () {
                    Navigator.of(context).pop();
                  },
                  orElse: () {},
                );
              },
              builder: (context, state) {
                return state.maybeWhen(
                  earnLoading: () => AndroidDialog(
                    title: title,
                    defaultActionText: defaultActionText,
                    content: content,
                    contentWidget: contentWidget,
                    cancelActionText: cancelActionText,
                    defaultAction: defaultAction,
                    isLoading: true,
                  ),
                  orElse: () => AndroidDialog(
                    title: title,
                    defaultActionText: defaultActionText,
                    content: content,
                    contentWidget: contentWidget,
                    cancelActionText: cancelActionText,
                    defaultAction: defaultAction,
                  ),
                );
              },
            ),
    );
  }
  return showCupertinoDialog(
    context: context,
    builder: (context) => cubit == null
        ? IosDialog(
            title: title,
            defaultActionText: defaultActionText,
            content: content,
            contentWidget: contentWidget,
            cancelActionText: cancelActionText,
            defaultAction: defaultAction,
          )
        : BlocConsumer<RewardsCubit, RewardsState>(
            bloc: cubit,
            listener: (context, state) {
              state.maybeWhen(
                earnLoaded: () {
                  Navigator.of(context).pop();
                },
                orElse: () {},
              );
            },
            builder: (context, state) {
              return state.maybeWhen(
                earnLoading: () => IosDialog(
                  title: title,
                  defaultActionText: defaultActionText,
                  content: content,
                  contentWidget: contentWidget,
                  cancelActionText: cancelActionText,
                  defaultAction: defaultAction,
                  isLoading: true,
                ),
                orElse: () => IosDialog(
                  title: title,
                  defaultActionText: defaultActionText,
                  content: content,
                  contentWidget: contentWidget,
                  cancelActionText: cancelActionText,
                  defaultAction: defaultAction,
                ),
              );
            },
          ),
  );
}

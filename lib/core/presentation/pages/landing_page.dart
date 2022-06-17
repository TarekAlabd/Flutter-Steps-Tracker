import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_steps_tracker/features/bottom_navbar/presentation/pages/bottom_navbar.dart';
import 'package:flutter_steps_tracker/features/intro/presentation/manager/auth_status/auth_status_cubit.dart';
import 'package:flutter_steps_tracker/features/intro/presentation/manager/auth_status/auth_status_state.dart';
import 'package:flutter_steps_tracker/features/intro/presentation/pages/intro_page.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthStatusCubit, AuthStatusState>(
      bloc: BlocProvider.of<AuthStatusCubit>(context),
      listener: (context, state) {
        if (state is Authenticated) {
          const BottomNavbar();
        } else {
          const IntroPage();
        }
      },
      buildWhen: (previousState, currentState) => previousState != currentState,
      builder: (context, state) {
        return state.maybeWhen(
          authenticated: () => const BottomNavbar(),
          unAuthenticated: () => const IntroPage(),
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }
}

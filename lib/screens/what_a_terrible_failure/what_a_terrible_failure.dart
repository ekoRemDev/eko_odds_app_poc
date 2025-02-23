import 'package:eko_assignment/screens/games_screen/games_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WhatATerribleFailure extends StatelessWidget {
  const WhatATerribleFailure({
    super.key,
  });

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: GestureDetector(
            onTap: () {
              context.goNamed(GamesScreen.routeName);
            },
            child: Text(
              'What a terrible failure! Tap to go back to the home screen.',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ),
      );
}

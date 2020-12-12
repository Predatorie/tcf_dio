import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tcf_dio/src/branding.dart';
import 'package:tcf_dio/src/cubits/app_cubit.dart';
import 'package:tcf_dio/src/views/athletes_page.dart';
import 'package:tcf_dio/src/views/workout_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TOLLAND CROSSFIT'),
        centerTitle: true,
      ),
      body: BlocListener<AppCubit, AppState>(
        listener: (context, state) {
          if (state is AthletesLoading) {
            _showScaffold(context, 'Loading...');
          }

          if (state is AthletesError) {
            _showScaffold(context, state.errorMessage);
          }

          if (state is AthletesLoaded) {
            Scaffold.of(context)
                .removeCurrentSnackBar(reason: SnackBarClosedReason.dismiss);

            Navigator.of(context).pushNamed(
              AthletesPage.routeName,
              arguments: state.athletes,
            );
          }

          if (state is WorkoutsLoading) {
            _showScaffold(context, 'Loading workouts...');
          }

          if (state is WorkoutsError) {
            _showScaffold(context, state.errorMessage);
          }

          if (state is WorkoutsLoaded) {
            Scaffold.of(context)
                .removeCurrentSnackBar(reason: SnackBarClosedReason.dismiss);

            Navigator.of(context).pushNamed(
              WorkoutPage.routeName,
              arguments: state.workouts,
            );
          }
        },
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 80, right: 80),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  height: 20,
                ),
                FlatButton(
                  height: 50,
                  onPressed: () => context.read<AppCubit>().getAthletes(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        FontAwesomeIcons.userNinja,
                        color: tollandCrossFitWhite,
                      ),
                      SizedBox(
                        width: 14,
                      ),
                      Text(
                        'ATHLETES',
                        style: TextStyle(color: tollandCrossFitWhite),
                      ),
                    ],
                  ),
                  color: tollandCrossFitBlue,
                ),
                SizedBox(
                  height: 8,
                ),
                FlatButton(
                  height: 50,
                  onPressed: () => context.read<AppCubit>().getWorkouts(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        FontAwesomeIcons.dumbbell,
                        color: tollandCrossFitWhite,
                      ),
                      SizedBox(
                        width: 14,
                      ),
                      Text(
                        'WORKOUTS',
                        style: TextStyle(color: tollandCrossFitWhite),
                      ),
                    ],
                  ),
                  color: tollandCrossFitBlue,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

_showScaffold(BuildContext context, String message) {
  Scaffold.of(context)
      .removeCurrentSnackBar(reason: SnackBarClosedReason.dismiss);

  return Scaffold.of(context).showSnackBar(SnackBar(
    content: Text(message),
    duration: Duration(seconds: 4),
  ));
}

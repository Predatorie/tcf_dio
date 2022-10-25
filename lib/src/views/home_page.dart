import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tcf_dio/src/branding.dart';
import 'package:tcf_dio/src/cubits/app_cubit.dart';
import 'package:tcf_dio/src/views/athletes_page.dart';
import 'package:tcf_dio/src/views/benchmarks_page.dart';
import 'package:tcf_dio/src/views/workout_page.dart';

class HomePage extends StatelessWidget {
  static const String routeName = '/homepage';

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
            ScaffoldMessenger.of(context)
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
            ScaffoldMessenger.of(context)
                .removeCurrentSnackBar(reason: SnackBarClosedReason.dismiss);

            Navigator.of(context).pushNamed(
              WorkoutPage.routeName,
              arguments: state.workouts,
            );
          }

          if (state is BenchmarksLoading) {
            _showScaffold(context, 'Loading benchmarks...');
          }

          if (state is BenchmarksError) {
            _showScaffold(context, state.errorMessage);
          }

          if (state is BenchmarksLoaded) {
            ScaffoldMessenger.of(context)
                .removeCurrentSnackBar(reason: SnackBarClosedReason.dismiss);

            Navigator.of(context).pushNamed(
              BenchmarksPage.routeName,
              arguments: state.benchmarks,
            );
          }
        },
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 18, right: 18),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  height: 20,
                ),
                _flatButton(
                    context: context,
                    onPressed: () => context.read<AppCubit>().getAthletes(),
                    icon: FontAwesomeIcons.userNinja,
                    buttonText: 'ATHLETES'),
                SizedBox(
                  height: 8,
                ),
                _flatButton(
                    context: context,
                    onPressed: () => context.read<AppCubit>().getWorkouts(),
                    icon: FontAwesomeIcons.dumbbell,
                    buttonText: 'WORKOUTS'),
                SizedBox(
                  height: 8,
                ),
                _flatButton(
                    context: context,
                    onPressed: () => context
                        .read<AppCubit>()
                        .getBenchmarksByCategory('heroes'),
                    icon: FontAwesomeIcons.heart,
                    buttonText: 'BENCHMARK - HERO'),
                SizedBox(
                  height: 8,
                ),
                _flatButton(
                    context: context,
                    onPressed: () => context
                        .read<AppCubit>()
                        .getBenchmarksByCategory('girls'),
                    icon: FontAwesomeIcons.female,
                    buttonText: 'BENCHMARK - GIRLS'),
                SizedBox(
                  height: 8,
                ),
                _flatButton(
                    context: context,
                    onPressed: () => context
                        .read<AppCubit>()
                        .getBenchmarksByCategory('games'),
                    icon: FontAwesomeIcons.gamepad,
                    buttonText: 'BENCHMARK - GAMES'),
                SizedBox(
                  height: 8,
                ),
                _flatButton(
                    context: context,
                    onPressed: () => context
                        .read<AppCubit>()
                        .getBenchmarksByCategory('gymnastics'),
                    icon: Icons.card_membership,
                    buttonText: 'BENCHMARK - GYMNASTICS'),
                SizedBox(
                  height: 8,
                ),
                _flatButton(
                    context: context,
                    onPressed: () => context
                        .read<AppCubit>()
                        .getBenchmarksByCategory('notables'),
                    icon: FontAwesomeIcons.registered,
                    buttonText: 'BENCHMARK - NOTABLES'),
                SizedBox(
                  height: 8,
                ),
                _flatButton(
                    context: context,
                    onPressed: () => context
                        .read<AppCubit>()
                        .getBenchmarksByCategory('custom'),
                    icon: FontAwesomeIcons.penAlt,
                    buttonText: 'BENCHMARK - CUSTOM'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _flatButton({
  @required BuildContext context,
  @required String buttonText,
  @required Function onPressed,
  @required IconData icon,
}) {
  return TextButton(
    //style: TextStyle(height: 50,
//    minWidth: MediaQuery.of(context).size.width * .80,
    onPressed: onPressed,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        Icon(
          icon,
          color: tollandCrossFitWhite,
        ),
        SizedBox(
          width: 14,
        ),
        Text(
          buttonText,
          style: TextStyle(color: tollandCrossFitWhite),
        ),
      ],
    ),
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.resolveWith<Color>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.pressed))
            return Theme.of(context).colorScheme.primary.withOpacity(0.5);
          return null; // Use the component's default.
        },
      ),
    ),
  );
}

_showScaffold(BuildContext context, String message) {
  ScaffoldMessenger.of(context)
      .removeCurrentSnackBar(reason: SnackBarClosedReason.dismiss);

  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(message),
    duration: Duration(seconds: 4),
  ));
}

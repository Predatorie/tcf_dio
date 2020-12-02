import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tcf_dio/src/branding.dart';
import 'package:tcf_dio/src/cubits/athletes_cubit.dart';
import 'package:tcf_dio/src/views/athletes_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TOLLAND CROSSFIT'),
        centerTitle: true,
      ),
      body: BlocListener<AthletesCubit, AthletesState>(
        listener: (context, state) {
          if (state is AthletesLoading) {
            _showScafold(context, 'Loading...');
          }

          if (state is AthletesError) {
            _showScafold(context, state.errorMessage);
          }

          if (state is AthletesLoaded) {
            ScaffoldMessenger.of(context)
                .removeCurrentSnackBar(reason: SnackBarClosedReason.dismiss);

            Navigator.of(context).pushNamed(AthletesPage.routeName);
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
                  onPressed: () => context.read<AthletesCubit>().getAthletes(),
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
                  onPressed: () {},
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

_showScafold(BuildContext context, String message) {
  ScaffoldMessenger.of(context)
      .removeCurrentSnackBar(reason: SnackBarClosedReason.dismiss);

  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(message),
    duration: Duration(seconds: 4),
  ));
}

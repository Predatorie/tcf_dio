import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tcf_dio/src/branding.dart';
import 'package:tcf_dio/src/cubits/app_cubit.dart';
import 'package:tcf_dio/src/models/workouts.dart';
import 'package:tcf_dio/src/views/movements_page.dart';
import 'package:tcf_dio/src/widgets/workout_card.dart';

class WorkoutPage extends StatelessWidget {
  static const String routeName = '/workout';

  const WorkoutPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Workouts workouts = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('Workouts'),
      ),
      body: SafeArea(
        bottom: false,
        child: BlocListener<AppCubit, AppState>(
          listener: (context, state) {
            if (state is MovementsLoaded) {
              ScaffoldMessenger.of(context)
                  .removeCurrentSnackBar(reason: SnackBarClosedReason.dismiss);

              Navigator.of(context).pushNamed(MovementsPage.routeName);
            }

            if (state is MovementsLoading) {
              _showScaffold(context, 'Loading movements...');
            }

            if (state is MovementsError) {
              _showScaffold(context, state.errorMessage);
            }
          },
          child: Container(
            color: tollandCrossFitBlue,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Hero(
                    tag: '1',
                    child: ClipOval(
                      child: Container(
                          height: 50,
                          width: 50,
                          child: Image.asset(
                            'assets/images/tcf_logo_small.png',
                            fit: BoxFit.cover,
                          )),
                    ),
                  ),
                ),
                Expanded(child: _WorkoutsView(workouts: workouts)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _WorkoutsView extends StatelessWidget {
  final Workouts workouts;

  const _WorkoutsView({
    Key key,
    @required this.workouts,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: workouts.data.length,
      itemBuilder: (BuildContext context, int index) {
        return _WorkoutResultItem(workout: workouts.data[index]);
      },
    );
  }
}

class _WorkoutResultItem extends StatelessWidget {
  final Datum workout;

  const _WorkoutResultItem({Key key, this.workout}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(builder: (ctx, state) {
      return WorkoutCard(
        title: workout.attributes.title,
        description: workout.attributes.description,
        scoreType: workout.attributes.scoreType,
        track: workout.attributes.track,
        movements: workout.attributes.movementIds,
        onTap: workout.attributes.movementIds.length > 0
            ? () => ctx
                .read<AppCubit>()
                .getMovements(movementsId: workout.attributes.movementIds)
            : () => _showScaffold(context, 'No Movements available'),
      );
    });
  }
}

_showScaffold(BuildContext context, String message) {
  ScaffoldMessenger.of(context)
      .removeCurrentSnackBar(reason: SnackBarClosedReason.dismiss);

  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(message),
    duration: Duration(seconds: 4),
  ));
}

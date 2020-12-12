import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tcf_dio/src/cubits/app_cubit.dart';
import 'package:tcf_dio/src/models/movement.dart';
import 'package:tcf_dio/src/widgets/movements_card.dart';

class MovementsPage extends StatelessWidget {
  static const String routeName = '/movements';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movements'),
        centerTitle: true,
      ),
      body: Builder(builder: (context) {
        final state = context.watch<AppCubit>().state;

        if (state is MovementsLoaded) {
          return _MovementsView(
            movements: state.movements,
          );
        }

        if (state is MovementsLoading) {
          return CircularProgressIndicator();
        }

        return Container();
      }),
    );
  }
}

class _MovementsView extends StatelessWidget {
  final List<Movement> movements;

  const _MovementsView({
    Key key,
    @required this.movements,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: movements.length,
      itemBuilder: (BuildContext context, int index) {
        return _MovementResultItem(movement: movements[index]);
      },
    );
  }
}

class _MovementResultItem extends StatelessWidget {
  final Movement movement;

  const _MovementResultItem({
    Key key,
    @required this.movement,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MovementsCard(
      name: movement.data.attributes.name,
      videos: movement.data.attributes.videos,
    );
  }
}

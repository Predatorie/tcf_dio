import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tcf_dio/src/cubits/app_cubit.dart';
import 'package:tcf_dio/src/models/athletes.dart';
import 'package:tcf_dio/src/widgets/athlete_card.dart';

class AthletesPage extends StatefulWidget {
  static const String routeName = '/athletes';

  @override
  _AthletesPageState createState() => _AthletesPageState();
}

class _AthletesPageState extends State<AthletesPage> {
  @override
  Widget build(BuildContext context) {
    final Athletes athletes = ModalRoute.of(context).settings.arguments;

    return Scaffold(
        appBar: AppBar(
          title: Text('${athletes.data.length} Athletes'),
          centerTitle: true,
        ),
        body: _AthletesView(
          athletes: athletes,
        ));
  }
}

class _AthletesView extends StatelessWidget {
  final Athletes athletes;

  const _AthletesView({
    Key key,
    this.athletes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: athletes.data.length,
      itemBuilder: (BuildContext context, int index) {
        return _SearchResultItem(
          athlete: athletes.data[index],
        );
      },
    );
  }
}

class _SearchResultItem extends StatelessWidget {
  final Datum athlete;

  const _SearchResultItem({Key key, this.athlete}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(builder: (ctx, state) {
      return AthleteCard(
        email: athlete.attributes.email,
        firstName: athlete.attributes.firstName,
        lastName: athlete.attributes.lastName,
        profileImageUrl: athlete.attributes.profileImageUrl,
        onTap: () => ctx.read<AppCubit>().getWorkouts(),
        lastLogin: athlete.attributes.lastLogin.toIso8601String(),
      );
    });
  }
}

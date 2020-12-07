import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tcf_dio/src/cubits/app_cubit.dart';
import 'package:tcf_dio/src/models/athletes.dart';
import 'package:tcf_dio/src/widgets/athlete_card.dart';

class AthletesPage extends StatelessWidget {
  static const String routeName = '/athletes';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Athletes'),
          centerTitle: true,
        ),
        body: BlocBuilder<AppCubit, AppState>(
          builder: (context, state) {
            if (state is AthletesLoaded) {
              return _AthletesView(
                athletes: state.athletes,
              );
            }

            return Container(
              child: Center(
                child: Text('No results returned.'),
              ),
            );
          },
        ));
  }
}

class _AthletesView extends StatelessWidget {
  final Athletes athletes;

  const _AthletesView({Key key, this.athletes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: athletes.data.length,
      itemBuilder: (BuildContext context, int index) {
        return _SearchResultItem(athlete: athletes.data[index]);
      },
    );
  }
}

class _SearchResultItem extends StatelessWidget {
  final Datum athlete;

  const _SearchResultItem({Key key, this.athlete}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AthleteCard(
      email: athlete.attributes.email,
      firstName: athlete.attributes.firstName,
      lastName: athlete.attributes.lastName,
      profileImageUrl: athlete.attributes.profileImageUrl,
    );
  }
}

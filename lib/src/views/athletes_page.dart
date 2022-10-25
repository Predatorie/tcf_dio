import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tcf_dio/src/branding.dart';
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
          title: Text('ATHLETES'),
          centerTitle: true,
        ),
        body: SafeArea(
          bottom: false,
          child: BlocListener<AppCubit, AppState>(
            listener: (context, state) {},
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
                  Expanded(
                    child: _AthletesView(
                      athletes: athletes,
                    ),
                  ),
                ],
              ),
            ),
          ),
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

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tcf_dio/src/cubits/app_cubit.dart';
import 'package:tcf_dio/src/models/benchmarks.dart';
import 'package:tcf_dio/src/views/movements_page.dart';
import 'package:tcf_dio/src/widgets/benchmark_card.dart';

import '../branding.dart';

class BenchmarksPage extends StatelessWidget {
  static const String routeName = '/benchmarks';

  @override
  Widget build(BuildContext context) {
    final Benchmarks benchmarks = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('BENCHMARKS'),
        centerTitle: true,
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
                Expanded(
                  child: _BenchmarksView(
                    benchmarks: benchmarks,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _BenchmarksView extends StatelessWidget {
  final Benchmarks benchmarks;

  const _BenchmarksView({
    Key key,
    @required this.benchmarks,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: benchmarks.data.length,
      itemBuilder: (BuildContext context, int index) {
        return _BenchmarkResultItem(
          benchmark: benchmarks.data[index],
        );
      },
    );
  }
}

class _BenchmarkResultItem extends StatelessWidget {
  final Datum benchmark;

  const _BenchmarkResultItem({Key key, @required this.benchmark})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(builder: (ctx, state) {
      return BenchmarkCard(
        name: benchmark.attributes.name,
        description: benchmark.attributes.description,
        scoreType: benchmark.attributes.scoreType,
        category: benchmark.attributes.category,
        movements: benchmark.attributes.movementIds,
        onTap: benchmark.attributes.movementIds.length > 0
            ? () => ctx
                .read<AppCubit>()
                .getMovements(movementsId: benchmark.attributes.movementIds)
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

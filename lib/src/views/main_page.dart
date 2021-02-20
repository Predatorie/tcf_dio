import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:tcf_dio/src/branding.dart';
import 'package:tcf_dio/src/cubits/app_cubit.dart';
import 'package:tcf_dio/src/models/swiper_menu.dart';
import 'package:tcf_dio/src/views/athletes_page.dart';
import 'package:tcf_dio/src/views/benchmarks_page.dart';
import 'package:tcf_dio/src/views/workout_page.dart';

class MainPage extends StatelessWidget {
  static const String routeName = '/mainpage';

  /// onTap handler to fetch our data
  void _onTap(int index, context) {
    switch (index) {
      case 1:
        BlocProvider.of<AppCubit>(context).getWorkouts();
        break;
      case 2:
        BlocProvider.of<AppCubit>(context).getBenchmarksByCategory('heroes');
        break;
      case 3:
        BlocProvider.of<AppCubit>(context).getBenchmarksByCategory('girls');
        break;
      case 4:
        BlocProvider.of<AppCubit>(context).getBenchmarksByCategory('games');
        break;
      case 5:
        BlocProvider.of<AppCubit>(context)
            .getBenchmarksByCategory('gymnastics');
        break;
      case 6:
        BlocProvider.of<AppCubit>(context).getBenchmarksByCategory('notables');
        break;
      case 7:
        BlocProvider.of<AppCubit>(context).getBenchmarksByCategory('custom');
        break;
      case 8:
        BlocProvider.of<AppCubit>(context).getAthletesGroupedByFirstName();
        break;

      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tollandCrossFitWhite,
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [tollandCrossFitBlue, tollandCrossFitWhite],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.3, 0.7])),
        child: BlocListener<AppCubit, AppState>(
          listener: (ctx, state) {
            /// WORKOUTS
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

            /// ATHLETES
            if (state is AthletesLoading) {
              _showScaffold(context, 'Loading athletes...');
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

            /// BENCHMARKS
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
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 30, top: 80),
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Tolland CrossFit',
                        style: TextStyle(
                          fontFamily: 'Avenir',
                          fontSize: 28,
                          color: const Color(0xffffffff),
                          fontWeight: FontWeight.w900,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 500,
                  padding: const EdgeInsets.only(left: 32),
                  child: Swiper(
                    physics: ScrollPhysics(),
                    itemCount: menu.length,
                    itemWidth: MediaQuery.of(context).size.width - 2 * 64,
                    layout: SwiperLayout.STACK,
                    pagination: SwiperPagination(
                      builder: DotSwiperPaginationBuilder(
                        activeSize: 20,
                        space: 8,
                        activeColor: tollandCrossFitRed,
                        color: tollandCrossFitGrey,
                      ),
                    ),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () => _onTap(menu[index].position, context),
                        child: Stack(
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                SizedBox(height: 100),
                                Card(
                                  elevation: 8,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(32),
                                  ),
                                  color: tollandCrossFitBlue,
                                  child: Padding(
                                    padding: const EdgeInsets.all(32.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        SizedBox(height: 120),
                                        Text(
                                          menu[index].title,
                                          style: TextStyle(
                                            fontFamily: 'Avenir',
                                            fontSize: 32,
                                            color: tollandCrossFitWhite,
                                            fontWeight: FontWeight.w900,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                        Text(
                                          menu[index].category,
                                          style: TextStyle(
                                            fontFamily: 'Avenir',
                                            fontSize: 16,
                                            color: tollandCrossFitWhite,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                        SizedBox(height: 32),
                                        Row(
                                          children: <Widget>[
                                            Text(
                                              'Know more',
                                              style: TextStyle(
                                                fontFamily: 'Avenir',
                                                fontSize: 18,
                                                color: tollandCrossFitBlue,
                                                fontWeight: FontWeight.w500,
                                              ),
                                              textAlign: TextAlign.left,
                                            ),
                                            Icon(
                                              Icons.arrow_forward,
                                              color: tollandCrossFitBlue,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Positioned(
                              top: 40,
                              left: 60,
                              child: ClipOval(
                                child: Container(
                                  height: 200,
                                  width: 200,
                                  child: Hero(
                                      tag: menu[index].heroId,
                                      child: Image.asset(
                                        menu[index].asset,
                                        fit: BoxFit.cover,
                                      )),
                                ),
                              ),
                            ),
                            Positioned(
                              right: 24,
                              bottom: 60,
                              child: Text(
                                'TOLLAND',
                                style: TextStyle(
                                  fontFamily: 'Avenir',
                                  fontSize: 200,
                                  color: tollandCrossFitBlack.withOpacity(0.08),
                                  fontWeight: FontWeight.w900,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
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

_showScaffold(BuildContext context, String message) {
  ScaffoldMessenger.of(context)
      .removeCurrentSnackBar(reason: SnackBarClosedReason.dismiss);

  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(message),
    duration: Duration(seconds: 4),
  ));
}

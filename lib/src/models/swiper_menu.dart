import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SwiperMenu {
  final int position;
  final String title;
  final String heroId;
  final String category;
  final String asset;

  SwiperMenu({
    @required this.position,
    @required this.title,
    @required this.heroId,
    @required this.category,
    @required this.asset,
  });
}

List<SwiperMenu> menu = [
  SwiperMenu(
    title: 'WOD',
    position: 1,
    heroId: '1',
    category: DateFormat.yMMMMEEEEd().format(DateTime.now()),
    asset: 'assets/images/tcf_logo_small.png',
  ),
  SwiperMenu(
    title: 'Hero',
    position: 2,
    heroId: '2',
    category: 'BENCHMARK',
    asset: 'assets/images/tcf_logo_small.png',
  ),
  SwiperMenu(
    title: 'Girls',
    position: 3,
    heroId: '3',
    category: 'BENCHMARK',
    asset: 'assets/images/tcf_logo_small.png',
  ),
  SwiperMenu(
    title: 'Games',
    position: 4,
    heroId: '4',
    category: 'BENCHMARK',
    asset: 'assets/images/tcf_logo_small.png',
  ),
  SwiperMenu(
    title: 'Gymnastics',
    position: 5,
    heroId: '5',
    category: 'BENCHMARK',
    asset: 'assets/images/tcf_logo_small.png',
  ),
  SwiperMenu(
    title: 'Notables',
    position: 6,
    heroId: '6',
    category: 'BENCHMARK',
    asset: 'assets/images/tcf_logo_small.png',
  ),
  SwiperMenu(
    title: 'Custom',
    position: 7,
    heroId: '7',
    category: 'BENCHMARK',
    asset: 'assets/images/tcf_logo_small.png',
  ),
];

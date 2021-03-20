import 'package:flutter/material.dart';
import 'package:movie_app/di/get_in.dart';
import '../../blocs/movie_carousel/movie_carousel_bloc.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  MovieCarouselBloc movieCrouselBloc;
  @override
  void initState() {
    super.initState();
    movieCrouselBloc = getItInstance<MovieCarouselBloc>();
    movieCrouselBloc.add(CarouselLoadEvent());
  }
  @override
  void dispose() {
    super.dispose();
    movieCrouselBloc?.close();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

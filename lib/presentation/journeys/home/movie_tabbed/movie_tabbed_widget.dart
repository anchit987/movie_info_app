import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/constants/size_constants.dart';
import 'package:movie_app/presentation/blocs/movie_tabbed/movie_tabbed_bloc.dart';
import 'package:movie_app/presentation/journeys/home/movie_tabbed/movie_list_view_builder.dart';
import 'package:movie_app/presentation/journeys/home/movie_tabbed/movie_tabbed_constants.dart';
import 'package:movie_app/presentation/journeys/home/movie_tabbed/tab_title_widget.dart';
import '../../../../common/extensions/size_extension.dart';

class MovieTabbedWidget extends StatefulWidget {
  @override
  _MovieTabbedWidgetState createState() => _MovieTabbedWidgetState();
}

class _MovieTabbedWidgetState extends State<MovieTabbedWidget> {
  MovieTabbedBloc get movieTabbedBloc =>
      BlocProvider.of<MovieTabbedBloc>(context);
  int currentTabIndex = 0;

  @override
  void initState() {
    super.initState();
    movieTabbedBloc
        .add(MovieTabChangedEvent(currentTabbedIndex: currentTabIndex));
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _onTabTapped(int index) {
    movieTabbedBloc.add(MovieTabChangedEvent(currentTabbedIndex: index));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieTabbedBloc, MovieTabbedState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.only(
            top: Sizes.dimen_4.h,
          ),
          child: Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (var i = 0; i < MovieTabbedConstants.movieTab.length; i++)
                    TabTitleWidget(
                      title: MovieTabbedConstants.movieTab[i].title,
                      onTap: () => _onTabTapped(i),
                      isSelected: MovieTabbedConstants.movieTab[i].index ==
                          state.currentTabIndex,
                    ),
                ],
              ),
              if (state is MovieTabbedChanged)
                Expanded(
                  child: MovieListViewBuilder(movies: state.movies),
                ),
            ],
          ),
        );
      },
    );
  }
}

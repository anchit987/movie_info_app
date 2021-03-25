import 'package:flutter/material.dart';

import '../../../../common/constants/size_constants.dart';
import '../../../../common/extensions/size_extension.dart';
import '../../../../common/screenutil/screenutil.dart';
import '../../../../domain/entities/movie_entity.dart';
import 'movie_card_widget.dart';

class MoviePageView extends StatefulWidget {
  final List<MovieEntity> movies;
  final int initialPage;

  const MoviePageView({
    Key key,
    @required this.movies,
    @required this.initialPage,
  })  : assert(initialPage >= 0, 'initialPage cannot be less than 0'),
        super(key: key);
  @override
  _MoviePageViewState createState() => _MoviePageViewState();
}

class _MoviePageViewState extends State<MoviePageView> {
  PageController _pageController;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: widget.initialPage,
      keepPage: false,
      viewportFraction: 0.65,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: Sizes.dimen_10.h),
      height: ScreenUtil.screenHeight * 0.35,
      child: PageView.builder(
        controller: _pageController,
        itemBuilder: (context, index) {
          final movie = widget.movies[index];
          return MovieCardWidget(
            movieId: movie.id,
            posterPath: movie.posterPath,
          );
        },
        pageSnapping: true,
        itemCount: widget.movies?.length ?? 0,
      ),
    );
  }
}

part of 'movie_tabbed_bloc.dart';

abstract class MovieTabbedEvent extends Equatable {
  const MovieTabbedEvent();

  @override
  List<Object> get props => [];
}

class MovieTabChangedEvent extends MovieTabbedEvent {
  final int currentTabbedIndex;

  const MovieTabChangedEvent({@required this.currentTabbedIndex});

  @override
  List<Object> get props => [currentTabbedIndex];
}

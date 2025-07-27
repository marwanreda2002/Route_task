import 'package:route_taske/core/errors/failures.dart';

import '../../../../data/model/photo_model.dart';

abstract class HomeStates{}

class HomeInitState extends HomeStates{}
class HomeErrorState extends HomeStates{
  final Failures error;
  HomeErrorState(this.error);
}
class HomeSuccessState extends HomeStates{
  final List<Photo> photos;
  HomeSuccessState(this.photos);
}
class HomeLoadingState extends HomeStates{}
// class HomeInitState extends HomeStates{}

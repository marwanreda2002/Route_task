import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:route_taske/data/model/photo_model.dart';
import 'package:route_taske/feature/ui/home/cubit/home_state.dart';

import '../../../../domain/use_cases/get_photo_usecase.dart';
@injectable
class HomeCubit extends Cubit<HomeStates> {
  HomeCubit({required this.getPhotosUseCase}):super(HomeInitState());
  GetPhotosUseCase getPhotosUseCase ;

  void getPhotos({int page = 1, int perPage = 20})async {
    emit(HomeLoadingState());
    var either= await getPhotosUseCase.invoke();

    either.fold((error) {
      print("Marwan reda $error");
      return emit(HomeErrorState(error));

    } , (response) {
      print("Marwan success ${response.length}");
      return emit(HomeSuccessState(response as List<Photo>));
    });
  }

  Future<bool> CheckInternet()async{
    List<ConnectivityResult> result = await Connectivity().checkConnectivity() ;
    if(result.contains(ConnectivityResult.wifi) || result.contains(ConnectivityResult.mobile)){
      return true;
    }else{
      return false;
    }
  }
}


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_taske/feature/ui/home/cubit/home_cubit.dart';
import 'package:route_taske/feature/ui/home/home_grid.dart';

import '../../../core/di/d_injection.dart';
import 'cubit/home_state.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  HomeCubit homeCubit = getIt<HomeCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.transparent,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Image.asset("assets/images/route.png",width: 150,),

                ],
              ),
            ),
            // Content
            Expanded(
              child: BlocProvider(
                create: (context) => getIt<HomeCubit>()..getPhotos(),
                child: BlocConsumer<HomeCubit, HomeStates>(
                  listener: (context, state) {
                    if (state is HomeErrorState) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(state.error.errorMessage),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  },
                  builder: (BuildContext context, HomeStates state) {
                    if (state is HomeLoadingState) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Colors.blue,
                        ),
                      );
                    }
                    if (state is HomeSuccessState) {
                      return HomeGrid(photos: state.photos,);
                    }
                    if (state is HomeErrorState) {
                      return Center(
                        child: Text(
                          state.error.errorMessage,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.red,
                          )
                        )
                      );
                    }
                    return const Center(
                      child: Text(
                        "No photos available",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }




  }

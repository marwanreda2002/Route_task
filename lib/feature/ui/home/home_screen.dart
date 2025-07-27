import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_taske/feature/ui/home/cubit/home_cubit.dart';
import 'package:route_taske/feature/ui/home/home_grid.dart';
import '../../../core/cahe_helper.dart';
import '../../../core/di/d_injection.dart';
import 'cubit/home_state.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLight = true;
  bool isConnected = false;



  void toggleTheme() {
    setState(() {
      isLight = !isLight;
      CashHelper.saveData(key: "isLight", value: isLight);
    });
  }
  @override
  void initState() {
    super.initState();


    isLight = CashHelper.getData(key: "isLight") ?? true;

  }

  @override
  HomeCubit homeCubit = getIt<HomeCubit>();


  @override
  Widget build(BuildContext context) {
    Connectivity().onConnectivityChanged.listen((result) async {

      isConnected= await homeCubit.CheckInternet();
      setState(() {

      });
    }
    );
    return Scaffold(
      backgroundColor: isLight == true ? Colors.white : Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: Colors.transparent),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    "assets/images/route.png",
                    width: 150,
                    color: isLight ? Colors.blue : Colors.white,
                  ),
                  Text("Connection",style: TextStyle(color: Colors.blue),),
                  isConnected ? Icon(Icons.wifi,color: Colors.green,) : Icon(Icons.wifi_off,color: Colors.red,),
                  GestureDetector(
                    onTap: toggleTheme,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: isLight ? Colors.blue[50] : Colors.blue[900],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Icon(
                        isLight ? Icons.wb_sunny : Icons.nightlight_round,
                        color: isLight ? Colors.blue[600] : Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Content
            Expanded(
              child: BlocProvider(
                create: (context) => getIt<HomeCubit>()..getPhotos(),
                child: BlocConsumer<HomeCubit, HomeStates>(
                  listener: (context, state) {

                  },
                  builder: (BuildContext context, HomeStates state) {
                    if (state is HomeLoadingState) {
                      return const Center(
                        child: CircularProgressIndicator(color: Colors.blue),
                      );
                    }
                    if (state is HomeSuccessState) {
                      return HomeGrid(photos: state.photos);
                    }
                    if (state is HomeErrorState) {
                      return Center(
                        child: Text(
                          "Invalid Key",
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.red,
                          ),
                        ),
                      );
                    }
                    return const Center(
                      child: Text(
                        "No photos available",
                        style: TextStyle(fontSize: 16, color: Colors.grey),
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

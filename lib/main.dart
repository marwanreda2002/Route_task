import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:route_taske/core/api_manager/api_constant.dart';
import 'package:route_taske/domain/repositories/photo/photos_repo.dart';

import 'core/api_manager/api_service.dart';
import 'core/di/d_injection.dart';
import 'feature/ui/home/home_screen.dart';

ApiService createApiService() {
  final dio = Dio(BaseOptions(
    baseUrl: ApiConstant.baseUrl,
    headers: {
      'Authorization': 'hg10BK3eZM6UJr30zy38dK89VkUUqjR4gDgjL9cKXQhOs8vgEnwDYjqt',
    },
  ));

  return ApiService(dio);
}

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  final dir = await getApplicationDocumentsDirectory();
  Hive.init(dir.path);
  
  PhotosRepo photosRepo= getIt<PhotosRepo>();
  try {
    final response = await photosRepo.getPhotos(page: 1, perPage: 50);
    print('API Response: $response');
    print('Photos count: ${response.fold((l) => 0, (r) => r.length)}');
  } catch (e) {
    print('API Error: $e');
  }
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:route_taske/core/di/d_injection.dart';
import 'package:route_taske/data/model/photo_model.dart';
import 'package:route_taske/feature/ui/home/cubit/home_cubit.dart';
import 'package:route_taske/feature/ui/home/cubit/home_state.dart';
import 'package:route_taske/feature/ui/home/home_screen.dart';

import 'home_screen_test.mocks.dart';

@GenerateMocks([HomeCubit])
void main() {
  group('HomeScreen Widget Tests', () {
    late MockHomeCubit mockHomeCubit;

    setUp(() {
      mockHomeCubit = MockHomeCubit();
      // Register the mock cubit in the dependency injection
      getIt.registerSingleton<HomeCubit>(mockHomeCubit);
    });

    tearDown(() {
      getIt.reset();
    });

    Widget createWidgetUnderTest() {
      return MaterialApp(
        home: HomeScreen(),
      );
    }

    testWidgets('should display loading indicator when state is HomeLoadingState', (WidgetTester tester) async {
      // Arrange
      when(mockHomeCubit.state).thenReturn(HomeLoadingState());
      when(mockHomeCubit.stream).thenAnswer((_) => Stream.value(HomeLoadingState()));

      // Act
      await tester.pumpWidget(createWidgetUnderTest());

      // Assert
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.text('Route'), findsOneWidget);
    });

    testWidgets('should display error widget when state is HomeErrorState', (WidgetTester tester) async {
      // Arrange
      final errorState = HomeErrorState(ServerFailure(errorMessage: 'Network error'));
      when(mockHomeCubit.state).thenReturn(errorState);
      when(mockHomeCubit.stream).thenAnswer((_) => Stream.value(errorState));

      // Act
      await tester.pumpWidget(createWidgetUnderTest());

      // Assert
      expect(find.text('Something went wrong'), findsOneWidget);
      expect(find.text('Please check your connection and try again'), findsOneWidget);
      expect(find.text('Retry'), findsOneWidget);
      expect(find.byType(ElevatedButton), findsOneWidget);
    });

    testWidgets('should display photo grid when state is HomeSuccessState', (WidgetTester tester) async {
      // Arrange
      final mockPhotos = [
        Photo(
          id: 1,
          src: Src(
            original: 'https://example.com/photo1.jpg',
            medium: 'https://example.com/photo1_medium.jpg',
          ),
        ),
        Photo(
          id: 2,
          src: Src(
            original: 'https://example.com/photo2.jpg',
            medium: 'https://example.com/photo2_medium.jpg',
          ),
        ),
      ];
      final successState = HomeSuccessState(mockPhotos);
      when(mockHomeCubit.state).thenReturn(successState);
      when(mockHomeCubit.stream).thenAnswer((_) => Stream.value(successState));

      // Act
      await tester.pumpWidget(createWidgetUnderTest());

      // Assert
      expect(find.byType(MasonryGridView), findsOneWidget);
      expect(find.byType(CachedNetworkImage), findsNWidgets(2));
    });

    testWidgets('should display "No photos available" when state is HomeInitState', (WidgetTester tester) async {
      // Arrange
      when(mockHomeCubit.state).thenReturn(HomeInitState());
      when(mockHomeCubit.stream).thenAnswer((_) => Stream.value(HomeInitState()));

      // Act
      await tester.pumpWidget(createWidgetUnderTest());

      // Assert
      expect(find.text('No photos available'), findsOneWidget);
    });

    testWidgets('should call getPhotos when retry button is pressed', (WidgetTester tester) async {
      // Arrange
      final errorState = HomeErrorState(ServerFailure(errorMessage: 'Network error'));
      when(mockHomeCubit.state).thenReturn(errorState);
      when(mockHomeCubit.stream).thenAnswer((_) => Stream.value(errorState));
      when(mockHomeCubit.getPhotos()).thenAnswer((_) async {});

      // Act
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.tap(find.text('Retry'));
      await tester.pump();

      // Assert
      verify(mockHomeCubit.getPhotos()).called(1);
    });

    testWidgets('should display header with logo and theme toggle', (WidgetTester tester) async {
      // Arrange
      when(mockHomeCubit.state).thenReturn(HomeInitState());
      when(mockHomeCubit.stream).thenAnswer((_) => Stream.value(HomeInitState()));

      // Act
      await tester.pumpWidget(createWidgetUnderTest());

      // Assert
      expect(find.text('Route'), findsOneWidget);
      expect(find.byIcon(Icons.wb_sunny), findsOneWidget);
    });

    testWidgets('should display snackbar when error state is emitted', (WidgetTester tester) async {
      // Arrange
      final errorState = HomeErrorState(ServerFailure(errorMessage: 'Network error'));
      when(mockHomeCubit.state).thenReturn(HomeInitState());
      when(mockHomeCubit.stream).thenAnswer((_) => Stream.value(errorState));

      // Act
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pump();

      // Assert
      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.text('Network error'), findsOneWidget);
    });

    testWidgets('should display photo cards with proper styling', (WidgetTester tester) async {
      // Arrange
      final mockPhotos = [
        Photo(
          id: 1,
          src: Src(
            original: 'https://example.com/photo1.jpg',
            medium: 'https://example.com/photo1_medium.jpg',
          ),
        ),
      ];
      final successState = HomeSuccessState(mockPhotos);
      when(mockHomeCubit.state).thenReturn(successState);
      when(mockHomeCubit.stream).thenAnswer((_) => Stream.value(successState));

      // Act
      await tester.pumpWidget(createWidgetUnderTest());

      // Assert
      expect(find.byType(Container), findsWidgets);
      expect(find.byType(ClipRRect), findsWidgets);
      expect(find.byType(CachedNetworkImage), findsOneWidget);
    });

    testWidgets('should handle photo loading states properly', (WidgetTester tester) async {
      // Arrange
      final mockPhotos = [
        Photo(
          id: 1,
          src: Src(
            original: 'https://example.com/photo1.jpg',
            medium: 'https://example.com/photo1_medium.jpg',
          ),
        ),
      ];
      final successState = HomeSuccessState(mockPhotos);
      when(mockHomeCubit.state).thenReturn(successState);
      when(mockHomeCubit.stream).thenAnswer((_) => Stream.value(successState));

      // Act
      await tester.pumpWidget(createWidgetUnderTest());

      // Assert
      final cachedNetworkImage = tester.widget<CachedNetworkImage>(
        find.byType(CachedNetworkImage),
      );
      expect(cachedNetworkImage.placeholder, isNotNull);
      expect(cachedNetworkImage.errorWidget, isNotNull);
    });

    testWidgets('should display staggered grid layout', (WidgetTester tester) async {
      // Arrange
      final mockPhotos = List.generate(
        10,
        (index) => Photo(
          id: index,
          src: Src(
            original: 'https://example.com/photo$index.jpg',
            medium: 'https://example.com/photo${index}_medium.jpg',
          ),
        ),
      );
      final successState = HomeSuccessState(mockPhotos);
      when(mockHomeCubit.state).thenReturn(successState);
      when(mockHomeCubit.stream).thenAnswer((_) => Stream.value(successState));

      // Act
      await tester.pumpWidget(createWidgetUnderTest());

      // Assert
      expect(find.byType(MasonryGridView), findsOneWidget);
      expect(find.byType(CachedNetworkImage), findsNWidgets(10));
    });

    testWidgets('should handle empty photo list', (WidgetTester tester) async {
      // Arrange
      final successState = HomeSuccessState([]);
      when(mockHomeCubit.state).thenReturn(successState);
      when(mockHomeCubit.stream).thenAnswer((_) => Stream.value(successState));

      // Act
      await tester.pumpWidget(createWidgetUnderTest());

      // Assert
      expect(find.byType(MasonryGridView), findsOneWidget);
      expect(find.byType(CachedNetworkImage), findsNothing);
    });
  });
} 
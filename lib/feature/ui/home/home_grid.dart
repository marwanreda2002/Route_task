import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:route_taske/feature/ui/home/photo_card.dart';

class HomeGrid extends StatelessWidget {
  HomeGrid({super.key,required this.photos});
  final List<dynamic> photos;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: MasonryGridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          itemCount: photos.length,
          itemBuilder: (context, index) {
            final photo = photos[index];
            return PhotoCard( photo: photo, index: index,);
          },
        ),
      );
    }
  }


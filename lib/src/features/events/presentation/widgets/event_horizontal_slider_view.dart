import 'package:event_planner/src/core/utils/strings.dart';
import 'package:flutter/material.dart';

import '../../data/models/photo_model.dart';

class EventHorizontalSliderView extends StatelessWidget {
  const EventHorizontalSliderView({super.key, required this.sliderImages});

  final List<PhotoModel> sliderImages;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 360,
      child: Column(
        children: [
          SizedBox(
            height: 60,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(Strings.photos,
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(fontWeight: FontWeight.bold)),
                  TextButton.icon(
                    onPressed: () {},
                    iconAlignment: IconAlignment.end,
                    label: const Text(
                      Strings.allPhotos,
                    ),
                    icon: const Icon(
                      Icons.arrow_forward,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 300,
            child: PageView.builder(
              itemCount: sliderImages.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Expanded(
                      child: Container(
                        color: Colors.red,
                        child: Image.network(
                          'https://picsum.photos/seed/picsum/1000/300.jpg',
                          /*sliderImages[index].url*/
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            sliderImages[index].title,
                            textAlign: TextAlign.start,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            sliderImages[index].thumbnailUrl,
                            textAlign: TextAlign.start,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ),
                    const Divider(),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

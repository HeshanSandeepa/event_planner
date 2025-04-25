import 'package:flutter/material.dart';

import '../../data/models/photo_model.dart';

class EventHorizontalSliderView extends StatelessWidget {
  const EventHorizontalSliderView({super.key, required this.sliderImages});

  final List<PhotoModel> sliderImages;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('Photos', style: Theme.of(context).textTheme.bodyLarge),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.arrow_forward, color: Colors.black),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 400,
          width: 600,
          child: PageView.builder(
            itemCount: sliderImages.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Expanded(
                      child: Image.network(
                        'https://picsum.photos/seed/picsum/400/500.jpg' /*sliderImages[index].url*/,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    Text(
                      sliderImages[index].title,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Text(
                      sliderImages[index].thumbnailUrl,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

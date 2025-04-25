import 'package:flutter/material.dart';

import '../../data/models/photo_model.dart';

class EventSliderView extends StatefulWidget {
  const EventSliderView({super.key, required this.sliderImages});

  final List<PhotoModel> sliderImages;

  @override
  State<EventSliderView> createState() => _EventSliderViewState();
}

class _EventSliderViewState extends State<EventSliderView> {
  final _controller = PageController();
  String _currentPage = '';

  @override
  void initState() {
    super.initState();

    _addPageListener();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _setPageIndex();
    });
  }

  _addPageListener() {
    _controller.addListener(() {
      _setPageIndex();
    });
  }

  _setPageIndex() {
    setState(() {
      _currentPage =
          '${_controller.page?.round() ?? 0} / ${widget.sliderImages.length}';
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 300,
          child: PageView.builder(
            controller: _controller,
            itemCount: widget.sliderImages.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(
                  /*widget.sliderImages[index].url*/
                  'https://picsum.photos/seed/picsum/400/1000.jpg',
                  fit: BoxFit.cover,
                ),
              );
            },
          ),
        ),
        Positioned(bottom: 16, right: 16, child: Text(_currentPage)),
      ],
    );
  }
}

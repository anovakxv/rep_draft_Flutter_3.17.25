import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FullscreenGallery extends StatefulWidget {
  final List<String> images;
  final int initialIndex;

  const FullscreenGallery({
    Key? key,
    required this.images,
    this.initialIndex = 0,
  }) : super(key: key);

  @override
  _FullscreenGalleryState createState() => _FullscreenGalleryState();
}

class _FullscreenGalleryState extends State<FullscreenGallery> {
  late PageController _pageController;
  late int _currentIndex;
  bool _isExiting = false;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    _pageController = PageController(initialPage: _currentIndex);

    // Set preferred orientation to landscape
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    // Hide status bar
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  }

  @override
  void dispose() {
    // Reset orientation to portrait
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    // Show status bar
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom],
    );

    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _exitFullscreen() {
    setState(() {
      _isExiting = true;
    });

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onVerticalDragEnd: (details) {
          // If swiped up with enough velocity, exit fullscreen
          if (details.velocity.pixelsPerSecond.dy < -300) {
            _exitFullscreen();
          }
        },
        child: Stack(
          children: [
            // Gallery
            AnimatedOpacity(
              opacity: _isExiting ? 0.0 : 1.0,
              duration: const Duration(milliseconds: 300),
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: _onPageChanged,
                itemCount: widget.images.length,
                itemBuilder: (context, index) {
                  return Center(
                    child: InteractiveViewer(
                      minScale: 0.5,
                      maxScale: 3.0,
                      child: Image.network(
                        widget.images[index],
                        fit: BoxFit.contain,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes!
                                  : null,
                              color: Colors.white,
                            ),
                          );
                        },
                        errorBuilder: (context, error, stackTrace) {
                          return const Center(
                            child: Icon(
                              Icons.error_outline,
                              color: Colors.white,
                              size: 48,
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
            ),

            // Close button
            Positioned(
              top: 20,
              right: 20,
              child: IconButton(
                icon: const Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 30,
                ),
                onPressed: _exitFullscreen,
              ),
            ),

            // Image counter
            if (widget.images.length > 1)
              Positioned(
                bottom: 20,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text(
                        '${_currentIndex + 1} / ${widget.images.length}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

            // Swipe up indicator
            Positioned(
              bottom: 60,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  const Icon(
                    Icons.keyboard_arrow_up,
                    color: Colors.white70,
                    size: 24,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Swipe up to close',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.7),
                      fontSize: 12,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

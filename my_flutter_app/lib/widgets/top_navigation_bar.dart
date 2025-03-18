import 'package:flutter/material.dart';

class TopNavigationBar extends StatelessWidget {
  final String title;
  final VoidCallback onBackPressed;

  const TopNavigationBar({
    Key? key,
    required this.title,
    required this.onBackPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF9F9F9),
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(15, 13, 15, 13),
      child: Stack(
        children: [
          // Left side with time and back button
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 17),
                child: RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: '9:4',
                        style: TextStyle(
                          fontFamily: 'SF Pro Text',
                          fontWeight: FontWeight.w600,
                          letterSpacing: -0.28,
                          color: Colors.black,
                          fontSize: 14,
                        ),
                      ),
                      TextSpan(
                        text: '1',
                        style: TextStyle(
                          fontFamily: 'SF Pro Text',
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: InkWell(
                  onTap: onBackPressed,
                  borderRadius: BorderRadius.circular(12),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                      size: 24,
                    ),
                  ),
                ),
              ),
            ],
          ),

          // Center title
          Positioned(
            left: 0,
            right: 0,
            top: 31,
            child: Center(
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),

          // Right side with status icons
          Positioned(
            right: 35,
            top: 13,
            child: Row(
              children: [
                Icon(Icons.signal_cellular_4_bar, size: 16),
                SizedBox(width: 4),
                Icon(Icons.wifi, size: 16),
                SizedBox(width: 4),
                Icon(Icons.battery_full, size: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

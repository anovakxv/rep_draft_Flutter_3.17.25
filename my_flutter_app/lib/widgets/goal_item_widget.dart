import 'package:flutter/material.dart';
import 'package:flutter_app/models/goal_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/goal_item.dart';
import 'package:google_fonts/google_fonts.dart';

class GoalItemWidget extends StatelessWidget {
  final GoalItem item;

  const GoalItemWidget({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, item.route),
      child: Container(
        margin: const EdgeInsets.only(bottom: 14),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Goal image or custom background
            item.isCustomBackground
                ? _buildCustomBackground()
                : Image.network(
                    item.imageUrl,
                    width: 178,
                    height: 90,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: 178,
                        height: 90,
                        color: Colors.grey[300],
                        child: Icon(Icons.image, color: Colors.grey[600]),
                      );
                    },
                  ),
            const SizedBox(width: 14),
            // Goal details
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 3),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Roboto',
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item.description,
                      style: const TextStyle(
                        fontSize: 17,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomBackground() {
    // Special case for Boys & Girls Club with custom background
    if (item.title == "Boys & Girls Club") {
      return Container(
        width: 179,
        height: 90,
        color: const Color(0xFF0093D0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                item.imageUrl,
                width: 131,
                height: 50,
                fit: BoxFit.contain,
              ),
              const Text(
                'BOYS & GIRLS CLUBS',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Roboto',
                  fontSize: 12,
                ),
              ),
              const Text(
                'OF THE SIOUX EMPIRE',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Roboto',
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  height: 0.8,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Container(
      width: 178,
      height: 90,
      color: Color(int.parse(item.backgroundColor ?? '0xFF0093D0')),
    );
  }
}

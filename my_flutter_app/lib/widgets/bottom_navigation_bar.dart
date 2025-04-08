import 'package:flutter/material.dart';

class BottomNavigationBar extends StatelessWidget {
  final VoidCallback onFirstButtonPressed;
  final VoidCallback onSecondButtonPressed;

  const BottomNavigationBar({
    Key? key,
    required this.onFirstButtonPressed,
    required this.onSecondButtonPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        height: 75,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              height: 1,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color(0xFFE4E4E4),
                  width: 1,
                ),
              ),
              margin: const EdgeInsets.only(bottom: 15),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    constraints: const BoxConstraints(maxWidth: 345),
                    child: Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: onFirstButtonPressed,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF7BBF4B),
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                              elevation: 4,
                              shadowColor:
                                  const Color(0xFF7BBF4B).withOpacity(0.1),
                              textStyle: const TextStyle(
                                fontFamily: 'Roboto', // Added font family
                              ),
                            ),
                            child: Image.network(
                              'https://cdn.builder.io/api/v1/image/assets/TEMP/239ce2bc0ecd48e82606b7b17e9ef300a0370adf2b04059541d256922f2a5e50?placeholderIfAbsent=true&apiKey=c8d530c75cd1478687ed622797fda84f',
                              width: 24,
                              height: 24,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        const SizedBox(width: 30),
                        OutlinedButton(
                          onPressed: onSecondButtonPressed,
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.all(12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                            side: const BorderSide(
                              color: Color(0xFFE4E4E4),
                              width: 1,
                            ),
                            textStyle: const TextStyle(
                              fontFamily: 'Roboto', // Added font family
                            ),
                          ),
                          child: Image.network(
                            'https://cdn.builder.io/api/v1/image/assets/TEMP/3628d031652289af709575c878c2b3c18ab234153712aa6810191dba2f20c1e6?placeholderIfAbsent=true&apiKey=c8d530c75cd1478687ed622797fda84f',
                            width: 24,
                            height: 24,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


import 'package:flutter/material.dart';

class OwnMessageCard extends StatelessWidget {
  const OwnMessageCard({super.key, required this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.centerRight,
        child: ConstrainedBox(
          constraints:
              BoxConstraints(maxHeight: MediaQuery.of(context).size.width - 45),
          child: Card(
            elevation: 1,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            color: const Color(0xffdcf8c6),
            child: Stack(
              children: [
                Padding(
                    padding: const EdgeInsets.only(
                        left: 10, right: 60, top: 5, bottom: 20),
                    child: Text(
                      message,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    )),
                const Positioned(
                    bottom: 4,
                    right: 10,
                    child: Row(
                      children: [
                        Text(
                          "20:58",
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(Icons.done_all, size: 20),
                      ],
                    ))
              ],
            ),
          ),
        ));
  }
}

import 'package:flutter/material.dart';

class ReplayCard extends StatelessWidget {
   ReplayCard({super.key ,  required this.message});
  String message ;  

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: ConstrainedBox(
        constraints:
            BoxConstraints(maxHeight: MediaQuery.of(context).size.width - 45,
            maxWidth:  MediaQuery.of(context).size.width - 85 ),
        child: Card(
          elevation: 1,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          color: const Color.fromARGB(255, 239, 235, 235),
          child:  Stack(
            children: [
              Padding(
                  padding:
                      EdgeInsets.only(left: 10, right: 45, top: 5, bottom: 20),
                  child:
                   Text(
                     message,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  ),
              Positioned(
                bottom: 4,
                right: 10,
                child: Text(
                  "20:58",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

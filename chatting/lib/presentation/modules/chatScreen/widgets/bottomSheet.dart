import 'package:flutter/material.dart';

class BottomSheets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 278,
      width: MediaQuery.of(context).size.width,
      child: Card(
        margin: const EdgeInsets.all(10),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconReaction(
                      Icons.insert_drive_file, Colors.amber, "Document"),
                  const SizedBox(
                    width: 25,
                  ),
                  iconReaction(Icons.camera,
                      const Color.fromARGB(255, 194, 50, 98), "Camera"),
                  const SizedBox(
                    width: 25,
                  ),
                  iconReaction(Icons.insert_photo, Colors.green, "Galerry"),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconReaction(Icons.headset, Colors.amber, "Music"),
                  const SizedBox(
                    width: 25,
                  ),
                  iconReaction(Icons.location_pin,
                      const Color.fromARGB(255, 119, 91, 81), "Location"),
                  const SizedBox(
                    width: 25,
                  ),
                  iconReaction(Icons.person, Colors.blue, "Contact"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget iconReaction(IconData? icon, Color? color, String nameFile) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: color,
          radius: 30,
          child: Icon(
            color: Colors.white,
            icon,
            size: 29,
          ),
        ),
        Text(
          nameFile,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
        )
      ],
    );
  }
}

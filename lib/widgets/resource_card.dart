import 'package:flutter/material.dart';

class ResourceCard extends StatelessWidget {
  final String title;
  final double price;
  final String image;
  const ResourceCard(
      {super.key,
      required this.title,
      required this.price,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            children: <Widget>[
              SizedBox(
                height: 300,
                width: double.infinity,
                child: Image(
                  image: AssetImage(image),
                  width: double.infinity,
                  height: 300,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  height: 65,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13),
                    color: const Color.fromRGBO(255, 255, 255, 0.6),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10.0),
                    child: Column(
                      children: [
                        Text(title),
                        Text('\$$price'),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class TitleInside extends StatelessWidget {
  final String imageUrl;
  final String title;
  final double? maxWidth;
  final double? aspectRatio;

  const TitleInside(this.imageUrl, this.title, {this.maxWidth, this.aspectRatio, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: AssetImage(imageUrl),
          fit: BoxFit.cover
        ),
      ),
      clipBehavior: Clip.antiAlias,
      constraints: BoxConstraints(
        maxWidth: maxWidth?? double.infinity,
        minWidth: 100
      ),
      child: AspectRatio(
        aspectRatio: aspectRatio?? 16/8,
        child: Stack(
          children: [
            Opacity(
              opacity: 0.8,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.black, Colors.transparent],
                    begin: Alignment.bottomLeft,
                    end: Alignment.centerRight,
                    stops: [0, 0.6]
                  ),
                ),
                width: double.infinity,
                height: double.infinity,
              ),
            ),
            Positioned(
              child: Padding(
                padding: EdgeInsets.all(13),
                child: Text(
                  style: TextStyle(
                    fontSize: 22,
                    shadows: [
                      Shadow(
                        color: Colors.black54,
                        offset: Offset(1, 3),
                        blurRadius: 4,
                      ),
                    ],
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  title
                ),
              )
            )
          ],
        ),
      )
    );
  }
}
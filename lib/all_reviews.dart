import 'package:dormchef/recipe_review.dart';
import 'package:flutter/material.dart';

class AllReviewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Reviews'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ReviewItem(
                    username: 'User1',
                    starRating: 4,
                    comment: 'This mooncake recipe is amazing!',
                    photoAssetPath: 'assets/images/hafiz.jpg',
                    reviewPhotoAssetPaths: [
                      'assets/images/mac-n-cheese.jpg',
                      'assets/images/korean-friend-rice.jpg',
                    ],
                  ),
                  ReviewItem(
                    username: 'User2',
                    starRating: 5,
                    comment: 'I love these mooncakes! Highly recommended.',
                    photoAssetPath: 'assets/images/hafiz.jpg',
                    reviewPhotoAssetPaths: [
                      'assets/images/sardine-and-egg.jpg',
                      'assets/images/steamed-eggs.jpg',
                    ],
                  ),
                  ReviewItem(
                    username: 'User2',
                    starRating: 5,
                    comment: 'These mooncakes are precious.',
                    photoAssetPath: 'assets/images/hafiz.jpg',
                    reviewPhotoAssetPaths: [
                      'assets/images/gigi-hadid-pasta.jpg',
                      'assets/images/cheesekut.png',
                    ],
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
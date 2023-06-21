import 'package:dormchef/all_reviews.dart';
import 'package:dormchef/review.dart';
import 'package:flutter/material.dart';

class MooncakeRecipePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mooncake Recipe'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.all(16),
              child: Image.asset(
                'assets/images/imageex2.png', 
                height: 200,
                width: 200,// Replace with the path to your recipe picture asset
               
              ),
            ),
            Container(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Traditional Mooncake', // Replace with your recipe name
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Dessert', // Replace with your recipe category
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'A classic recipe for traditional mooncakes.',
                    // Replace with your recipe description
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 24),
                  Text(
                    'Ingredients:',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '- 250g glutinous rice flour',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    '- 180g golden syrup',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    '- 70g vegetable oil',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    '- 1/2 tsp alkaline water',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    '- Lotus seed paste for filling',
                    style: TextStyle(fontSize: 16),
                  ),
                  // Add more ingredients as needed

                  SizedBox(height: 24),
                  Text(
                    'Method:',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '1. Mix the golden syrup, vegetable oil, and alkaline water in a bowl.',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    '2. Slowly add the glutinous rice flour to the mixture and knead until a smooth dough forms.',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    '3. Divide the dough into small portions and wrap each portion around a ball of lotus seed paste.',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    '4. Press the filled dough into mooncake molds to shape them.',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    '5. Bake the mooncakes in a preheated oven at 180°C for 15-20 minutes.',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    '6. Allow the mooncakes to cool before serving.',
                    style: TextStyle(fontSize: 16),
                  ),
                  // Add more steps as needed

                  SizedBox(height: 24),
                  Text(
                    'Reviews:',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
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
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AllReviewsPage(),
                        ),
                      );
                    },
                    child: Text('See All Reviews'),
                  ),
                  SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ReviewPage(),
                        ),
                      );
                    },
                    child: Text('Add Review'),
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

class ReviewItem extends StatelessWidget {
  final String username;
  final double starRating;
  final String comment;
  final String? photoAssetPath;
  final List<String>? reviewPhotoAssetPaths;

  ReviewItem({
    required this.username,
    required this.starRating,
    required this.comment,
    this.photoAssetPath,
    this.reviewPhotoAssetPaths,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (photoAssetPath != null)
                Container(
                  margin: EdgeInsets.only(right: 8),
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(photoAssetPath!),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 16,
                        ),
                        SizedBox(width: 4),
                        Text(
                          starRating.toString(),
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                    SizedBox(height: 4),
                    Text(
                      username,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      comment,
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (reviewPhotoAssetPaths != null && reviewPhotoAssetPaths!.isNotEmpty)
            SizedBox(height: 8),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: reviewPhotoAssetPaths!.map((assetPath) {
                return Container(
                  margin: EdgeInsets.only(right: 8),
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: AssetImage(assetPath),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: MooncakeRecipePage()));
}

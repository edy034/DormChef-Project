import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:dormchef/new_style.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  static const String routeName = '/profilepage';

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<String> texts = ['Everything in Free Plan', 'Access to more recipes', 'Upload Recipe publicly'];

  double getWidgetWidth(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double containerWidth = screenWidth - 37.0 - 16.0 - 34.0;
    return containerWidth;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
              top: 54.0,
              left: MediaQuery.of(context).size.width / 2 -
                  getWidgetWidth(context) / 2,
              child: SizedBox(
                  height: MediaQuery.of(context).size.height - 54.0,
                  child: SingleChildScrollView(
                      child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            height: 48.0,
                            width: 300.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24.0),
                              border: Border.all(
                                width: 1.2,
                                color: const Color(0xFF999999),
                              ),
                            ),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                'Hafiz Ahmad',
                                style: ManropeTextStyles.textStyle(
                                    color: const Color(0xFF444444)),
                              ),
                            ),
                          ),
                          const SizedBox(width: 16.0),
                          Container(
                            height: 34.0,
                            width: 34.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24.0),
                              color: const Color(0xFF444444),
                            ),
                            child: const Align(
                              alignment: Alignment.center,
                              child: Icon(
                                Iconsax.notification,
                                color: Color(0xFFFFFFFF),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )))),

          Positioned.fill(
            top: 120.0,
            child: SizedBox(
              height: MediaQuery.of(context).size.height - 120.0,
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    const SizedBox(
                      child: Align(
                        alignment: Alignment.center,
                        child: CircleAvatar(
                          radius: 64,
                          backgroundImage: AssetImage('assets/hafiz.jpg'),
                        ),
                      ),
                    ),

                    const SizedBox(height: 8),

                    Text(
                      '@hafizahd',
                      style: ManropeTextStyles.textStyle(fontWeight: FontWeight.w400, color: const Color(0xFF585858)),
                    ),

                    const SizedBox(height: 8),

                    Text(
                      'This person is lazy to set a bio',
                      style: ManropeTextStyles.textStyle(color: const Color(0xFF444444)),
                    ),

                    const SizedBox(height: 20),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Text(
                              '100',
                              style: ManropeTextStyles.textStyle(fontSize: 16, fontWeight: FontWeight.w600,),
                            ),
                            Text(
                              'following',
                              style: ManropeTextStyles.textStyle(color: const Color(0xFF585858)),
                            )
                          ],
                        ),

                        const SizedBox(width: 46),

                        Column(
                          children: [
                            Text(
                              '452',
                              style: ManropeTextStyles.textStyle(fontSize: 16, fontWeight: FontWeight.w600,),
                            ),
                            Text(
                              'follower',
                              style: ManropeTextStyles.textStyle(color: const Color(0xFF585858)),
                            )
                          ],
                        ),

                        const SizedBox(width: 46),

                        Column(
                          children: [
                            Text(
                              '1',
                              style: ManropeTextStyles.textStyle(fontSize: 16, fontWeight: FontWeight.w600,),
                            ),
                            Text(
                              'recipe',
                              style: ManropeTextStyles.textStyle(color: const Color(0xFF585858)),
                            )
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            height: 48.0,
                            width: 182.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24.0),
                              border: Border.all(
                                width: 1.2,
                                color: const Color(0xFF999999),
                              ),
                            ),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                'Edit Profile',
                                style: ManropeTextStyles.textStyle(color: const Color(0xFF444444)),
                              ),
                            )),

                        const SizedBox(width: 16),

                        Container(
                            height: 48.0,
                            width: 182.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24.0),
                              color: const Color(0xFF0B9A61),
                            ),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                'My Recipe',
                                style: ManropeTextStyles.textStyle(color: const Color(0xFFFFFFFF)),
                              ),
                            )),
                      ],
                    ),

                    const SizedBox(height: 12),

                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: const Divider(color: Color(0xFF999999), thickness: 1.2,),
                    ),
                  ],
                ),),),),
        ],
      ),
    );
  }
}

          // Profile Info
          
              /*
          Positioned.fill(
            top: 466.0,
            left: 24.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Active Plan',
                  style: ManropeTextStyles.textStyle(fontSize: 16, fontWeight: FontWeight.w600, color: const Color(0xFF444444))
                ),

                const SizedBox(height: 4),

                Text(
                  'Your currently is Dormchef Premium Plan\'s User',
                  style: ManropeTextStyles.textStyle(color: const Color(0xFF000000)),
                ),

                const SizedBox(height: 12),

                Container(
                  height: 208.0,
                  width: 364.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: const [0.0297, 0.9688],
                      colors: [
                        const Color(0xFF88FFC9).withOpacity(1.0),
                        const Color(0xFFFFEC42).withOpacity(0.0)
                      ],
                      transform: const GradientRotation(10.21 * (3.1415926535897932 / 180)), // Convert degrees to radians
                    ),
                    border: Border.all(width: 1.2, color: const Color(0xFF1E1E1E),),
                  ),
                  child: Padding(
                      padding: const EdgeInsets.only(left: 28.0, top: 29.0),
                      child: Row(
                        children: [
                          Expanded(
                              flex: 5,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'DormChef Premium Plan',
                                    style: PoppinsTextStyles.textStyle(fontSize: 16, fontWeight: FontWeight.w600, color: const Color(0xFF444444))
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'RM 9.90',
                                        style: PoppinsTextStyles.textStyle(fontWeight: FontWeight.w600,)
                                      ),

                                      const SizedBox(width: 4),

                                      Text(
                                        '/ month',
                                        style: PoppinsTextStyles.textStyle(fontWeight: FontWeight.w400,)
                                      )
                                    ],
                                  ),

                                  const SizedBox(height: 28),

                                  ListView.builder(
                                    itemCount: 3,
                                    itemBuilder: (context, index) {
                                      return Column(
                                        children: [
                                          Row(
                                            children: [
                                              const Icon(Iconsax.star1, color: Color(0xFFFDCC0D)),
                                              const SizedBox(width: 14),
                                              Text(
                                                texts[index],
                                                style: PoppinsTextStyles.textStyle(fontWeight: FontWeight.w400, color: const Color(0xFF444444))
                                              )
                                            ],
                                          ),
                                          const SizedBox(height: 4),
                                        ],
                                      );
                                    },
                                  )
                                  
                                ],
                              )),
                          Expanded(
                            flex: 3,
                            child: FittedBox(
                              child: Container(
                                height: 183.0,
                                width: 183.0,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage('assets/spaceship.png'),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      )),
                ),

                const SizedBox(height: 16),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 48,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'view all plans',
                      style: ManropeTextStyles.textStyle(color: const Color(0xFF0056FB)),
                    ),
                  ),
                )
              ],
            ),
          )*/

      
      
      
      /*
          Positioned(
            top: 824.0,
            left: 24.0,
            child: Container(
              width: 368.0,
              height: 48.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24.0),
                border: Border.all(
                  width: 1.2,
                  color: Color(0xFFDC0201),
                ),
              ),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                'Report Issue',
                style: TextStyle11.textStyle11,
              ),
              )
              
            ),
          )
        ],
      ),*/

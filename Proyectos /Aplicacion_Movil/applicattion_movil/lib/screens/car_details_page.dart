import 'package:flutter/material.dart';
import 'car_entity.dart';
import 'counter_widget.dart';

final List<String> reviewImages = [
  'https://c.pxhere.com/photos/f7/4c/smile_profile_face_male_portrait_young_person_glasses-451655.jpg!d',
  'https://c.pxhere.com/photos/e0/83/eyeglasses_fashion_man_model_portrait-1364435.jpg!d',
  'https://c.pxhere.com/photos/8b/69/man_person_face_male_people_young_adult_smiling-987018.jpg!d',
];

final String addImageUrl = 'https://cdn-icons-png.freepik.com/512/14612/14612107.png';

final double bottomSectionHeight = 120;

class SimpleRatingBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        5,
        (index) => Icon(Icons.star, color: Color(0xFFFFBA00), size: 18),
      ),
    );
  }
}

class ReviewsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (_, index) => SizedBox(width: 18),
        itemBuilder: (_, index) {
          if (index == reviewImages.length) {
            return Image.network(addImageUrl, width: 48, height: 48);
          }
          return ClipOval(
            child: Image.network(reviewImages[index], width: 48, height: 48, fit: BoxFit.cover),
          );
        },
        itemCount: reviewImages.length + 1,
      ),
    );
  }
}

class CarDetailsPage extends StatefulWidget {
  final CarEntity car;

  const CarDetailsPage({super.key, required this.car});

  @override
  State<CarDetailsPage> createState() => _CarDetailsPageState();
}

class _CarDetailsPageState extends State<CarDetailsPage> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Stack(
        children: [
          ListView(
            padding: EdgeInsets.only(bottom: bottomSectionHeight),
            children: [
              AspectRatio(
                aspectRatio: 0.86,
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final imageHeight = constraints.maxHeight * 0.7;
                    final imageHorizontalMargin = constraints.maxWidth * 0.15;
                    final imageBottomMargin = constraints.maxHeight * 0.07;

                    return Stack(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 26),
                          decoration: BoxDecoration(
                            color: widget.car.color,
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(32),
                              bottomRight: Radius.circular(32),
                            ),
                          ),
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: imageHorizontalMargin,
                                right: imageHorizontalMargin,
                                bottom: imageBottomMargin,
                              ),
                              child: Image.network(
                                widget.car.image,
                                height: imageHeight,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: CounterWidget(
                            currentCount: count,
                            color: widget.car.color,
                            onIncreaseClicked: () {
                              setState(() {
                                count++;
                              });
                            },
                            onDecreaseClicked: () {
                              setState(() {
                                if (count > 0) count--;
                              });
                            },
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              SizedBox(height: 58),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            widget.car.name,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(width: 8),
                        SimpleRatingBar(),
                      ],
                    ),
                    SizedBox(height: 16),
                    Text(
                      'El ${widget.car.name} es potencia sueca pura: diseño audaz, tecnología de élite y emoción en cada curva. Más que un auto, es una experiencia.',
                      style: TextStyle(color: Color.fromARGB(255, 28, 28, 28), fontSize: 16),
                    ),
                    SizedBox(height: 32),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Reseñas',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              'Ver todas',
                              style: TextStyle(
                                color: Color.fromARGB(255, 216, 97, 28),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        ReviewsList(),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          // AppBar
          Container(
            color: widget.car.color,
            padding: EdgeInsets.only(left: 24, right: 24, top: 50, bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  child: Image.network(
                    'https://cdn-icons-png.freepik.com/512/10289/10289682.png',
                    width: 32,
                  ),
                  onTap: () => Navigator.of(context).pop(),
                ),
                Text(
                  'Koenigsegg',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
                Image.network(
                  'https://flutter4fun.com/wp-content/uploads/2021/09/shop_white.png',
                  width: 32,
                )
              ],
            ),
          ),
          // Bottom Section
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: bottomSectionHeight,
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(color: Colors.black),
                        children: [
                          TextSpan(
                            text: '\$',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          TextSpan(
                            text: widget.car.price.toString(),
                            style: TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 124,
                    height: 58,
                    child: MyButton(
                      text: 'COMPRAR',
                      bgColor: Color.fromARGB(255, 12, 9, 0),
                      textColor: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Reutilizable botón personalizado
class MyButton extends StatelessWidget {
  final String text;
  final Color bgColor;
  final Color textColor;
  final VoidCallback? onPressed;

  const MyButton({
    Key? key,
    required this.text,
    required this.bgColor,
    required this.textColor,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed ?? () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor,
        foregroundColor: textColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        textStyle: TextStyle(fontWeight: FontWeight.bold),
      ),
      child: Text(text),
    );
  }
}
import 'package:flutter/material.dart';

import '../../models/custom_models/custom_recommended_model.dart';

class RecommendedSection extends StatelessWidget {
  const RecommendedSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
        flex: 2,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: foodRecommended.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(15),
              child: Card(
                color: Colors.white,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.29,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(18)),
                  child: Column(
                    children: [
                      Image.asset(
                        foodRecommended[index].foodImageURL,
                        fit: BoxFit.contain,
                        height: 80,
                        width: 60,
                      ),
                      Text(
                        foodRecommended[index].foodName,
                        style: const TextStyle(
                            fontSize: 13.5, color: Colors.black),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              foodRecommended[index].foodPrice,
                              style: const TextStyle(
                                  fontSize: 15.5, color: Colors.black),
                            ),
                            SizedBox(
                                width: 25,
                                height: 25,
                                child: InkWell(
                                  onTap: () {},
                                  child: Container(
                                    width: 25,
                                    height: 25,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: Colors.red.shade700,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: const Icon(
                                      Icons.add,
                                      color: Colors.white,
                                      size: 17,
                                    ),
                                  ),
                                ))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ));
  }
}

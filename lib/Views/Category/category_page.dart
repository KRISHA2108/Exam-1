import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:prectical_exam_core_flutter_1/products_utils/products_utils.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    String? category = ModalRoute.of(context)!.settings.arguments as String;
    List filteredList =
        products.where((element) => element['category'] == category).toList();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        title: Text(
          category.replaceFirst(
            category[0],
            category[0].toUpperCase(),
          ),
        ),
      ),
      backgroundColor: Colors.blueGrey,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: filteredList.length,
                itemBuilder: (context, index) {
                  return Container(
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.all(10),
                    height: 200,
                    width: 200,
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      image: DecorationImage(
                        image: NetworkImage(
                          filteredList[index]['thumbnail'],
                        ),
                        alignment: AlignmentDirectional.bottomEnd,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          filteredList[index]['title'],
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          filteredList[index]['price'].toString(),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          filteredList[index]['category'].replaceFirst(
                            filteredList[index]['category'][0],
                            filteredList[index]['category'][0].toUpperCase(),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        RatingBar.builder(
                          initialRating: 3,
                          minRating: 1,
                          itemSize: 20,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 4.0),
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          filteredList[index]['brand'] ?? "Unknown",
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

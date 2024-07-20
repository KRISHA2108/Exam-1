import 'package:prectical_exam_core_flutter_1/headers.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: const Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                  "https://www.pngkit.com/png/detail/231-2318671_businesswoman-blank-profile-picture-female.png",
                ),
              ),
              accountName: Text("Krisha Gujarati"),
              accountEmail: Text("pBmKs@example.com"),
              decoration: BoxDecoration(
                color: Colors.blueGrey,
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('Home Page'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                Routes.cart,
              );
            },
            icon: Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Popular Products",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              flex: 1,
              child: CarouselSlider(
                options:
                    CarouselOptions(autoPlay: true, enlargeCenterPage: true),
                items: products.map(
                  (i) {
                    return Container(
                      height: size.height * 0.2,
                      width: size.width * 0.8,
                      margin: const EdgeInsets.symmetric(
                        horizontal: 5.0,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blueGrey,
                            blurRadius: 5,
                            offset: const Offset(5, 5),
                          ),
                        ],
                        image: DecorationImage(
                          image: NetworkImage(
                            i['thumbnail'].toString(),
                          ),
                          fit: BoxFit.fill,
                        ),
                      ),
                    );
                  },
                ).toList(),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Categories",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          ...image
                              .map(
                                (e) => Container(
                                  height: size.height * 0.10,
                                  width: size.width * 0.25,
                                  margin: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.grey,
                                        offset: Offset(3, 3),
                                        blurRadius: 3,
                                      ),
                                    ],
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        e,
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              )
                              .toList()
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: catergories
                            .map(
                              (e) => GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    Routes.category,
                                    arguments: e,
                                  );
                                },
                                child: Container(
                                  height: 20,
                                  width: 100,
                                  margin: const EdgeInsets.all(10),
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    e.replaceFirst(
                                      e[0],
                                      e[0].toUpperCase(),
                                    ),
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Text(
              "All Products",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  childAspectRatio: 4 / 7,
                  mainAxisSpacing: 20,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.detail,
                        arguments: products[index]);
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(5, 5),
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Image(
                            image: NetworkImage(products[index]['thumbnail']),
                            height: 175,
                            width: 200,
                            fit: BoxFit.cover,
                          ),
                          decoration: const BoxDecoration(
                            color: Colors.blueGrey,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                        ),
                        Text(
                          products[index]['category'].replaceFirst(
                            products[index]['category'][0],
                            products[index]['category'][0].toUpperCase(),
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.black,
                            // fontSize: 18,
                          ),
                        ),
                        Text(
                          products[index]['title'],
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.black,
                            // fontSize: 18,
                          ),
                        ),
                        Text(
                          products[index]['description'],
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.black,
                            // fontSize: 18,
                          ),
                        ),
                        Text(
                          "\$ ${products[index]['price']}".toString(),
                          style: const TextStyle(
                            color: Colors.black,
                            // fontSize: 18,
                          ),
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
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import './Cart.dart';
import 'Search.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  int _selectedindex = 0;
  PageController pageController = PageController();

  void onTapped(int index) {
    setState(() {
      _selectedindex = index;
    });
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 1000), curve: Curves.fastOutSlowIn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView(
        controller: pageController,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          const LAter(),
          const Search(),
          const Cart(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTapped,
        unselectedItemColor: const Color.fromARGB(115, 255, 255, 255),
        selectedItemColor: const Color.fromARGB(255, 255, 17, 0),
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 25,
              color: Colors.red,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              size: 25,
              color: Colors.red,
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopify_sharp,
              size: 25,
              color: Colors.red,
            ),
            label: 'Cart',
          ),
        ],
        currentIndex: _selectedindex,
      ),
    );
  }
}

class LAter extends StatelessWidget {
  const LAter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        leading: Image.asset(
          'assets/icons/kicks.png',
        ),
        centerTitle: true,
        title: const Text(
          'BRO KICKS',
          style: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              fontSize: 30,
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.black,
      ),
        body: ListView(
      // ignore: prefer_const_constructors
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const ShoeOfTheWeek(),
            const Categories(),
            const Top(),
            const Recommended(),
          ],
        ),
      ],
    ));
  }
}

class Top extends StatelessWidget {
  const Top({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 0, 0, 0),
      padding: const EdgeInsets.all(5),
      child: Column(children: [
        Container(
          padding: const EdgeInsets.fromLTRB(5, 20, 0, 20),
          alignment: Alignment.bottomLeft,
          decoration: const BoxDecoration(),
          child: const Text(
            'Trending',
            style: TextStyle(
                color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
            textAlign: TextAlign.start,
          ),
        ),
        CarouselSlider(
          options: CarouselOptions(
            height: 300.0,
            autoPlay: false,
            // autoPlayAnimationDuration: const Duration(milliseconds: 1500),
            autoPlayInterval: const Duration(seconds: 15),
          ),
          items: [1, 2, 3, 4, 5, 6, 7].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        borderRadius: BorderRadius.circular(10)),
                    child: GestureDetector(
                      onTap: () {},
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Image.asset('assets/image$i.jpg'),
                      ),
                    ));
              },
            );
          }).toList(),
        ),
      ]),
    );
  }
}

class ShoeOfTheWeek extends StatelessWidget {
  const ShoeOfTheWeek({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 31, 30, 30),
      padding: const EdgeInsets.all(10),
      child: Column(children: [
        Container(
          padding: const EdgeInsets.fromLTRB(20, 20, 0, 20),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13),
              color: const Color.fromARGB(255, 31, 30, 30),
              image:
                  const DecorationImage(image: AssetImage('assets/red.jpg'))),
          child: const Text(
            'WEEKLY HIT',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold,
              backgroundColor: Colors.transparent,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        CarouselSlider(
          options: CarouselOptions(
            height: 300.0,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 5),
          ),
          items: [1, 2, 3, 4, 5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 31, 30, 30),
                    ),
                    child: IconButton(
                        onPressed: () {},
                        icon: Image.asset('assets/stw/M$i.webp')));
              },
            );
          }).toList(),
        ),
      ]),
    );
  }
}

class Recommended extends StatefulWidget {
  const Recommended({super.key});

  @override
  State<Recommended> createState() => _RecommendedState();
}

class _RecommendedState extends State<Recommended> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Color.fromARGB(255, 17, 17, 17)),
      padding: const EdgeInsets.fromLTRB(5, 0, 0, 20),
      child: Column(children: [
        Container(
          padding: const EdgeInsets.all(20),
          alignment: Alignment.bottomLeft,
          decoration: const BoxDecoration(),
          child: const Text(
            'Recommended',
            style: TextStyle(
                color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
            textAlign: TextAlign.start,
          ),
        ),
        CarouselSlider(
          options: CarouselOptions(
            height: 300.0,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 10),
          ),
          items: [1, 2, 3, 4].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 17, 17, 17)),
                    child: GestureDetector(
                      onTap: () {},
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Image.asset('assets/R$i.jpeg'),
                      ),
                    ));
              },
            );
          }).toList(),
        ),
      ]),
    );
  }
}

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.all(5),
      decoration: const BoxDecoration(color: Color.fromARGB(255, 22, 11, 11)),
      child: CarouselSlider(
          options: CarouselOptions(
            height: 60,
            viewportFraction: 0.4,
            autoPlay: false,
            autoPlayInterval: const Duration(seconds: 10),
          ),
          items: [
            ElevatedButton.icon(
                onPressed: () {},
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                icon: Image.asset(
                  'assets/icons/jordans.png',
                  height: 30,
                ),
                label: const Text(
                  'Air Jordans',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                )),
            ElevatedButton.icon(
                onPressed: () {},
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                icon: Image.asset(
                  'assets/icons/nike.png',
                  height: 30,
                ),
                label: const Text(
                  'Air Force 1',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                )),
            ElevatedButton.icon(
                onPressed: () {},
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                icon: Image.asset(
                  'assets/icons/puma.png',
                  height: 30,
                ),
                label: const Text(
                  'Puma',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                )),
            ElevatedButton.icon(
                onPressed: () {},
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                icon: Image.asset(
                  'assets/icons/louis-vuitton.png',
                  height: 30,
                ),
                label: const Text(
                  'Louis Vuitton',
                  style: TextStyle(color: Colors.black, fontSize: 13),
                )),
            ElevatedButton.icon(
                onPressed: () {},
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                icon: Image.asset(
                  'assets/icons/reebok.png',
                  height: 30,
                ),
                label: const Text(
                  'Reebok',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                )),
            ElevatedButton.icon(
                onPressed: () {},
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                icon: Image.asset(
                  'assets/icons/vans.png',
                  height: 30,
                ),
                label: const Text(
                  'Vans',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                )),
            ElevatedButton.icon(
                onPressed: () {},
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                icon: Image.asset(
                  'assets/icons/adidas.png',
                  height: 30,
                ),
                label: const Text(
                  'Adidas',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                )),
          ]),
    );
  }
}

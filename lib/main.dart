import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> nowPlaying = [
      'https://picsum.photos/600/300?1',
      'https://picsum.photos/600/300?2',
      'https://picsum.photos/600/300?3',
      'https://picsum.photos/600/300?4',
      'https://picsum.photos/600/300?5',
      'https://picsum.photos/600/300?6',
    ];

    final List<String> trending = [
      'https://picsum.photos/600/300?7',
      'https://picsum.photos/600/300?8',
      'https://picsum.photos/600/300?9',
      'https://picsum.photos/200/300?10',
      'https://picsum.photos/200/300?11',
      'https://picsum.photos/200/300?12',
    ];

    final List<String> popular = [
      'https://picsum.photos/200/300?13',
      'https://picsum.photos/200/300?14',
      'https://picsum.photos/200/300?15',
      'https://picsum.photos/200/300?16',
      'https://picsum.photos/200/300?17',
      'https://picsum.photos/200/300?18',
    ];

    final List<String> topRated = [
      'https://picsum.photos/200/300?19',
      'https://picsum.photos/200/300?20',
      'https://picsum.photos/200/300?21',
      'https://picsum.photos/200/300?22',
      'https://picsum.photos/200/300?23',
      'https://picsum.photos/200/300?24',
    ];

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Now Playing'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider(
              items: nowPlaying.map((url) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(url, fit: BoxFit.cover, width: double.infinity),
                );
              }).toList(),
              options: CarouselOptions(
                height: 250,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                viewportFraction: 0.8,
              ),
            ),

            const SizedBox(height: 20),

            buildMovieSection('Trending', trending),
            buildMovieSection('Popular', popular),
            buildMovieSection('Top Rated', topRated),
          ],
        ),
      ),
    );
  }

  Widget buildMovieSection(String title, List<String> images) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold)),
              const Text("More", style: TextStyle(color: Colors.redAccent))
            ],
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 180,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: images.length,
              separatorBuilder: (context, index) => const SizedBox(width: 10),
              itemBuilder: (context, index) => ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(images[index],
                    width: 120, height: 180, fit: BoxFit.cover),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

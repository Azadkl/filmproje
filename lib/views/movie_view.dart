import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/movie_controller.dart';

class MovieView extends StatefulWidget {
  @override
  State<MovieView> createState() => _MovieViewState();
}

class _MovieViewState extends State<MovieView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text('Filmler'),
          actions: [
            GetBuilder<MovieController>(
              builder: (controller) {
                return IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    Get.defaultDialog(
                      title: 'Film Ara',
                      content: Column(
                        children: [
                          TextField(
                            controller: controller.searchController,
                          ),
                          SizedBox(height: 10),
                          TextButton(
                            onPressed: () {
                              controller.fetchMovies();
                              Get.back();
                            },
                            child: Text("ARA"),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
        body: GetBuilder<MovieController>(builder: (controller) {
          if (controller.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
              itemCount: controller.movieList.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.green,
                  child: ListTile(
                    leading: Image.network(
                      controller.movieList[index].poster,
                      errorBuilder: (context, error, stackTrace) =>
                          const Icon(Icons.error),
                    ),
                    title: Text(controller.movieList[index].title),
                    subtitle: Text('${controller.movieList[index].year}'),
                    onTap: () {
                      Get.defaultDialog(
                          backgroundColor: Colors.green,
                          title: controller.movieList[index].title,
                          content: Column(
                            children: [
                              Image.network(
                                controller.movieList[index].poster,
                              ),
                              SizedBox(height: 10),
                              Text(
                                'IMDb : ${controller.movieList[index].rating}',
                                style: TextStyle(fontSize: 20),
                              )
                            ],
                          ));
                    },
                  ),
                );
              },
            );
          }
        }));
  }
}

class SearchDialog extends StatefulWidget {
  @override
  State<SearchDialog> createState() => _SearchDialogState();
}

class _SearchDialogState extends State<SearchDialog> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MovieController>(
      builder: (controller) {
        return Column(
          children: [
            // TextField(
            //   controller: controller.searchController,
            //   decoration: InputDecoration(
            //     hintText: 'Filmin adını giriniz',
            //   ),
            // ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                controller.fetchMovies();
                Get.back();
              },
              child: Text('Ara'),
            )
          ],
        );
      },
    );
  }
}

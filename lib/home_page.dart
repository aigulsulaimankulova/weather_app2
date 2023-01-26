import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weather_app2/constants/api.dart';
import 'package:weather_app2/constants/app_colors.dart';
import 'package:weather_app2/constants/app_text.dart';
import 'package:weather_app2/constants/app_text_style.dart';

import 'package:weather_app2/model/weather.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // ignore: unused_element
    Future<Weather?> fetchData() async {
      final dio = Dio();
      await Future.delayed(const Duration(seconds: 3));
      final res = await dio.get(ApiConst.address);

      if (res.statusCode == 200) {
        final weather = Weather(
          id: res.data['weather'][0]['id'],
          main: res.data['weather'][0]['main'],
          description: res.data['weather'][0]['description'],
          icon: res.data['weather'][0]['icon'],
          city: res.data['name'],
          temp: res.data['main']['temp'],
          country: res.data['sys']['country'],
        );
        return weather;
      }
      return null;
    }

    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: const Text(
          AppText.appBarTitle,
          style: AppTextStyle.appBarStyle,
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: fetchData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/weather.jpg'), fit: BoxFit.cover),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {},
                        iconSize: 50,
                        color: AppColors.white,
                        icon: const Icon(
                          Icons.near_me,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        iconSize: 50,
                        color: AppColors.white,
                        icon: const Icon(
                          Icons.location_city,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 30,
                      ),
                      const Text('254.26', style: AppTextStyle.body1),
                      Image.network(
                        ApiConst.getIcon('01n', 4),
                        color: Colors.white,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Clear Sky'.replaceAll(' ', '\n'),
                        textAlign: TextAlign.start,
                        style: AppTextStyle.body2,
                      ),
                      const SizedBox(
                        width: 20,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Text(
                        snapshot.data!.city,
                        style: AppTextStyle.city,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );

    // Image.asset('assets/weather.jpg'),

    //       body: Center(
    //         child: FutureBuilder(
    //           future: fetchData(),
    //           builder: (context, snapshot) {
    //             if (snapshot.hasData) {
    //               return Column(
    //                 mainAxisAlignment: MainAxisAlignment.center,
    //                 children: [
    //                   Text('${snapshot.data!.id}'),
    //                   Text(snapshot.data!.description),
    //                   Text(snapshot.data!.main),
    //                   Text(snapshot.data!.icon),
    //                   Text(snapshot.data!.city),
    //                   Text('${snapshot.data!.temp}'),
    //                   Text(snapshot.data!.country),
    //             } else {
    //               return const Center(
    //                 child: CircularProgressIndicator(),
    //                 );
    //             }
    //           },
    //         ),

    //      ),
  }
}

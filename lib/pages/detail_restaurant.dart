import 'package:flutter/material.dart';
import 'package:flutter_restaurant/component/data_detail_restaurant.dart';
import 'package:flutter_restaurant/component/loading_item.dart';
import 'package:flutter_restaurant/data/service/api_service.dart';
import 'package:flutter_restaurant/provider/restaurant_provider.dart';
import 'package:flutter_restaurant/utils/loading.dart';
import 'package:provider/provider.dart';

class DetailRestaurantPage extends StatelessWidget {
  final String idRestaurant;

  const DetailRestaurantPage({Key? key, required this.idRestaurant})
      : super(key: key);

  static const routeName = '/detail-restaurant';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (_) => RestaurantProvider(apiService: ApiService())
            .getDetailRestaurant(idRestaurant),
        child: Consumer<RestaurantProvider>(
          builder: (context, state, _) {
            switch (state.loadingState) {
              case LoadingState.Loading:
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      CircularProgressIndicator(),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("Loading Please Wait"),
                      )
                    ],
                  ),
                );
              case LoadingState.NoData:
                return const ErrorOrNoData(type: "nodata");
              case LoadingState.HasData:
                return DataDetail(detailRestaurant: state.detailRestaurant);
              case LoadingState.Error:
                return ErrorOrNoData(
                    type: "error",
                    buttonTap: () {
                      state.getDetailRestaurant(idRestaurant);
                    });
            }
          },
        ),
      ),
    );
  }
}

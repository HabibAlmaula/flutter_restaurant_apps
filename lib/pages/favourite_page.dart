import 'package:flutter/material.dart';
import 'package:flutter_restaurant/component/loading_item.dart';
import 'package:flutter_restaurant/component/restauran_item.dart';
import 'package:flutter_restaurant/provider/database_provider.dart';
import 'package:provider/provider.dart';

class FavouritePage extends StatelessWidget {
  static const String routeName = "/favourite-page";

  const FavouritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Favourite Restaurant"),),
      body: Consumer<DatabaseProvider>(
        builder: (context,provider, child){
          if(provider.restaurant.isEmpty){
            return const ErrorOrNoData(type: 'nodata');
          }else {
            return ListView.builder(
                itemCount: provider.restaurant.length,
                padding: const EdgeInsets.all(5.0),
                itemBuilder: (context, index) {
                  return restaurantItem(
                      context, provider.restaurant[index]);
                }
            );
          }
        },
      )
    );
  }
}

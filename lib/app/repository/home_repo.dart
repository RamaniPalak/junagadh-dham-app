

import 'package:junagadh_temple/app/data/datasource/home_data.dart';
import 'package:junagadh_temple/app/data/entity/home_entity.dart';
import 'package:junagadh_temple/app/data/entity/res_homeslider.dart';

class HomeRepository{

  final HomeData dataSource;

  HomeRepository({required this.dataSource});

  Future<ResHomeSlider> getSlider() async {
    return await dataSource.getSlider();
  }

}
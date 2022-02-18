

import 'package:junagadh/app/data/datasource/home_data.dart';
import 'package:junagadh/app/data/entity/res_dailydarshan.dart';
import 'package:junagadh/app/data/entity/res_darshanfilter.dart';
import 'package:junagadh/app/data/entity/res_date.dart';
import 'package:junagadh/app/data/entity/res_donation.dart';
import 'package:junagadh/app/data/entity/res_event.dart';
import 'package:junagadh/app/data/entity/res_gallery.dart';
import 'package:junagadh/app/data/entity/res_homeslider.dart';
import 'package:junagadh/app/data/entity/res_timing.dart';

class HomeRepository{

  final HomeData dataSource;

  HomeRepository({required this.dataSource});

  Future<ResHomeSlider> getSlider() async {
    return await dataSource.getSlider();
  }

  Future<ResGallery> getGallery() async {
    return await dataSource.getGallery();
  }

  Future<ResDate> getDailyDarshan() async {
    return await dataSource.getDailyDarshan();
  }

  Future<List<ResList>>  getDailyDarshanDate() async {
    return await dataSource.getDailyDarshanDate();
  }

  Future<List<ResEvents>>  getEvent() async {
    return await dataSource.getEvent();
  }

  Future<ResDonation> getDonation() async {
    return await dataSource.getDonation();
  }

  Future<ResDarshanFilter> getDrashanFilter({String? date}) async {
    return await dataSource.getDarshanFilter(date: date);
  }

  Future<ResTiming> getTimimg() async {
    return await dataSource.getTiming();
  }

  Future<String> getYoutubeUrl () async{
    return await dataSource.getYoutubeUrl();
  }

}
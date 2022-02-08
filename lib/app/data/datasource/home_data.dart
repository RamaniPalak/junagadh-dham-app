import 'package:junagadh_temple/app/data/data_service/server_configs.dart';
import 'package:junagadh_temple/app/data/data_service/web_service.dart';
import 'package:junagadh_temple/app/data/entity/res_dailydarshan.dart';
import 'package:junagadh_temple/app/data/entity/res_darshanfilter.dart';
import 'package:junagadh_temple/app/data/entity/res_date.dart';
import 'package:junagadh_temple/app/data/entity/res_donation.dart';
import 'package:junagadh_temple/app/data/entity/res_event.dart';
import 'package:junagadh_temple/app/data/entity/res_gallery.dart';
import 'package:junagadh_temple/app/data/entity/res_homeslider.dart';
import 'package:junagadh_temple/app/data/entity/res_timing.dart';

abstract class HomeData {
  Future<ResHomeSlider> getSlider();

  Future<ResGallery> getGallery();

  Future<ResDate> getDailyDarshan();

  Future<List<ResList>> getDailyDarshanDate();

  Future<List<ResEvents>> getEvent();

  Future<ResDonation> getDonation();

  Future<ResDarshanFilter> getDarshanFilter({String? date});

  Future<ResTiming> getTiming();

  Future<String> getYoutubeUrl ();
}

class HomeDataImpl implements HomeData {
  @override
  Future<ResHomeSlider> getSlider() async {
    final res =
        await WebService.shared.getApiDIO(path: '${ServerConfigs.homeSlider}');
    print(res);

    return ResHomeSlider.fromJson(res!);
  }

  @override
  Future<ResGallery> getGallery() async {
    final res = await WebService.shared.getApiDIO(
        path: '${ServerConfigs.getGallery}', queryParameters: {'per_page': 1});
    print(res);

    return ResGallery.fromJson(res!);
  }

  @override
  Future<ResDate> getDailyDarshan({String? pageNo}) async {
    final res = await WebService.shared.getApiDIO(
        path: '${ServerConfigs.getDailyDarshan}',
        queryParameters: {
          'filter[orderby]': 'daily_darshan_date',
          'order': 'desc',
          'per_page': 1
        });
    print('getDailyDarshan ${res}');

    return ResDate.fromJson(res!);
  }

  @override
  Future<List<ResEvents>> getEvent() async {
    final res = await WebService.shared
        .getApiDIOForList(path: '${ServerConfigs.getEvents}');

    List<ResEvents> list = [];

    res?.forEach((element) {
      list.add(ResEvents.fromJson(element));
    });
    return list;
  }

  @override
  Future<ResDonation> getDonation({String? pageNo}) async {
    final res = await WebService.shared.getApiDIO(
        path: '${ServerConfigs.getDonation}', queryParameters: {'per_page': 1});

    return ResDonation.fromJson(res!);
  }

  @override
  Future<ResDarshanFilter> getDarshanFilter({String? date}) async {
    final res = await WebService.shared.postApiDIO(
        path: ServerConfigs.getDarshanData,
        queryParameters: {'date_request': date});

    return ResDarshanFilter.fromJson(res!);
  }

  @override
  Future<ResTiming> getTiming() async {
    final res =
        await WebService.shared.getApiDIO(path: '${ServerConfigs.getTiming}');
    print('response:${res}');

    return ResTiming.fromJson(res!);
  }

  @override
  Future<List<ResList>> getDailyDarshanDate() async {
    final res = await WebService.shared.getApiDIOForList(
        path: '${ServerConfigs.getDailyDarshan}',
        queryParameters: {
          'filter[orderby]': 'daily_darshan_date',
          'order': 'desc',
          'per_page': 30
        });

    final list = resListFromJson(res!);

    print('response');
    print(list.first.response?.data?.list?.first);

    return list;
  }

  @override
  Future<String> getYoutubeUrl() async {

    final res = await WebService.shared.getApiDIO(path: '${ServerConfigs.getYoutube}');

   final data = res?['data'] as List;

   final obj = data.first as Map<String,dynamic>;

   final url = obj['url'] as String;
   print('url');
   print(url);

   return url;

  }
}

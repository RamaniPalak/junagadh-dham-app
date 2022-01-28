
import 'package:junagadh_temple/app/data/entity/res_dailydarshan.dart';
import 'package:junagadh_temple/app/data/entity/res_darshanfilter.dart';
import 'package:junagadh_temple/app/data/entity/res_donation.dart';
import 'package:junagadh_temple/app/data/entity/res_event.dart';
import 'package:junagadh_temple/app/data/entity/res_gallery.dart';
import 'package:junagadh_temple/app/data/entity/res_homeslider.dart';
import 'package:junagadh_temple/app/data/entity/res_timing.dart';
import 'package:junagadh_temple/app/providers/base_notifier.dart';
import 'package:junagadh_temple/app/repository/home_repo.dart';
import 'package:junagadh_temple/app/utils/api_response.dart';
import 'package:junagadh_temple/app/utils/enums.dart';
import 'package:package_info_plus/package_info_plus.dart';

class HomeProvider {
  Future getSlider() async {}

  Future getGallery() async {}

  Future getDailyDarshan() async {}

  Future getEvent() async {}

  Future getDonation() async {}

  Future getDarshanFilter({String? date}) async {}

  Future getTiming() async {}
}

class HomeProviderImpl extends BaseNotifier implements HomeProvider {
  late HomeRepository repo;

  Future<PackageInfo> get packageInfo async => await PackageInfo.fromPlatform();

  HomeProviderImpl(this.repo) {
    _res = ApiResponse();
    _resGallery = ApiResponse();
    _resDailyDarshan = ApiResponse();
    _resEvent = ApiResponse();
    _resDonation = ApiResponse();
    _resDarshanFilter = ApiResponse();
    _resTime = ApiResponse();
  }

  ApiResponse<ResHomeSlider>? _res;

  ApiResponse<ResHomeSlider>? get res => _res;

  ApiResponse<ResGallery>? _resGallery;

  ApiResponse<ResGallery>? get resGallery => _resGallery;

  ApiResponse<ResDailyDarshan>? _resDailyDarshan;

  ApiResponse<ResDailyDarshan>? get resDailyDarshan => _resDailyDarshan;

  ApiResponse<List<ResEvents>>? _resEvent;

  ApiResponse<List<ResEvents>>? get resEvent => _resEvent;

  ApiResponse<ResDonation>? _resDonation;

  ApiResponse<ResDonation>? get resDonation => _resDonation;

  ApiResponse<ResDarshanFilter>? _resDarshanFilter;

  ApiResponse<ResDarshanFilter>? get resDarshanFilter => _resDarshanFilter;

  ApiResponse<ResTiming>? _resTime;

  ApiResponse<ResTiming>? get resTime => _resTime;

  @override
  Future getSlider() async {
    try {
      apiResIsLoading(_res!);

      final res = await repo.getSlider();
      print('DATA:');
      print(res.data?.imageurl);

      if (res.status != 1) {
        apiResIsFailed(_res!, res.message ?? '');
      } else {
        apiResIsSuccess(_res!, res);
      }
    } catch (e) {
      print(e);
      apiResIsFailed(_res!, e.toString());
    }
  }

  @override
  Future getGallery() async {
    try {
      apiResIsLoading(_resGallery!);

      final res = await repo.getGallery();
      print('DATA:');
      print(res.data?.imageurl);

      if (res.status != 1) {
        apiResIsFailed(_resGallery!, res.message ?? '');
      } else {
        apiResIsSuccess(_resGallery!, res);
      }
    } catch (e) {
      print(e);
      apiResIsFailed(_resGallery!, e.toString());
    }
  }

  @override
  Future getDailyDarshan() async {
    try {
      apiResIsLoading(_resDailyDarshan!);

      final res = await repo.getDailyDarshan();

      if (res.status != 1) {
        apiResIsFailed(_resDailyDarshan!, res.message ?? '');
      } else {
        apiResIsSuccess(_resDailyDarshan!, res);
      }
    } catch (e) {
      print(e);
      apiResIsFailed(_resDailyDarshan!, e.toString());
    }
  }

  @override
  Future getEvent() async {
    try {
      apiResIsLoading(_resEvent!);

      final res = await repo.getEvent();

      if (res == null) {
        apiResIsFailed(_resEvent!, 'No Data Found');
      } else {
        apiResIsSuccess(_resEvent!, res);
      }
    } catch (e) {
      print(e);
      apiResIsFailed(_resEvent!, e.toString());
    }
  }

  @override
  Future getDonation() async {
    try {
      apiResIsLoading(_resDonation!);

      final res = await repo.getDonation();

      if (res.status != 1) {
        apiResIsFailed(_resDonation!, res.message ?? '');
      } else {
        apiResIsSuccess(_resDonation!, res);
      }
    } catch (e) {
      print(e);
      apiResIsFailed(_resDonation!, e.toString());
    }
  }

  @override
  Future getDarshanFilter({String? date}) async {
    try {
      apiResIsLoading(_resDarshanFilter!);

      final res = await repo.getDrashanFilter(date: date);

      if (res.response?.status != 1) {
        apiResIsFailed(_resDarshanFilter!, res.response?.message ?? '');
      } else {
        apiResIsSuccess(_resDarshanFilter!, res);
      }
    } catch (e) {
      print(e);
      apiResIsFailed(_resDarshanFilter!, e.toString());
    }
  }

  @override
  Future getTiming() async {
   try{
     apiResIsLoading(_resTime!);


     final res = await repo.getTimimg();

     if(res.status != 1){
       apiResIsFailed(_resTime!, res.message ?? '');
     } else {
       apiResIsSuccess(_resTime!, res);
     }
   } catch (e){
     print(e);
     apiResIsFailed(_resTime!, e.toString());

   }
  }
}


import 'package:junagadh_temple/app/data/entity/home_entity.dart';
import 'package:junagadh_temple/app/data/entity/res_homeslider.dart';
import 'package:junagadh_temple/app/providers/base_notifier.dart';
import 'package:junagadh_temple/app/repository/home_repo.dart';
import 'package:junagadh_temple/app/utils/api_response.dart';
import 'package:junagadh_temple/app/utils/enums.dart';
import 'package:package_info_plus/package_info_plus.dart';



class HomeProvider {


  Future getSlider() async {}


}

class HomeProviderImpl extends BaseNotifier implements HomeProvider{

  late HomeRepository repo;

  Future<PackageInfo> get packageInfo async => await PackageInfo.fromPlatform();

  HomeProviderImpl(this.repo){
    _res = ApiResponse();
  }

  ApiResponse<ResHomeSlider>? _res;

  ApiResponse<ResHomeSlider>? get res => _res;



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

}
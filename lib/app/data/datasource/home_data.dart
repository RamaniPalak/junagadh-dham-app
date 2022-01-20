import 'package:junagadh_temple/app/data/data_service/server_configs.dart';
import 'package:junagadh_temple/app/data/data_service/web_service.dart';
import 'package:junagadh_temple/app/data/entity/res_homeslider.dart';

abstract class HomeData{

  Future<ResHomeSlider> getSlider();

}


class HomeDataImpl implements HomeData{
  @override
  Future<ResHomeSlider> getSlider() async {

    final res = await WebService.shared.getApiDIO('${ServerConfigs.homeSlider}');
    print(res);

    return ResHomeSlider.fromJson(res!);

  }

}

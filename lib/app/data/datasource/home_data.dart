import 'package:junagadh_temple/app/data/data_service/web_service.dart';
import 'package:junagadh_temple/app/data/entity/home_entity.dart';

abstract class HomeData{

  Future<Welcome> get();

}


class HomeDataImpl implements HomeData{
  @override
  Future<Welcome> get() async {

    final res = await WebService.shared.getApiDIO("https://jsonplaceholder.typicode.com/todos/1");

    return Welcome.fromJson(res);

  }
}

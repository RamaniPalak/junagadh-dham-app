import 'package:junagadh_temple/app/data/datasource/home_data.dart';
import 'package:junagadh_temple/app/providers/auth_provider.dart';
import 'package:junagadh_temple/app/providers/home_provider.dart';
import 'package:junagadh_temple/app/repository/home_repo.dart';

HomeProvider get homeProvider => HomeProvider(HomeRepository(dataSource: HomeDataImpl()));
AuthProviderImpl get authProvider => AuthProviderImpl();
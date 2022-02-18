import 'package:junagadh/app/data/datasource/home_data.dart';
import 'package:junagadh/app/providers/auth_provider.dart';
import 'package:junagadh/app/providers/home_provider.dart';
import 'package:junagadh/app/repository/home_repo.dart';

HomeProviderImpl get homeProvider => HomeProviderImpl(HomeRepository(dataSource: HomeDataImpl()));
AuthProviderImpl get authProvider => AuthProviderImpl();
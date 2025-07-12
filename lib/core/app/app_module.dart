import 'package:dio/dio.dart';
import 'package:bloc_arch/core/utils/routes/app_router.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../data_sources/utils/dio_factory.dart';
import '../data_sources/utils/network/base_network_info.dart';
import '../data_sources/utils/network/network_info.dart';
import 'package:bloc_arch/core/app/app_notification_service.dart';

@module
abstract class AppModule {
  @lazySingleton
  DioFactory get dioFactory => DioFactory();

  @preResolve
  Future<Dio> get dio => DioFactory().getDio();

  // Dio get dio => Dio(BaseOptions(baseUrl: "https://api.example.com"));

  @lazySingleton
  InternetConnectionChecker get connectionChecker =>
      InternetConnectionChecker.createInstance();

  @lazySingleton
  NetworkInfo get networkInfo => NetworkInfoImpl(connectionChecker);

  @LazySingleton()
  AppNotificationService get appNotificationService => AppNotificationService();
}

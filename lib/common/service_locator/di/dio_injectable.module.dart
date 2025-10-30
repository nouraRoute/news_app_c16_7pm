import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app_c16_7pm/common/network/network_consts.dart';

@module
abstract class DioInjectable {
  Dio get dio => Dio(BaseOptions(baseUrl: NetworkConsts.baseUrl));
}

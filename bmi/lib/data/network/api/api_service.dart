
import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/http.dart';

import '../../../const/api.dart';
import '../response_vo/login_response_vo.dart';
import '../response_vo/register_response_vo.dart';

part 'api_service.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  ///Register

  @POST(registerEndpoint)
  Future<RegisterVo> registerUser(
      @Field("name") String name,
      @Field("phone_no") String phoneNumber,
      @Field("password") String password,
      @Field("address") String address,
      @Field("seller_type_id") int buyerCategory,
      );

  ///Login

  @POST(loginEndpoint)
  Future<LoginResponseVo> login(
      @Field("phone_no") String phoneNumber,
      @Field("password") String password,
      );

}

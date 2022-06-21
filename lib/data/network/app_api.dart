
import 'package:dio/dio.dart';
import 'package:flutter_mvvm/data/responses/responses.dart';
import 'package:retrofit/http.dart';

import '../../app/constants.dart';
part 'app_api.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class AppServiceClient{

  factory AppServiceClient(Dio dio, { String baseUrl}) = _AppServiceClient;
 @POST ("/customers/login")
  Future<AuthenticationResponse> login(
  @Field("email") String email,@Field("password") String password);


}
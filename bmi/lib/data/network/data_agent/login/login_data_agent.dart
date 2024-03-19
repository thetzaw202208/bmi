

import '../../response_vo/login_response_vo.dart';

abstract class LoginDataAgent {
  Future<LoginResponseVo> doLogin(
      String phoneNumber, String password);
}

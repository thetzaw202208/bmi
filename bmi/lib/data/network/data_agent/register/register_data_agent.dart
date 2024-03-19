

import '../../response_vo/register_response_vo.dart';

abstract class RegisterDataAgent {
  Future<RegisterVo> doRegister(
      String name, String phoneNumber, String password,String address,int sellerID);
}

import 'package:project_smm/entities/types/login_model/login_model.dart';
import 'package:project_smm/shared/api/login_api/data_source/login_remote_data.dart';

class LoginRepository{

  static Future<LoginModel> login(LoginParams params) => LoginData().fetch(params);}

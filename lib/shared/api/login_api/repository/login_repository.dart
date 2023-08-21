import 'package:project_smm/entities/types/login_model/login_model.dart';
import 'package:project_smm/shared/api/login_api/data_source/login_remote_data.dart';
import 'package:project_smm/shared/constants/errors_constants/errors_constants.dart';
import 'package:project_smm/shared/lib/errors/exceptions/exceptions.dart';
import 'package:project_smm/shared/lib/errors/failure/failure.dart';
import 'package:dartz/dartz.dart';
class LoginRepository{

  static Future<Either<Failure,LoginModel>> login(LoginParams params) async{
    try{
      final remoteLoginInfo = await LoginData().fetch(params);
      return Right(remoteLoginInfo);
    }on ServerException catch (e){
      return Left(ServerFailure(message: e.message));
    }on ConnectException catch (e){
      return Left(ConnectionFailure(message: e.message));
    }on UnAuthException catch (e){
      return Left(UnAuthFailure(message: e.message));
    } catch(_){
      return Left(ServerFailure(message: Errors.criticalServerErrorTitle));
    }
  }}

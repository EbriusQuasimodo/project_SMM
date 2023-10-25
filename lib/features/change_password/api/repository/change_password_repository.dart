
import 'package:project_smm/entities/types/login_model/login_model.dart';
import 'package:project_smm/features/change_password/api/data_source/change_password_remote_data.dart';
import 'package:project_smm/shared/constants/errors_constants/errors_constants.dart';
import 'package:project_smm/shared/lib/errors/exceptions/exceptions.dart';
import 'package:project_smm/shared/lib/errors/failure/failure.dart';
import 'package:dartz/dartz.dart';
class ChangePasswordRepository{

  static Future<Either<Failure,LoginModel>> changePassword(ChangePasswordParams params) async{
    try{
      final remoteLoginInfo = await ChangePasswordData().fetch(params);
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

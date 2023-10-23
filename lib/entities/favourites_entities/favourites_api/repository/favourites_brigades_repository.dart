import 'package:project_smm/entities/favourites_entities/favourites_api/data_source/favourites_brigades_remote_data.dart';
import 'package:project_smm/entities/types/parameters_model/params_model.dart';
import 'package:project_smm/entities/types/brigade_model/brigade_model.dart';
import 'package:project_smm/shared/lib/errors/exceptions/exceptions.dart';
import 'package:project_smm/shared/lib/errors/failure/failure.dart';
import 'package:dartz/dartz.dart';
class FavouritesBrigadesRepository{

  static Future<Either<Failure,BrigadesModel>> favouritesBrigades(ParamsModel params) async{
    try{
      final remoteBrigadesInfo = await FavouritesBrigadesData().fetch(params);
      return Right(remoteBrigadesInfo);
    }on ServerException catch (e){
      return Left(ServerFailure(message: e.message));
    }on ConnectException catch (e){
      return Left(ConnectionFailure(message: e.message));
    }on UnAuthException catch (e){
      return Left(UnAuthFailure(message: e.message));
    }on LogOutException catch (e){
      return Left(LogOutFailure(message: e.message));
    }
  }}

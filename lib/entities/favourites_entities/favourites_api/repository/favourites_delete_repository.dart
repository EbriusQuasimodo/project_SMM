import 'package:project_smm/entities/favourites_entities/favourites_api/data_source/favourites_delete_remote_data.dart';
import 'package:project_smm/entities/types/basic_model.dart';
import 'package:project_smm/shared/lib/errors/exceptions/exceptions.dart';
import 'package:project_smm/shared/lib/errors/failure/failure.dart';
import 'package:dartz/dartz.dart';
class FavouritesDeleteRepository{

  static Future<Either<Failure,BasicModel>> favouritesDelete(int id, String whatDelete) async{
    try{
      final favouritesDelete = await FavouritesDeleteData().fetch(id, whatDelete);
      return Right(favouritesDelete);
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

import 'package:project_smm/entities/charts_entities/charts_api/data_source/brigades_charts_remote_data.dart';
import 'package:project_smm/entities/types/charts_model/brigades_charts_model.dart';
import 'package:project_smm/entities/types/parameters_model/params_model.dart';
import 'package:project_smm/shared/lib/errors/exceptions/exceptions.dart';
import 'package:project_smm/shared/lib/errors/failure/failure.dart';
import 'package:dartz/dartz.dart';
class BrigadesChartsRepository{

  static Future<Either<Failure,BrigadesChartsModel>> brigadesCharts(List<Parameters> params) async{
    try{
      final remoteBrigadesChartsInfo = await BrigadesChartData().fetch(params);
      return Right(remoteBrigadesChartsInfo);
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
import 'package:project_smm/entities/reports_entities/reports_api/data_source/reports_remote_data.dart';
import 'package:project_smm/entities/types/parameters_model/params_model.dart';
import 'package:project_smm/entities/types/reports_model/reports_model.dart';
import 'package:project_smm/shared/lib/errors/exceptions/exceptions.dart';
import 'package:project_smm/shared/lib/errors/failure/failure.dart';
import 'package:dartz/dartz.dart';

class ReportsRepository {
  static Future<Either<Failure, ReportsModel>> reports(
      List<Parameters> params) async {
    try {
      final remoteReportsInfo = await ReportsData().fetch(params);
      return Right(remoteReportsInfo);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } on ConnectException catch (e) {
      return Left(ConnectionFailure(message: e.message));
    } on UnAuthException catch (e) {
      return Left(UnAuthFailure(message: e.message));
    } on LogOutException catch (e) {
      return Left(LogOutFailure(message: e.message));
    }
  }
}

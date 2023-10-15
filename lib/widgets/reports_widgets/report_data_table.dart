import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_smm/entities/reports_entities/reports_bloc/reports_bloc.dart';
import 'package:project_smm/shared/constants/local_storage/local_storage_constants.dart';
import 'package:project_smm/shared/lib/local_storage/local_storage.dart';
import 'package:project_smm/shared/lib/routes/app_routes.dart';
import 'package:project_smm/widgets/reports_widgets/table_header.dart';
import 'package:project_smm/widgets/reports_widgets/table_row_item.dart';

class ReportDataTable extends StatelessWidget {
  const ReportDataTable({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReportsBloc, ReportsState>(
      builder: (context, state) {
        if (state is ReportsStartLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is ReportsLogoutState) {
          SchedulerBinding.instance.addPostFrameCallback((_) {
            Navigator.of(context).pushNamed(
              AppRoutes.auth,
            );
            LocalStorage.setString(AppConstants.TOKEN, '');
          });
        } else if (state is ReportsFailedState) {
          return Center(
            child: Text(state.message),
          );
        } else if (state is ReportsDoneState) {
          return SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 12,
                ),
                const TableHeader(),
                Wrap(
                  children: List.generate(state.report.length, (index) {
                    return TableRowItem(
                        rowReportData: state.report[index], index: index);
                  }).toList(),
                ),
                const SizedBox(
                  height: 12,
                ),
              ],
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}

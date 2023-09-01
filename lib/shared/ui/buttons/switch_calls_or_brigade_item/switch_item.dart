import 'package:flutter/material.dart' hide Badge;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_smm/entities/main_page_entities/main_page_bloc/main_page_bloc.dart';
import 'package:project_smm/shared/ui/buttons/switch_calls_or_brigade_item/button.dart';

class SwitchCallsOrBrigadeItem extends StatelessWidget {
  final int itemsLength;

  const SwitchCallsOrBrigadeItem({super.key, required this.itemsLength});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16, top: 12),
      height: 36,
      child: Row(
        children: [
          Button(
            onTap: (){context.read<MainPageBloc>().add(
              MainPageCallsStartLoadingEvent()
            );},
            itemsLength: itemsLength,
            buttonName: 'Вызовы',
            buttonIcon: 'assets/images/icons/shared/phone.svg',
          ),
          Button(
            onTap: (){context.read<MainPageBloc>().add(
                MainPageBrigadesStartLoadingEvent()
            );},
            itemsLength: itemsLength,
            buttonName: 'Бригады',
            buttonIcon: 'assets/images/icons/shared/car.svg',
          ),
        ],
      ),
    );
  }
}

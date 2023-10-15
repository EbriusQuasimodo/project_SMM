import 'package:flutter/material.dart';
import 'package:project_smm/shared/lib/theme/theme_app.dart';

class TableHeader extends StatelessWidget {
  const TableHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(width: 16),
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          height: 50,
          width: MediaQuery.of(context).size.width - 248,
          decoration: BoxDecoration(
            color: ThemeApp.elevationColorOne,
            border: Border.all(
              color: ThemeApp.dividerTwoColor,
              width: 1,
            ),
            borderRadius: const BorderRadius.only(topLeft: Radius.circular(8)),
          ),
          child: const Text(
            'Данные',
          ),
        ),
        Container(
          height: 50,
          width: 72,
          decoration: BoxDecoration(
              color: ThemeApp.elevationColorOne,
              border: Border.all(
                color: ThemeApp.dividerTwoColor,
                width: 1,
              )),
          child: const Center(child: Text('Вчера, \n   шт')),
        ),
        Column(
          children: [
            Container(
              width: 144,
              height: 30,
              decoration: BoxDecoration(
                  color: ThemeApp.elevationColorOne,
                  border: Border.all(
                    color: ThemeApp.dividerTwoColor,
                    width: 1,
                  ),
                  borderRadius:
                      const BorderRadius.only(topRight: Radius.circular(8))),
              child: const Center(child: Text('Сегодня')),
            ),
            Row(
              children: [
                Container(
                  width: 72,
                  height: 20,
                  decoration: BoxDecoration(
                      color: ThemeApp.elevationColorOne,
                      border: Border.all(
                        color: ThemeApp.dividerTwoColor,
                        width: 1,
                      )),
                  child: const Center(child: Text('шт')),
                ),
                Container(
                  width: 72,
                  height: 20,
                  decoration: BoxDecoration(
                      color: ThemeApp.elevationColorOne,
                      border: Border.all(
                        color: ThemeApp.dividerTwoColor,
                        width: 1,
                      )),
                  child: const Center(child: Text('%')),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(
          width: 16,
        ),
      ],
    );
  }
}

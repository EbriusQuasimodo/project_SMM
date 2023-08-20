import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_smm/shared/constants/local_storage/local_storage_constants.dart';
import 'package:project_smm/shared/lib/local_storage/local_storage.dart';
import 'package:project_smm/shared/lib/regions/regions.dart';

class RegionList extends StatefulWidget {
  const RegionList({super.key});

  @override
  State<RegionList> createState() => _RegionListState();
}

class _RegionListState extends State<RegionList> {
  int _selectedIndex = -1;
  Regions regions = Regions();

  @override
  void initState() {
    super.initState();
    if (LocalStorage.getString(AppConstants.REGION) != '' &&
        LocalStorage.getInt(AppConstants.REGIONINDEX) != -1) {
      setState(() {
        _selectedIndex = LocalStorage.getInt(AppConstants.REGIONINDEX);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: regions.regionsList.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            onTap: () {
              setState(() {
                _selectedIndex = index;
              });
              LocalStorage.setString(
                  AppConstants.REGION, regions.regionsList[_selectedIndex]);
              LocalStorage.setInt(AppConstants.REGIONINDEX, _selectedIndex);
            },
            title: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: SvgPicture.asset(_selectedIndex == index
                      ? 'assets/images/icons/shared/check_box_checked.svg'
                      : 'assets/images/icons/shared/check_box_unchecked.svg'),
                ),
                Text(regions.regionsList[index],
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w500)),
              ],
            ),
          );
        });
  }
}


import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_smm/entities/types/search_model/search_model.dart';
import 'package:project_smm/features/filters_change_button/change_filters_widget.dart';
import 'package:project_smm/shared/ui/buttons/primary_button/primary_button.dart';
import 'package:project_smm/widgets/search_widgets/search_form_field.dart';


class SearchPage extends StatefulWidget {
  bool isCall;

  SearchPage({super.key, required this.isCall});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _controllerNumberCall = TextEditingController();

  final TextEditingController _controllerFioCall = TextEditingController();
  final TextEditingController _controllerApartmentCall = TextEditingController();

  final TextEditingController _controllerStreetCall = TextEditingController();
  final TextEditingController _controllerHouseCall = TextEditingController();

  final TextEditingController _controllerNumberBrigade =
      TextEditingController();
  final TextEditingController _controllerProfileBrigade =
      TextEditingController();

  late final SearchModel? searchModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(64),
        child: AppBar(
          title: const Text('Поиск'),
          leading: MaterialButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child:
                SvgPicture.asset('assets/images/icons/shared/arrow_back.svg'),
          ),
          titleSpacing: 0,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 12, bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ChoiceFilterType(
                isCall: widget.isCall,
                onTapBrigadeButton: () {
                  setState(() {
                    widget.isCall = false;
                  });
                },
                onTapCallButton: () {
                  setState(() {
                    widget.isCall = true;
                  });
                },
              ),
              const SizedBox(
                height: 12,
              ),
              widget.isCall
                  ? Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          SearchFormField(
                              controller: _controllerNumberCall,
                              formName: 'Номер'),
                          SearchFormField(
                              controller: _controllerFioCall, formName: 'ФИО'),
                          SearchFormField(
                              controller: _controllerStreetCall,
                              formName: 'Улица'),
                          SearchFormField(
                              controller: _controllerHouseCall, formName: 'Дом'),
                          SearchFormField(
                              controller: _controllerApartmentCall, formName: 'Квартира'),
                        ],
                      ),
                    )
                  : Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          SearchFormField(
                              controller: _controllerNumberBrigade,
                              formName: 'Номер'),
                          SearchFormField(
                              controller: _controllerProfileBrigade,
                              formName: 'Профиль (ввод через запятую)'),
                        ],
                      ),
                    ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton:
      Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: PrimaryButton(
            onTap: () {
              List<String> profileList =
              _controllerProfileBrigade.text != ''
                  ? _controllerProfileBrigade.text.split(',')
                  : [];

              searchModel = SearchModel(
                numberCalls: _controllerNumberCall.text != ''
                    ? int.parse(_controllerNumberCall.text)
                    : null,
                numberBrigades: _controllerNumberBrigade.text,
                fio: _controllerFioCall.text,
                street: _controllerStreetCall.text,
                house: _controllerHouseCall.text,
                apartment: _controllerApartmentCall.text,
                profile: profileList,
              );
              Navigator.of(context).pop(searchModel);
            },
            buttonName: 'Найти'),
      ),
    );
  }
}

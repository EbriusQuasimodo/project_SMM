
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_smm/entities/types/search_model/search_model.dart';
import 'package:project_smm/features/filters_change_button/change_filters_widget.dart';
import 'package:project_smm/shared/lib/theme/theme_app.dart';
import 'package:project_smm/shared/ui/buttons/primary_button/primary_button.dart';
import 'package:project_smm/widgets/search_widgets/search_form_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SearchPage extends StatefulWidget {
  bool isCall;
  final SearchModel? searchModel;
  final VoidCallback onClearCallsSearchModel;
  final VoidCallback onClearBrigadesSearchModel;


  SearchPage({super.key, required this.isCall, required this.searchModel,required this.onClearCallsSearchModel, required this.onClearBrigadesSearchModel});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _controllerNumberCall = TextEditingController(text: "${widget.searchModel?.numberCalls == 0 ?'' :widget.searchModel?.numberCalls ?? ''}");

  late final TextEditingController _controllerFioCall = TextEditingController(text: widget.searchModel?.fio ?? '');
  late final TextEditingController _controllerApartmentCall = TextEditingController( text: widget.searchModel?.apartment ?? '');

  late final TextEditingController _controllerStreetCall = TextEditingController( text: widget.searchModel?.street ?? '');
  late final TextEditingController _controllerHouseCall = TextEditingController( text: widget.searchModel?.house ?? '');

  late final TextEditingController _controllerNumberBrigade =
      TextEditingController(text: widget.searchModel?.numberBrigades ?? '');
  late final TextEditingController _controllerProfileBrigade =
      TextEditingController(text: widget.searchModel?.profile.map((i) => i.toString()).join(","));

  late final SearchModel? searchModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(64),
        child: AppBar(
          title: Text(AppLocalizations.of(context)!.searchPage),
          leading: MaterialButton(
            onPressed: () {
              Navigator.of(context).pop(widget.searchModel);
            },
            child:
                SvgPicture.asset('assets/images/icons/shared/arrow_back.svg'),
          ),
          actions: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: MaterialButton(
                onPressed: () {
                  widget.isCall
                      ? setState(() {
                        widget.onClearCallsSearchModel();
                  _controllerApartmentCall.clear();
                  _controllerHouseCall.clear();
                  _controllerStreetCall.clear();
                  _controllerFioCall.clear();
                  _controllerNumberCall.clear();
                  })
                      : setState(() {
                        widget.onClearBrigadesSearchModel();
                   _controllerNumberBrigade.clear();
                   _controllerProfileBrigade.clear();
                  });
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side:
                  const BorderSide(color: ThemeApp.primaryColor, width: 2),
                ),
                child: const Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: Text(
                    'сброс',
                    style: TextStyle(color: ThemeApp.primaryColor),
                  ),
                ),
              ),
            )
          ],
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
                              formName: AppLocalizations.of(context)!.number),
                          SearchFormField(
                              controller: _controllerFioCall, formName: 'ФИО'),
                          SearchFormField(
                              controller: _controllerStreetCall,
                              formName: AppLocalizations.of(context)!.street),
                          SearchFormField(
                              controller: _controllerHouseCall, formName: AppLocalizations.of(context)!.house),
                          SearchFormField(
                              controller: _controllerApartmentCall, formName: AppLocalizations.of(context)!.apartment),
                        ],
                      ),
                    )
                  : Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          SearchFormField(
                              controller: _controllerNumberBrigade,
                              formName: AppLocalizations.of(context)!.number),
                          SearchFormField(
                              controller: _controllerProfileBrigade,
                              formName: AppLocalizations.of(context)!.profile),
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
                    : 0,
                numberBrigades: _controllerNumberBrigade.text,
                fio: _controllerFioCall.text,
                street: _controllerStreetCall.text,
                house: _controllerHouseCall.text,
                apartment: _controllerApartmentCall.text,
                profile: profileList.map(int.parse).toList(),
              );
              Navigator.of(context).pop(searchModel);
            },
            buttonName: AppLocalizations.of(context)!.search),
      ),
    );
  }
}

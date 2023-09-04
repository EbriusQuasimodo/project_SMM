import 'dart:convert';

import 'package:project_smm/shared/lib/local_storage/local_storage.dart';
import 'package:project_smm/shared/ui/form_item/form_item_select_dictionary/api/initialize_dictionary.dart';
import 'package:project_smm/shared/ui/form_item/form_item_select_dictionary/lib/dictionary_enum.dart';
import 'package:project_smm/shared/ui/form_item/form_item_select_dictionary/types/dictionary_model.dart';

class GetDictionary{
  Future<DictionaryModel> fetch(Dictionary dictionary) async {
   try{
     final DictionaryModel body =
     DictionaryModel.fromJson(jsonDecode(LocalStorage.getString(dictionary.name)));
     return body;
   }catch(e){
     final re = InitializeDictionary().fetch(dictionary);
     return re;
   }
  }
}
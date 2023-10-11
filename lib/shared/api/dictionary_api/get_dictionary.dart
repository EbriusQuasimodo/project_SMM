import 'dart:convert';

import 'package:project_smm/shared/lib/local_storage/local_storage.dart';
import 'package:project_smm/shared/lib/dictionary_names/dictionary_enum.dart';
import 'package:project_smm/shared/types/dictionary/dictionary_model.dart';

import 'initialize_dictionary.dart';

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
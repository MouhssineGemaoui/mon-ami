import 'dart:io';
import 'package:monami/core/class/curd.dart';
import 'package:monami/app_link.dart';

class EditPageProfileTeachersData {
  Crud crud;
  EditPageProfileTeachersData(this.crud);
  

  updateDataprof( Map data, [File? file] ) async {
    
    var response ;
    if(file == null){
      response = await crud.postData(AppLink.editdataprof, data );
    }else {
    response =  await crud.addRequestWithImageOne(AppLink.editdataprof, data ,file);
    }
   return response.fold((l) => l, (r) => r) ;
  } 
}
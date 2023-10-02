import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:national_id/maps/governement_map.dart';

part 'national_id_state.dart';

class NationalIdCubit extends Cubit<NationalIdState> {
  NationalIdCubit() : super(NationalIdInitial());
  static NationalIdCubit get(context)=>BlocProvider.of(context);

  TextEditingController nameController=TextEditingController();
  TextEditingController nationalIdController=TextEditingController();

  String nameValidate()
  {
    emit(nameValidateState());

    if(nameController.text.contains(RegExp(r'[0-9]')))
    {
      return 'name field shoud not contain numbers';
    }
    else
    if(nameController.text.isEmpty ||nameController.text==null )
  return 'name field is empty';
    else
       return 'name field is correct';

  }

  String nationalIdISCorrect()
  {
    emit(nationalIdISCorrectState());
    if(nationalIdController.text==null || nationalIdController.text.isEmpty) {
      return 'national id field is empty';
    }
    else if(nationalIdController.text.contains(RegExp(r'[A-Za-z]')))
      {
        return 'national id should not have words';
      }
    else if( nationalIdController.text.length!=14)
    {
      return 'the length of national id is not 14';
    }
    else if(int.parse(nationalIdController.text[0])!=2 && int.parse(nationalIdController.text[0])!=3)
    {
      print(nationalIdController.text[0]);
      return 'the first dight number is wrong';
    }
   else if(nationalIdController.text[13] == 0)
    {
      return 'the national id is fake';
    }
    else
    {
      return 'the national id is correct';
    }
  }
  String? errorMessageTitle()
  {
    if(nameValidate()!='name field is correct')
      {
        return nameValidate();
      }
    else if(nationalIdISCorrect()!='the national id is correct')
      {
        return nationalIdISCorrect();
      }
    else
      {
        return 'the national id is wrong';
      }

  }
  String getBirthDate()
  {
    emit(getBirthDateState());
    if(nationalIdController.text[0]=='2') {
      return '19${nationalIdController.text[1]}${nationalIdController.text[2]}/'
          '${nationalIdController.text[3]}${nationalIdController.text[4]}/'
          '${nationalIdController.text[5]}${nationalIdController.text[6]}';
    } else {
      return
      '20${nationalIdController.text[1]}${nationalIdController.text[2]}/'
          '${nationalIdController.text[3]}${nationalIdController.text[4]}/'
          '${nationalIdController.text[5]}${nationalIdController.text[6]}';
    }
  }

  String? getGovernement()
  {
    emit(getGovernementState());
    String mapKey=nationalIdController.text[7]+nationalIdController.text[8];
    return governement[int.parse(mapKey)];
  }

  String getGender()
  {
    emit(getGenderState());
    return int.parse(nationalIdController.text[12])%2==0?'انثي':'ذكر';
  }





}

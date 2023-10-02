import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:national_id/cubits/national_id_cubit.dart';
import 'package:national_id/cubits/national_id_cubit.dart';


class TextFieldBlock extends StatelessWidget {
  final String lable;
  final bool whichController;

  TextFieldBlock({required this.lable, required this.whichController});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NationalIdCubit, NationalIdState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit=NationalIdCubit.get(context);
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 30),
          alignment: Alignment.center,
          child: TextFormField(
            controller: whichController ?cubit.nameController:cubit.nationalIdController,
            cursorColor: Colors.brown,
            decoration: InputDecoration(
              counterStyle: TextStyle(color: Colors.red),
              label: Text(lable,
                style: const TextStyle(color: Colors.brown),
              ),
              border: UnderlineInputBorder(
                borderSide: const BorderSide(color: Colors.brown),
                borderRadius: BorderRadius.circular(30),
              ),
              filled: true,
              fillColor: Colors.white70,
              contentPadding: const EdgeInsets.symmetric(
                  horizontal: 18, vertical: 10),

            ),

            /*onSubmitted:(String data)
        {
          if(flage==true)
          {
            listNationalID=NationalIDAnalysis(data);
            if(bool.parse(listNationalID[0])==false) {
              listNationalID = [];
              print(listNationalID);
            }
          }
          else Name=data;



        },*/
            /*onChanged: (String data){
          if(flage==true)
          {
            listNationalID=NationalIDAnalysis(data);
            if(bool.parse(listNationalID[0])==false) {
              listNationalID = [];
              print(listNationalID);
            }
          }
          else Name=data;
        },*/
          ),
        );
      },
    );
  }
}

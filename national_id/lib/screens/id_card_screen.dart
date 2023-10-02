import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:national_id/constants/constants.dart';
import 'package:national_id/cubits/national_id_cubit.dart';
import 'package:national_id/cubits/national_id_cubit.dart';

import '../blocks/information_row_block.dart';


class IdCardScreen extends StatelessWidget {
  const IdCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NationalIdCubit, NationalIdState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit=NationalIdCubit.get(context);
        return Scaffold(
          backgroundColor: Color(0xffdff2f9),

          resizeToAvoidBottomInset: false,
          body: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                      filterQuality: FilterQuality.high,
                      image: AssetImage(kIdCardImage),
                    )),
              ),
              Positioned(
                right: 30,
                top: 280,
                child: SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      rowInformations(type: ':الاسم', data: cubit.nameController.text,),
                      rowInformations(type: ':تاريخ الميلاد',
                          data: cubit.getBirthDate()),
                      rowInformations(type: ':المحافظه', data: cubit.getGovernement()!,),
                      rowInformations(type: ':النوع', data:cubit.getGender() ),


                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

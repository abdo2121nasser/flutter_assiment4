import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:national_id/blocks/button_block.dart';
import 'package:national_id/blocks/text_field_block.dart';
import 'package:national_id/constants/constants.dart';
import 'package:national_id/cubits/national_id_cubit.dart';
import 'package:national_id/cubits/national_id_cubit.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NationalIdCubit, NationalIdState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit=NationalIdCubit.get(context);
        return Scaffold(
          body: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        filterQuality: FilterQuality.high,
                        image: AssetImage(kHomeImage),
                        fit: BoxFit.fill)),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 150,),
                  TextFieldBlock(lable:'Name',whichController: true),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFieldBlock(lable: 'National Id',whichController: false),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ButtonBlock(doAction: true),
                        ButtonBlock(doAction: false,)
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        );
      },
    );
  }
}

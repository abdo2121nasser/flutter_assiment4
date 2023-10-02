import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:national_id/cubits/national_id_cubit.dart';
import 'package:national_id/screens/id_card_screen.dart';


class ButtonBlock extends StatelessWidget {
  final bool doAction;

  ButtonBlock({required this.doAction});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NationalIdCubit, NationalIdState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit=NationalIdCubit.get(context);
        return ElevatedButton(
          onPressed: ()
        {
             if (cubit.nationalIdISCorrect() != 'the national id is correct' ||
                cubit.nameValidate() != 'name field is correct' ||
            cubit.getGovernement()==null)
            {
              AwesomeDialog(
                  context: context,
                  dialogType: DialogType.error,
                  title: cubit.errorMessageTitle(),
                  alignment: Alignment.center,
                  btnOkOnPress: () {}
              ).show();
            }
             else {
               if (doAction) {
                 AwesomeDialog(
                     context: context,
                     dialogType: DialogType.info,
                     title: 'National ID Information',
                     desc:
                     'Your Name is ${cubit.nameController.text}\n'
                         'your birth date ${cubit.getBirthDate()}\n'
                         '${cubit.getGovernement()}\n'
                         'your gender is ${cubit.getGender()}',
                     alignment: Alignment.center,
                     btnOkOnPress: () {}
                 ).show();
               }
               else
                 {
                 Navigator.of(context).push(
                     MaterialPageRoute(
                       builder: (context) => const IdCardScreen(),
                     )
                 );
             }
             }




          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            side: const BorderSide(color: const Color(0xff3b5a5c), width: 5),
          ),
          child: const Text('Analyse user data', style: TextStyle(
              fontSize: 15, color: Color(0xff3b5a5c)
          ),),

        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:national_id/constants/constants.dart';


class IdCardScreen extends StatelessWidget {
  const IdCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              /*    rowInformations(type: 'الاسم',data: Name,),
                  rowInformations(type: 'تاريخ الميلاد',data:'${listNationalID[1]+listNationalID[2]}/${listNationalID[3]}/${listNationalID[4]}'),
                  rowInformations(type: 'المحافظه',data: getCountry(),),
                  rowInformations(type: 'النوع',data:  listNationalID[7]=='Male'?'ذكر':'انثي',),
*/



                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

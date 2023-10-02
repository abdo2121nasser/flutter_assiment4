import 'package:flutter/material.dart';


class rowInformations extends StatelessWidget {
  const rowInformations({required this.type,required this.data,});
  final String data,type;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('$data',style: TextStyle(fontSize: 17,color: Colors.white,),),

          SizedBox(width: 10,),
          Text('$type',style: TextStyle(fontSize: 18,color: Colors.white,),),
        ],
      ),
    );
  }
}
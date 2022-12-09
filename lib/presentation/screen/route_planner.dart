import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class RoutePlanner extends StatefulWidget {
  const RoutePlanner({Key? key}) : super(key: key);

  @override
  State<RoutePlanner> createState() => _RoutePlannerState();
}

class _RoutePlannerState extends State<RoutePlanner> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Padding(
        padding: const EdgeInsets.only(top:90.0,left: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
           children: [
             Container(width: double.infinity,),
            Row(
              children: [
                Text("Rota Planlayıcı",style: TextStyle(fontSize: 8.w,fontWeight: FontWeight.w500),),
              ],
            ),
            SizedBox(height: 74,),
             Container(
                 width: 88,
                 height: 88,
                 child: Image.asset("assets/sad_face.png",)),
             SizedBox(height: 40,),
             Text("Şarj istasyonlarındaki teknik bir problemden dolayı RotaPlanlayıcı şuan hizmet verememektedir.",style: TextStyle(fontSize: 4.w,)),
             SizedBox(height: 33,),
             Row(
               children: [
                 Text("Hizmete döneceği tarih",style: TextStyle(fontSize: 6.w,fontWeight: FontWeight.w500) ),
               ],
             ),
             SizedBox(height: 33,),
             Row(
               children: [
                 Text("17/11/2022",style: TextStyle(fontSize: 6.w,) ),
               ],
             ),


           ],
        ),
      )
    );
  }
}

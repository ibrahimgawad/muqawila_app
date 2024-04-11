import 'package:flutter/material.dart';
import 'package:flutter_application_1/constant.dart';
import 'package:flutter_application_1/moreUsers/supliers/view_all_suppliers_more.dart';

class FirstSuppliersMore extends StatelessWidget {
  const FirstSuppliersMore({super.key});

  @override
   Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(

        // backgroundColor: const Color.fromARGB(255, 218, 217, 215),
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
           backgroundColor: kPrimaryColor,
          title: const Text(' الموارد',style: TextStyle(color: Colors.white),),
        ),
        body: Column(
          children: [
          const  SizedBox(height: 50,),
            Center(
              child: Image.asset(
                'assets/img/birck.jpg',
                width: 300,
                height: 300,
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width:MediaQuery.of(context).size.width/1.5,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const ViewAllSuppliersMore();
                  }));
                },
                child: const Text('رؤية الموارد',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
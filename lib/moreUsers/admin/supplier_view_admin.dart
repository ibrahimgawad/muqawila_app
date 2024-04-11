import 'package:flutter/material.dart';
import 'package:flutter_application_1/constant.dart';
import 'package:flutter_application_1/moreUsers/constructor/user_data_provider_contractor_register.dart';
import 'package:provider/provider.dart';

class SupplierViewAdmin extends StatelessWidget {
  const SupplierViewAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
           backgroundColor: kPrimaryColor,
          title: const Text('صفحة الموارد',style: TextStyle(color: Colors.white),),
        ),
        body: Consumer<UserDataProviderContractorRegister>(
          builder: (context, userDataProvider, child) {
            List<UserDataContractorRegister> usersData =
                userDataProvider.usersData;
                if(usersData.isEmpty){
                  return const Center(child: Text("لا يوجد موارد", style: TextStyle(fontSize: 20),),);
                }
            return ListView.builder(
              itemCount: usersData.length,
              itemBuilder: (context, index) {
                UserDataContractorRegister userData = usersData[index];
                return Card(
                  elevation: 4,
                  color: const Color.fromARGB(255, 249, 252, 253),
                  margin: const EdgeInsets.symmetric(horizontal: 25,vertical: 15),
                  child: Padding(
                    padding: const EdgeInsets.all(0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          userData.image!,
                          width: double.infinity,
                          height: 150.0,
                          fit: BoxFit.cover,
                        ),
                        ListTile(
                          leading: const Icon(
                            Icons.person,
                            color: Colors.deepPurple,
                            size: 30,
                          ),
                          title: Text(
                            userData.nameOrder ?? 'بيانات غير متوفرة',
                            style: const TextStyle(fontSize: 18),
                          ),
                        ),
                        ListTile(
                          leading: const Icon(
                            Icons.location_on,
                            color: Colors.deepPurple,
                            size: 30,
                          ),
                          title: Text(
                            userData.location ?? 'بيانات غير متوفرة',
                            style: const TextStyle(fontSize: 18),
                          ),
                        ),
                        ListTile(
                          leading: const Icon(
                            Icons.price_change_outlined,
                            color: Colors.deepPurple,
                            size: 30,
                          ),
                          title: Text(
                            "${(userData.total!) + 2} " ?? 'بيانات غير متوفرة',
                            style: const TextStyle(fontSize: 18),
                          ),
                          
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              onPressed: () =>
                                  userDataProvider.removeUser(userData),
                              icon: const Icon(Icons.delete,
                                  size: 30, color: Colors.red),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
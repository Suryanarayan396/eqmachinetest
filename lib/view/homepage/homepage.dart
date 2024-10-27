import 'package:eqsoftmachinetest/constants/colorconst.dart';
import 'package:eqsoftmachinetest/controller/bottomsheet_controller.dart';
import 'package:eqsoftmachinetest/controller/homepage_controller.dart';
import 'package:eqsoftmachinetest/view/signin/signin.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        await context.read<HomepageController>().fetchAddresses();
      }, //to fetch the data
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colorconst.darkblue,
          title: Row(
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                        image: AssetImage("assets/images/eq.jpeg"))),
              ),
              SizedBox(
                width: 15,
              ),
              Text(
                "Our Customers",
                style: TextStyle(color: Colorconst.textwhite, fontSize: 30),
              ),
            ],
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Signin(),
                    ),
                    (route) => false,
                  );
                },
                icon: Icon(
                  Icons.power_settings_new_rounded,
                  size: 30,
                  color: Colorconst.darkred,
                )),
            SizedBox(
              width: 20,
            )
          ],
        ),
        body: Consumer<HomepageController>(builder: (context, homeprov, child) {
          if (homeprov.addresses.isEmpty) {
            return Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
              itemCount: homeprov.addresses.length,
              itemBuilder: (context, index) {
                final person = homeprov.addresses[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      ListTile(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        tileColor: Colorconst.darkblue,
                        title: Text(
                          person.name ?? "",
                          style: TextStyle(
                              color: Colorconst.textwhite, fontSize: 35),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              person.phone ?? "",
                              style: TextStyle(
                                  color: Colorconst.textwhite, fontSize: 20),
                            ),
                            Text(
                              person.email ?? "",
                              style: TextStyle(
                                  color: Colorconst.textwhite, fontSize: 20),
                            ),
                            Text(
                              (person.address ?? " ",).toString(),
                              style: TextStyle(
                                  color: Colorconst.textwhite, fontSize: 20),
                            )
                          ],
                        ),
                        trailing: Icon(
                          Icons.close_rounded,
                          color: Colorconst.textwhite,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      )
                    ],
                  ),
                );
              });
        }),
        //floatingaction button wrapped with consumer of bottomsheet controller
        floatingActionButton: Consumer<BottomsheetController>(
            builder: (context, prov, child) => FloatingActionButton(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.person_2_rounded,
                        color: Colorconst.textwhite,
                        size: 20,
                      ),
                      Text(
                        "ADD+",
                        style: TextStyle(
                            color: Colorconst.textwhite, fontSize: 12),
                      )
                    ],
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(70)),
                  backgroundColor: Colorconst.maincolor,
                  onPressed: () {
                    context.read<BottomsheetController>();
                    prov.namecontroller.clear();
                    prov.phonecontroller.clear();
                    prov.emailcontroller.clear();
                    //while opening custombottomsheet as fresh then previously added details cleared

                    _custombottomsheet(context, prov);
                  },
                )));
  }

  Future<dynamic> _custombottomsheet(
      BuildContext context, BottomsheetController prov) {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => Padding(
          padding: EdgeInsets.all(20),
          child: StatefulBuilder(
            builder: (context, setState) {
              return SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context)
                          .viewInsets
                          .bottom), //if keyboard opened,you can adjust the layout dynamically to avoid having the keyboard obscure your inputs.

                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        controller: prov.namecontroller,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colorconst.darkblue)),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colorconst.darkblue)),
                            labelText: 'Name',
                            labelStyle: TextStyle(color: Colorconst.darkblue),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: prov.phonecontroller,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colorconst.darkblue)),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colorconst.darkblue)),
                            labelText: 'Phone',
                            labelStyle: TextStyle(color: Colorconst.darkblue),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: prov.emailcontroller,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colorconst.darkblue)),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colorconst.darkblue)),
                            labelText: 'Email',
                            labelStyle: TextStyle(color: Colorconst.darkblue),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: prov.addressControllers.length,
                        itemBuilder: (context, index) => Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                maxLines: 3,
                                controller: prov.addressControllers[index],
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colorconst.darkblue)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colorconst.darkblue)),
                                    labelText: 'Address',
                                    labelStyle:
                                        TextStyle(color: Colorconst.darkblue),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    prov.removeAddressController(
                                        index); //to show realtime statechange setstate used here,can remove adress feild added
                                  });
                                },
                                icon: Icon(
                                  Icons.remove_circle,
                                  size: 35,
                                  color: Colorconst.darkred,
                                ))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Spacer(),
                          Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colorconst.darkblue),
                                child: TextButton(
                                    onPressed: () {
                                      setState(() {
                                        prov.addAddressController(); //to show realtime statechange setstate used here,new adress feild added
                                      });
                                    },
                                    child: Text(
                                      "Add new address",
                                      style: TextStyle(
                                          color: Colorconst.textwhite),
                                    )),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colorconst.darkblue),
                                child: TextButton(
                                    onPressed: () async {
                                      final HomeController =
                                          context.read<HomepageController>();

                                      try {
                                        await HomeController.addNewCustomer(
                                          name: prov.namecontroller.text,
                                          phone: prov.phonecontroller.text,
                                          email: prov.emailcontroller.text,
                                          addresses: prov.addressControllers
                                              .map((controller) =>
                                                  controller.text)
                                              .toList(),
                                        );
                                      } catch (e) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                              content: Text(
                                                  'Failed to add customer')),
                                        );
                                      } // Clear the controllers
                                      prov.namecontroller.clear();
                                      prov.phonecontroller.clear();
                                      prov.emailcontroller.clear();
                                      prov.addressControllers.forEach(
                                          (controller) => controller.clear());
                                      // Pop the bottom sheet
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      "Add new customer",
                                      style: TextStyle(
                                          color: Colorconst.textwhite),
                                    )),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          )),
    );
  }
}

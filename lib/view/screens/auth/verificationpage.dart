import 'package:flutter/material.dart';
import 'package:shop_app/utils/theme.dart';

class VeriPage extends StatefulWidget {
  VeriPage({ Key? key }) : super(key: key);

  @override
  State<VeriPage> createState() => _VeriPageState();
}

class _VeriPageState extends State<VeriPage> {
  final TextEditingController _boxController1 = TextEditingController();

  final TextEditingController _boxController2 = TextEditingController();

  final TextEditingController _boxController3 = TextEditingController();

  final TextEditingController _boxController4 = TextEditingController();

  late FocusNode _selectedFocus;

  final _boxFocus1 = FocusNode();

  final _boxFocus2 = FocusNode();

  final _boxFocus3 = FocusNode();

  final _boxFocus4 = FocusNode();

  late List<FocusNode> focusNodes;
  late List<TextEditingController> controllersList;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controllersList = [
    _boxController1,
    _boxController2,
    _boxController3,
    _boxController4,
  ];

  focusNodes = [
        _boxFocus1,
        _boxFocus2,
        _boxFocus3,
        _boxFocus4,
      ];
  }
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: whiteColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 30,bottom: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                      Text('Outletship',
                        style: TextStyle(
                          color: blackColor,
                          fontSize: 25,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(width: 10,),
                      Padding(
                      padding: EdgeInsets.all(2.0),
                      child: Icon(Icons.shopping_cart_rounded,size: 45,color:mainColor,),
                    ),
                     
                  ],
                ),
                SizedBox(height: h*0.05,),
                const Text('يرجى التحقق من هاتفك الخليوي',
                    style: TextStyle(
                      color: blackColor,
                      fontSize: 23,
                      fontWeight: FontWeight.normal
                    ),
                  ),
                SizedBox(height: h*0.07,),
                Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  width: double.infinity,
                  height: 180,
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: whiteColor),
                    boxShadow:const [
                       BoxShadow(
                      color: greyColor,
                      offset: Offset(
                        0,
                        0,
                      ),
                      blurRadius: 7.0,
                      spreadRadius: 1.0,
                    )
                    ]
                      ),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                        child: Column(
                          children: [
                            const Text('الرجاء إدخال رمز التحقق المكون من 4 أرقام و الذي تم إرساله إلى رقم هاتفك الخليوي',
                            maxLines:2,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: blackColor,
                              fontSize: 15,
                              fontWeight: FontWeight.normal
                            ),
                          ),
                          SizedBox(height: h*0.03,),
                          const Text('8888888888888',
                            maxLines:2,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: blackColor,
                              fontSize: 15,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          SizedBox(height: h*0.03,),
                          TextButton(
                              onPressed: (){
                                
                              },
                              child: const Text(
                                'تغيير رقم الهاتف',
                                style: TextStyle(
                                color: mainColor,
                                fontSize: 15,
                                fontWeight: FontWeight.normal
                              ),
                                ),
                            ),
                          ],
                        ),
                      ),
                    ),
                ),
              ),
              SizedBox(height: h*0.07,), 
              const Text('الرجاء إدخال الرمز المكون من 4 أرقام',
                      maxLines:2,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: blackColor,
                        fontSize: 15,
                        fontWeight: FontWeight.normal
                      ),
                    ),
                SizedBox(height: h*0.23,), 
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate(
                              4,
                              (index) => Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 25,
                  ),
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SizedBox(
                    width: 15,
                    height: 25,
                    child: TextField(
                      controller: controllersList[index],
                      focusNode: focusNodes[index],
                      keyboardType: TextInputType.number,
                      cursorColor: mainColor,
                      decoration: const InputDecoration(
                        filled: false,
                        enabledBorder: UnderlineInputBorder(      
                        borderSide: BorderSide(color: blackColor),   
                      ),  
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: blackColor),
                      ),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: blackColor),
                      ),
                    ),
                      autofocus: true,
                      onChanged: (val) {
                        _selectedFocus = focusNodes[index + 1];
                        FocusScope.of(context).requestFocus(_selectedFocus);
                      },
                  
                    ),
                  ),
                              ),
                            ),
                            ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
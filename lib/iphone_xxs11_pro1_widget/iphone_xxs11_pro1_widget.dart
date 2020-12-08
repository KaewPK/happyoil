/*
*  iphone_xxs11_pro1_widget.dart
*  happyOil
*
*  Created by [Author].
*  Copyright © 2018 [Company]. All rights reserved.
    */

import 'dart:developer';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:flutter/material.dart';
import 'package:happy_oil/values/values.dart';
import 'package:happy_oil/iphone_xxs11_pro1_widget/detail_error_page.dart';

class IPhoneXXS11Pro1Widget extends StatefulWidget {
   @override
  State createState() => new IPhoneXXS11Pro1WidgetState();
}

class IPhoneXXS11Pro1WidgetState extends State<IPhoneXXS11Pro1Widget> {
  var _price = 0.00, _capacity = 0.00, _sumPrice = 0.00;
  void restApiData() async {
    // API 
    var url = 'http://wealthvending.co.th:9027/api/AccountInvoice/GetDataInvoice'; // ไม่สามารถใช้ Localhost ได้
    // Await the http get response, then decode the json-formatted response.
     http.get(url).then((response) {
      if (response.statusCode == 200) {
        var jsonResponse = convert.jsonDecode(response.body);
        var price = double.parse(jsonResponse['data']["coin"]) + double.parse(jsonResponse['data']["bankNote"]);
        var capacity = double.parse(jsonResponse['data']["litre_Sold"]);
        var sumPrice = jsonResponse['data']["totalBalance"];
          _price = price;
          _capacity = capacity;
          _sumPrice = sumPrice;
          setState(() {});
          //log('Number of books about http: $itemCount.');
        } else {
          log('Request failed with status: ${response.statusCode}.');
        }
      },onError: (error)=>log(error.toString())
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Positioned(
              left: 0,
              top: -8,
              right: -19,
              bottom: -8,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.ternaryBackground,
                      ),
                      child: Container(),
                    ),
                  ),
                  Positioned(
                    height: 40,
                    right: MediaQuery.of(context).size.height * 0.05,
                    top: MediaQuery.of(context).size.height * 0.05,
                    child: FlatButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => DetailErrorPage()),
                        );
                      },
                      color: AppColors.secondaryBackground,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(33.5)),
                      ),
                      textColor: Color.fromARGB(255, 13, 36, 51),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "Detail ->",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: AppColors.accentText,
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: MediaQuery.of(context).size.width * 0.2, // เปลี่ยนจาก pixel เป็น percen
                    right: 0, 
                    bottom: MediaQuery.of(context).size.height * 0.02,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.60,
                            height: MediaQuery.of(context).size.width * 0.45,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Positioned(
                                  left: 0,
                                  right: 0,
                                  child: Opacity(
                                    opacity: 0.75,
                                    child: Image.asset(
                                      "assets/images/rectangle-2.png",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 13,
                                  top: 13,
                                  right: 18,
                                  child: Image.asset(
                                    "assets/images/group-6.png",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            width: 285,
                            height: 26,
                            margin: EdgeInsets.only(top: 14),
                            child: Image.asset(
                              "assets/images/group-9.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                         Padding(padding: EdgeInsets.all(10),),
                         Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 286,
                      height: 123,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Positioned(
                            child: Container(
                              width: 286,
                              height: 123,
                              decoration: BoxDecoration(
                                color: AppColors.primaryBackground,
                                borderRadius: Radii.k47pxRadius,
                              ),
                              child: Container(),
                            ),
                          ),
                          Positioned(
                            top: 8,
                            right: 79,
                            child: Text(
                              "จำนวนเงิน",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: AppColors.secondaryText,
                                fontFamily: "DIN Alternate",
                                fontWeight: FontWeight.w700,
                                fontSize: 28,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 35,
                            child: Text(
                              "$_sumPrice",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: AppColors.secondaryText,
                                fontFamily: "DIN Alternate",
                                fontWeight: FontWeight.w700,
                                fontSize: 65,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                        Spacer(),
                        Container(
                          height: MediaQuery.of(context).size.width * 0.4,
                          margin: EdgeInsets.only(left:10,right: 10,bottom: 0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: Container(
                                  width: MediaQuery.of(context).size.width * 0.45,
                                  height: MediaQuery.of(context).size.width * 0.5,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "จำนวน(ลิตร)",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          color: AppColors.primaryText,
                                          fontFamily: "DIN Alternate",
                                          fontWeight: FontWeight.w700,
                                          fontSize: 28,
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 5, top: 3),
                                        child: Text(
                                          "$_capacity",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: AppColors.primaryText,
                                            fontFamily: "DIN Alternate",
                                            fontWeight: FontWeight.w700,
                                            fontSize: 55,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topCenter,
                                child: Container(
                                  width: 10,
                                  height: 107,
                                  decoration: BoxDecoration(
                                    color: AppColors.primaryElement,
                                  ),
                                  child: Container(),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: Container(
                                  width: MediaQuery.of(context).size.width * 0.45,
                                  height: MediaQuery.of(context).size.width * 0.5,
                                  margin: EdgeInsets.only(bottom: 7),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        "ราคา(บาท)",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          color: AppColors.primaryText,
                                          fontFamily: "DIN Alternate",
                                          fontWeight: FontWeight.w700,
                                          fontSize: 28,
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 3, right: 5),
                                        //เปลี่ยน Text เป็น TextField
                                        child: Text(
                                          "$_price",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: AppColors.primaryText,
                                            fontFamily: "DIN Alternate",
                                            fontWeight: FontWeight.w700,
                                            fontSize: 55,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 40,
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              Positioned(
                               // right: 48,
                                bottom: 0,
                                child: FlatButton(
                                  onPressed: restApiData,
                                  color: AppColors.secondaryBackground,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(33.5)),
                                  ),
                                  textColor: Color.fromARGB(255, 13, 36, 51),
                                  padding: EdgeInsets.all(6.5),
                                  child: Text(
                                    "RESET",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: AppColors.accentText,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                              /*Positioned(   เงาด้านหลังปุ่มหากมีทำให้กดปุ่มยากขึ้นเพราะไม่สามารถกดส่วนที่เงาได้
                                height: 100,
                                bottom: -50,
                                child: Opacity(
                                  opacity: 0.4,
                                  child: Image.asset(
                                    "assets/images/group-10.png",
                                    fit: BoxFit.none,
                                  ),
                                ),
                              ),*/
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),  
          ],
        ),
      ),
    );
  }
}
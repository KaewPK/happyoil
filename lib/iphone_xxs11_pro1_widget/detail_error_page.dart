import 'package:flutter/material.dart';
import 'package:happy_oil/iphone_xxs11_pro1_widget/iphone_xxs11_pro1_widget.dart';
import 'package:happy_oil/values/values.dart';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class DetailErrorPage extends StatefulWidget {
   @override
  State createState() => new DetailErrorPageState();
}

class DetailErrorPageState extends State<DetailErrorPage> {
  var _sumCoin = 0.00, _sumBankNote = 0.00, _oilRemaining = 0.00, _costPerLitre = 0.00, _sum = 0.00, _beforeSum = 0.00, _error = 0, _coin = 0.00, _bankNote = 0.00, _litreSold = 0.00,
     _fuelInput = 0.00, _direction = 0.00, _payed = 0.00, _totalBalance = 0.00;

  void restApiData() async {
    // API 
    var url = 'http://wealthvending.co.th:9027/api/AccountInvoice/GetDataInvoice'; // ไม่สามารถใช้ Localhost ได้
    // Await the http get response, then decode the json-formatted response.
     http.get(url).then((response) {
      if (response.statusCode == 200) {
        var jsonResponse = convert.jsonDecode(response.body);
        var sumCoin  = double.parse(jsonResponse['data']["sumCoin"]);
        var sumBankNote = double.parse(jsonResponse['data']["sumBankNote"]);
        var oilRemaining = double.parse(jsonResponse['data']["oil_Remaining"]);
        var costPerLitre = double.parse(jsonResponse['data']["cost_Per_Litre"]);
        var sum = double.parse(jsonResponse['data']["sum"]);
        var beforeSum = double.parse(jsonResponse['data']["beforeSum"]);
        var error = int.parse(jsonResponse['data']["error"]);
        var coin = double.parse(jsonResponse['data']["coin"]);
        var bankNote = double.parse(jsonResponse['data']["bankNote"]);
        var litreSold = double.parse(jsonResponse['data']["litre_Sold"]);
        var fuelInput = double.parse(jsonResponse['data']["fuel_Input"]);
        var direction = double.parse(jsonResponse['data']["direction"]);
        var payed = double.parse(jsonResponse['data']["payed"]);
        var totalBalance = jsonResponse['data']["totalBalance"];
          _sumCoin = sumCoin; _sumBankNote = sumBankNote; _oilRemaining = oilRemaining;
          _costPerLitre = costPerLitre; _sum = sum; _beforeSum = beforeSum; _error = error; _coin = coin;
          _bankNote = bankNote; _litreSold = litreSold; _fuelInput = fuelInput; _direction = direction;
          _payed = payed; _totalBalance = totalBalance;
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
                        color: AppColors.primaryBackground,
                      ),
                      child: Container(),
                    ),
                  ),
                  Positioned(
                    height: 40,
                    left: MediaQuery.of(context).size.height * 0.01,
                    top: MediaQuery.of(context).size.height * 0.05,
                    child: FlatButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => IPhoneXXS11Pro1Widget()),
                        );
                      },
                      color: AppColors.secondaryBackground,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(33.5)),
                      ),
                      textColor: Color.fromARGB(255, 13, 36, 51),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "<- Back>",
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
                    top: MediaQuery.of(context).size.width * 0.25, // เปลี่ยนจาก pixel เป็น percen
                    right: 0, 
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: MediaQuery.of(context).size.width * 0.17,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Positioned(
                                  child: Container(
                                    width: MediaQuery.of(context).size.width * 0.8,
                                    height: MediaQuery.of(context).size.width * 0.15,
                                    decoration: BoxDecoration(
                                      color: AppColors.ternaryBackground,
                                      borderRadius: Radii.k47pxRadius,
                                    ),
                                    child: Container(),
                                  ),
                                ),
                                Positioned(
                                  top: 8,
                                  child: Text(
                                    "ข้อมูลตู้น้ำมันรายบุคคล",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: AppColors.primaryText,
                                      fontFamily: "DIN Alternate",
                                      fontWeight: FontWeight.w700,
                                      fontSize: 25,
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
                  Positioned(
                    left: MediaQuery.of(context).size.width * 0,
                    top: MediaQuery.of(context).size.height * 0.22, // เปลี่ยนจาก pixel เป็น percen
                    right: MediaQuery.of(context).size.width * 0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            //width: MediaQuery.of(context).size.width * 1,
                            height: MediaQuery.of(context).size.height * 0.6,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                  child: DataTable(
                                    columns: <DataColumn>[
                                      DataColumn(label: Text('Key',style: TextStyle(fontStyle: FontStyle.italic),),),
                                      DataColumn(label: Text('Value',style: TextStyle(fontStyle: FontStyle.italic),),),
                                    ],
                                    rows: <DataRow>[
                                      DataRow(cells: <DataCell>[DataCell(Text('sumCoin')),DataCell(Text('$_sumCoin')),],),
                                      DataRow(cells: <DataCell>[DataCell(Text('sumBankNote')),DataCell(Text('$_sumBankNote')),],),
                                      DataRow(cells: <DataCell>[DataCell(Text('oil_Remaining')),DataCell(Text('$_oilRemaining')),],),
                                      DataRow(cells: <DataCell>[DataCell(Text('cost_Per_Litre')),DataCell(Text('$_costPerLitre')),],),
                                      DataRow(cells: <DataCell>[DataCell(Text('sum')),DataCell(Text('$_sum')),],),
                                      DataRow(cells: <DataCell>[DataCell(Text('beforeSum')),DataCell(Text('$_beforeSum')),],),
                                      DataRow(cells: <DataCell>[DataCell(Text('error')),DataCell(Text('$_error')),],),
                                      DataRow(cells: <DataCell>[DataCell(Text('coin')),DataCell(Text('$_coin')),],),
                                      DataRow(cells: <DataCell>[DataCell(Text('bankNote')),DataCell(Text('$_bankNote')),],),
                                      DataRow(cells: <DataCell>[DataCell(Text('litre_Sold')),DataCell(Text('$_litreSold')),],),
                                      DataRow(cells: <DataCell>[DataCell(Text('fuel_Input')),DataCell(Text('$_fuelInput')),],),                              
                                      DataRow(cells: <DataCell>[DataCell(Text('direction')),DataCell(Text('$_direction')),],),
                                      DataRow(cells: <DataCell>[DataCell(Text('payed')),DataCell(Text('$_payed')),],),
                                      DataRow(cells: <DataCell>[DataCell(Text('totalBalance')),DataCell(Text('$_totalBalance')),],),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 100,
                            child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                Positioned(
                                  top: MediaQuery.of(context).size.height * 0.01,
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
                                Positioned(
                                  bottom: 0,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text("ERROR",style: TextStyle(color: AppColors.redText, fontSize: 10,),),
                                      Text("0 ปกติ 1 น้ำมันหมด 2 โฟรมิเตอร์เสีย 3 ปั้มขาด",style: TextStyle(color: AppColors.redText, fontSize: 10,),),
                                      Text(" 4 ปั้มช็อต 5 ไฟดับ 6 ประตูตู้เปิด",style: TextStyle(color: AppColors.redText, fontSize: 10,),),
                                    ],
                                  )
                                )
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

import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({required this.title});
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  payment() async {
    String dateandtime = DateFormat("yyyyMMddHHmmss").format(DateTime.now());
    String dexpiredate = DateFormat("yyyyMMddHHmmss")
        .format(DateTime.now().add(Duration(days: 1)));
    String tre = "T" + dateandtime;
    const String pp_Amount = "100";
    String pp_BillReference = "billRef";
    String pp_Description = "Description";
    String pp_Language = "EN";
    String pp_MerchantID = "MC48406";
    String pp_Password = "wxv9vzyv30";
    String pp_ReturnURL =
        "https://sandbox.jazzcash.com.pk/ApplicationAPI/API/Payment/DoTransaction";
    String pp_ver = "1.1";
    String pp_TxnCurrency = "PKR";
    String pp_TxnDateTime = dateandtime.toString();
    String pp_TxnExpiryDateTime = dexpiredate.toString();
    String pp_TxnRefNo = tre.toString();
    String pp_TxnType = "MWALLET";
    String ppmpf_1 = "4456733833993";
    String IntegeritySalt = "0uat5z6978";
    String and = '&';
    String superdata = IntegeritySalt +
        and +
        pp_Amount +
        and +
        pp_BillReference +
        and +
        pp_Description +
        and +
        pp_Language +
        and +
        pp_MerchantID +
        and +
        pp_Password +
        and +
        pp_ReturnURL +
        and +
        pp_TxnCurrency +
        and +
        pp_TxnDateTime +
        and +
        pp_TxnExpiryDateTime +
        and +
        pp_TxnRefNo +
        and +
        pp_TxnType +
        and +
        pp_ver +
        and +
        ppmpf_1;

    var key = utf8.encode(IntegeritySalt);
    var bytes = utf8.encode(superdata);
    var hmacSha256 = new Hmac(sha256, key);
    Digest sha256Result = hmacSha256.convert(bytes);
    var url =
        'https://sandbox.jazzcash.com.pk/ApplicationAPI/API/Payment/DoTransaction';

    var response = await http.post(Uri.parse(url), body: {
      "pp_Version": "1.1",
      "pp_TxnType": "OTC",
      "pp_Language": "EN",
      "pp_MerchantID": "MC48406",
      "pp_SubMerchantID": "",
      "pp_Password": "wxv9vzyv30",
      "pp_BankID": "",
      "pp_ProductID": "",
      "pp_TxnRefNo": "T20221003105516",
      "pp_Amount": "1000",
      "pp_TxnCurrency": "PKR",
      "pp_TxnDateTime": "20221003105541",
      "pp_BillReference": "billRef",
      "pp_Description": "Description",
      "pp_TxnExpiryDateTime": "20221004105541",
      "pp_ReturnURL":
          "https://sandbox.jazzcash.com.pk/ApplicationAPI/API/Payment/DoTransaction",
      "pp_SecureHash":
          "DF80EA2F82AD6FC242B459A541555A55FB93762C2F914784F9E3566ABE83F696",
      "ppmpf_1": "03330915166",
      "ppmpf_2": "",
      "ppmpf_3": "",
      "ppmpf_4": "",
      "ppmpf_5": ""
    });

    print("response=>");
    print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
          child: Center(
            child: RaisedButton(
              onPressed: () {
                payment();
              },
              child: Text("Pay with JazzCash"),
            ),
          ),
        ));
  }
}

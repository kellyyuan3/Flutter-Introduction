import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<HomeScreen> {
  String foreEndSalt = '';
  String accessKeySecret = "";
  String result = '';
  String requestBody = '';
  String accessKeyID = '';
  String tokenType = '';
  String accessToken = '';
  static const urlHead = 'https://devcpoc.uptrillion.com';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Test Project')
      ),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 40,),
          Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 40),
            child: Row(
              children: [
                const Text(
                  'URL:',
                  style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600
                  )
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20),
                  width: 250,
                  height: 60,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2),
                  ),
                  child: const Text(
                    urlHead,
                    style: TextStyle(
                    color: Colors.black,
                    fontSize: 14
                    )
                  )
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 40),
            child: Row(
              children: [
                const Text(
                  'Req:',
                  style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600
                  )
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20),
                  width: 250,
                  height: 60,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2),
                  ),
                  child: const Text (
                    'GET /Service/API/MPOS/Login/GetForeEndSalt?Email=kaikang0408@gmail.com',
                    style: TextStyle(
                    color: Colors.black,
                    fontSize: 12
                    )
                    )
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 40),
            child: Row(
              children: [
                const Text(
                  'ForeEndSalt Res:',
                  style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600
                  )
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20),
                  width: 200,
                  height: 60,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2),
                  ),
                  child: Text (
                    foreEndSalt,
                    style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14
                    )
                  )
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 40),
            child: Row(
              children: [
                const Text(
                  'Auth Res:',
                  style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600
                  )
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20),
                  width: 250,
                  height: 100,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2),
                  ),
                  child: Text (
                    accessKeySecret,
                    style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14
                    )
                )
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 40),
            child: Row(
              children: [
                const Text(
                  'Transact Res:',
                  style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600
                  )
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20),
                  width: 250,
                  height: 150,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2),
                  ),
                  child: Text (
                    result,
                    style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14
                    )
                )
                )
              ],
            ),
          ),
          Row (
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              OutlinedButton(
                onPressed: getForeEndSalt,
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.black,
                  shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)))
                  ),
                child: const Text ('ForeEndSalt')
              ),
              const SizedBox(width: 30),
              OutlinedButton(
                onPressed: getAuth,
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.black,
                  shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)))
                  ),
                child: const Text ('Auth')
              ),
              const SizedBox(width: 30),
              OutlinedButton(
                onPressed: transact,
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.black,
                  shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)))
                  ),
                child: const Text ('Transact')
              )
          ],
          ),
          Row (
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              OutlinedButton(
              onPressed: clear,
              style: OutlinedButton.styleFrom (
              foregroundColor: Colors.black,
              shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)))
              ),
              child: const Text ('Cancel')
              ),
            ],
          )
        ],
        )
    );
  }

  void getForeEndSalt() async {
    print('fetch called');
    const url = 'https://devcpoc.uptrillion.com/Service/API/MPOS/Login/GetForeEndSalt?Email=kaikang0408@gmail.com';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    setState(() {
      foreEndSalt = json['ForeEndSalt'];
    });
    print('fetch finished');
  }

  void clear() {
    setState(() {
      foreEndSalt = '';
      accessKeySecret = '';
      result = '';
      requestBody = '';
      accessKeyID = '';
      tokenType = '';
      accessToken = '';
    });
  }

  void getAuth() async {
    print('getAuth called');
    const url = 'https://devcpoc.uptrillion.com/Service/API/MPOS/Login/GetAuth';
    final uri = Uri.parse(url);
    var hashedPwd = hashPwd("Terry@@@123", foreEndSalt);
    final response = await http.post(uri,
    body: {
      "Email": "kaikang0408@gmail.com",
      "Password": hashedPwd
    });
    final body = response.body;
    final json = jsonDecode(body);
    setState(() {
      accessKeySecret = json['AccessKeySecret'];
      accessKeyID = json['AccessKeyID'];
      tokenType = json ['TokenType'];
      accessToken = json['AccessToken'];
    });
    print('getAuth finished');
  }

  String hashPwd(plainStr, salt) {
    var bytes = utf8.encode(plainStr + salt);
    var digest = sha512.convert(bytes);
    return digest.toString();
  }

  void transact() async {
    print('transact called');
    const url = 'https://devcpoc.uptrillion.com/Service/API/MPOS/Payment/Transact';
    final uri = Uri.parse(url);
    var currentTime = DateTime.now().toUtc().toIso8601String().substring(0, 19);
    var timeStampRaw = currentTime.replaceAll(RegExp(r'[^0-9]'),'');
    var requestBodyMap = {
      "SerialNum": "1890007229",
      "TimeOut": "60",
      "TenderType": "CREDIT",
      "TransType": "SALE",
      "TotalAmt": "22.05",
      "Amount": "19.35",
      "ECRRefNum": "",
      "TraceNum": "",
      "MaskedAccount": "476173******0010",
      "CardType": "Visa",
      "Force": "N",
      "TipAmt": "2.70",
      "TaxAmt": "1.35",
      "ExtData": "<SerialNum>1890007229</SerialNum><DiscountAmt>0.00</DiscountAmt><Subtotal>18</Subtotal><CardType>Visa</CardType><EntryMode>4</EntryMode><EMVData>4F07A00000000310105F24032212315F280208405F2A0208405F2D02656E5F34010182021C008407A00000000310109100950580000080009A032212019B0268009C01009F02060000000061359F03060000000000009F0607A00000000310109F0702FF009F080200969F090200969F0D05B0508088009F0E0500000000009F0F05B0508098009F100706010A03A0A0009F1A0208409F1E0831383930303037329F21031349129F260814BB0D72A12D31959F2701809F3303E028C89F34031F00029F3501229F360200C39F3704734CDDB19F400560000000019F4104000000119F5301529F5B009F6E009F7C00C0009F390105500B56495341204352454449549F120B5669736120437265646974</EMVData><SupportPartialApproval>N</SupportPartialApproval><MaskedPAN>476173******0010</MaskedPAN><AppVersion>V1.01.000_20221028</AppVersion><Platform>android</Platform><DemoMode>N</DemoMode>",
      "SensitiveExtData": "<PAN>4761739001010010</PAN><Track2>;4761739001010010=22122011143804400000?</Track2>",
      "SignData": "",
      "TransDateTime": currentTime,
      "ManualEnterAcctInfoFlag": "false",
      "HRefNum": "",
      "RefNum": "421088361720",
      "OrigRefNum": "",
      "OrigTransDate": "",
      "OrigTransTime": "",
      "TimeStamp": timeStampRaw,
      "OrderNum": "",
      "ExpDate": "1222",
      "TimeZone": "EST",
      "HostToken": "",
      "IgnoreOrigTransExtDataFlag": "false"
    };
    requestBody = jsonEncode(requestBodyMap);
    var signature = hashSignature(requestBody, accessKeySecret);
    var authorization = '$tokenType $accessToken';
    final response = await http.post(uri, headers: {
      "AccessKeyID": accessKeyID,
      "Authorization": authorization,
      "Timestamp": currentTime,
      "Signature": signature,
      "Content-Type": "application/json"
    }, body: requestBody);
    final body = response.body;
    final json = jsonDecode(body);
    setState(() {
      result = json.toString();
    });
    print('transact finished');
  }

  String hashSignature(requestStr, accessStr) {
    var key = utf8.encode(accessStr);
    var bytes = utf8.encode(requestStr);
    var hmacSha256 = Hmac(sha256, key);
    var digest = hmacSha256.convert(bytes);
    return digest.toString();
  }
}
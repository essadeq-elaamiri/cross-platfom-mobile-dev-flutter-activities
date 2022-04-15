import 'dart:convert';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CovidStatistics extends StatefulWidget {
  @override
  State<CovidStatistics> createState() => _CovidStatisticsState();
}

class _CovidStatisticsState extends State<CovidStatistics> {
  var countryCovidData = jsonDecode(
      '{"confirmed":{"value":1164296,"detail":"https://covid19.mathdro.id/api/countries/MA/confirmed"},"recovered":{"value":0,"detail":"https://covid19.mathdro.id/api/countries/MA/recovered"},"deaths":{"value":16062,"detail":"https://covid19.mathdro.id/api/countries/MA/deaths"},"lastUpdate":"2022-04-15T22:21:10.000Z"}');
  final String OPEN_GRARH_IMAGE_URL = "https://covid19.mathdro.id/api/og";
  TextEditingController textEditingController = new TextEditingController();

  void searchCountryCovidStat(String countryCode) {
    String url = "https://covid19.mathdro.id/api/countries/${countryCode}";
    print(url);
    http.get(Uri.parse(url)).then((response) {
      setState(() {
        countryCovidData = json.decode(response.body);
      });
    }).catchError((onError) {
      print(onError);
    });
  }

  @override
  Widget build(BuildContext context) {
    String choosenCountryCode = "AI";
    Country choosenCountry = Country(
        // default
        phoneCode: "phoneCode",
        countryCode: "MA",
        e164Sc: 12,
        geographic: false,
        level: 1,
        name: "Morocco",
        example: "example",
        displayName: "displayName",
        displayNameNoCountryCode: "displayNameNoCountryCode",
        e164Key: "12");

    return Scaffold(
      appBar: AppBar(
        title: Text("Covid Statistics"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Text(
              "Covid 19 global overview",
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
            ),
            Image.network(
              OPEN_GRARH_IMAGE_URL,
              fit: BoxFit.cover,
            ),
            //DropdownMenu

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: TextButton(
                    child: Text("Choose a country"),
                    style: TextButton.styleFrom(
                      alignment: Alignment.center,
                      backgroundColor: Colors.indigo,
                      primary: Colors.white,
                    ),
                    onPressed: () {
                      showCountryPicker(
                        context: context,
                        onSelect: (Country country) {
                          print('Select country: ${country.countryCode}');
                          setState(() {
                            choosenCountry = country;
                            choosenCountryCode = country.countryCode;
                            searchCountryCovidStat(country.countryCode);
                          });
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
            Expanded(
              child: Card(
                margin: EdgeInsets.all(0.1),
                child: SizedBox(
                  //width: 300,
                  //height: 500,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Image.network("https://countryflagsapi.com/png/" +
                            choosenCountry.countryCode),
                        SizedBox(
                          height: 10,
                        ), //SizedBox
                        Text(
                          choosenCountry.name,
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.indigo,
                            fontWeight: FontWeight.w500,
                          ), //Textstyle
                        ), //Text
                        SizedBox(
                          height: 10,
                        ), //SizedBox
                        Text(
                          'Latest upadate:' + countryCovidData["lastUpdate"],
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                          ),
                        ),

                        SizedBox(
                          height: 10,
                        ), //SizedBox
                        Text(
                          'Confirmed: ${countryCovidData["confirmed"]["value"].toString()}',
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.red[600],
                          ),
                        ),

                        SizedBox(
                          height: 10,
                        ), //SizedBox
                        Text(
                          'Recovered: ${countryCovidData["recovered"]["value"]}',
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.green[600],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ), //SizedBox
                        Text(
                          'Deaths: ${countryCovidData["deaths"]["value"]}',
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.red[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

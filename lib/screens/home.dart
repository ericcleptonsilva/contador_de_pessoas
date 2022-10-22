// ignore: file_names

// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_print, unused_element, unused_import, unused_field

import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:flutter/material.dart';

import '../ad_helper.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  BannerAd? _ad;
  final TextEditingController _lotacaoController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  int lotacao = 0;
  int count = 0;

  //RegExp regexNumber = RegExp("[0-9]");

  Widget addLotacao(bool isFull) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            key: _formKey,
            controller: _lotacaoController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: const BorderRadius.all(
                  Radius.circular(4.0),
                ),
              ),
              labelText: "Digite a lotação",
              labelStyle: TextStyle(color: Colors.white),
            ),
            keyboardType: TextInputType.number,
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 25,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.white,
              fixedSize: Size(0, 70),
              animationDuration: Duration(seconds: 2),
              elevation: 1.0,
              foregroundColor: Colors.blue.shade900,
            ),
            onPressed: () {
              setState(() {
                if (lotacao != 0) {
                  lotacao = int.parse(_lotacaoController.text);
                  isFull = false;
                  _lotacaoController.clear();
                }
              });
            },
            child: Text(
              "Salvar",
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        )
      ],
    );
  }

  void decrement() {
    setState(() {
      count--;
    });
  }

  void increment() {
    setState(() {
      count++;
    });
  }

  @override
  void initState() {
    super.initState();
    BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      size: AdSize.banner,
      request: AdRequest(),
      listener: BannerAdListener(onAdLoaded: (Ad ad) {
        setState(() {
          _ad = ad as BannerAd;
        });
      }, onAdFailedToLoad: (ad, error) {
        // Releases an ad resource when it fails to load
        print('Ad load failed (code=${error.code} message=${error.message})');
        ad.dispose();
      }, onAdOpened: (Ad ad) {
        print('$BannerAd onAdOpened');
      }, onAdClosed: (Ad ad) {
        print('$BannerAd onAdClosed');
      }),
    ).load();
  }

  bool get isEmpty => count == 0;
  bool get isFull => count == lotacao || count > lotacao;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.blue.shade900,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 100,
              ),
              addLotacao(isFull),
              Text(
                isFull ? "Lotado" : "Pode Entrar!",
                style: TextStyle(
                  color: isFull ? Colors.red.shade200 : Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  count.toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 100,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: isEmpty
                          ? Colors.white.withOpacity(0.68)
                          : Colors.white,
                      fixedSize: const Size(100, 80),
                      animationDuration: Duration(seconds: 2),
                      elevation: 5.0,
                      foregroundColor: Colors.blue.shade900,
                    ),
                    onPressed: isEmpty ? null : decrement,
                    child: Text(
                      'Saiu',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 35,
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: isFull
                          ? Colors.white.withOpacity(0.68)
                          : Colors.white,
                      fixedSize: const Size(100, 80),
                      animationDuration: Duration(seconds: 2),
                      elevation: 5.0,
                      foregroundColor: Colors.blue.shade900,
                    ),
                    onPressed: isFull ? null : increment,
                    child: Text(
                      'Entrou',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 55,
              ),
              _ad != null
                  ? Container(
                      width: _ad!.size.width.toDouble(),
                      height: 72,
                      alignment: Alignment.center,
                      child: AdWidget(ad: _ad!),
                    )
                  : SizedBox(
                      width: 300,
                      height: 50,
                      child: Center(
                          child: Text(
                        'Erro no carregamento do banner',
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      )),
                    )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _ad?.dispose();
  }
}

import 'package:flutter/material.dart';
import 'package:mockup_ki/components/aditional_services/additional_services.dart';
import 'package:mockup_ki/components/banner/title_inside.dart';
import 'package:mockup_ki/components/outline_button_redirect.dart';
import 'package:mockup_ki/components/services/build_service_icons.dart';
import 'package:mockup_ki/components/services/icon_with_label.dart';
import 'package:mockup_ki/primary_colors.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          spacing: 15,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _heroAndPaySection(),
            BuildServiceIcons(),
            AdditionalServices(),
            _buildTripPlannerCard(),
            _newestDiscountBanner(),
            SizedBox(height: 5),
            _popularDestinationBanner(),
            SizedBox(height: 5),
            _pointExchange(),
            SizedBox(height: 15),
            _newestArticles(),
            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }

  Widget _appBar() {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                ),
                "Selamat Siang,"
              ),
              Text(
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                ),
                "Mamank"
              )
            ],
          ),
        ),
        Row(
          spacing: 5,
          children: [
            Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(999),
                color: Colors.white12,
              ),
              child: Center(
                child: Icon(
                  size: 16,
                  color: Colors.white,
                  Icons.shopping_cart,
                ),
              ),
            ),
            Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(999),
                color: Colors.white12,
              ),
              child: Center(
                child: Icon(
                  size: 16,
                  color: Colors.white,
                  Icons.email_rounded,
                ),
              ),
            ),
            Container(
              height: 35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(999),
                color: Colors.white12
              ),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    spacing: 5,
                    children: [
                      Icon(
                        size: 13,
                        color: Colors.white,
                        Icons.headset_mic_outlined,
                      ),
                      Text(
                        softWrap: false,
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.white
                        ),
                        "Bantuan"
                      ),
                    ],
                  ),
                )
              ),
            ),
          ]
        )
      ],
    );
  }

  Widget _heroAndPaySection() {
    return Stack(
      children: [
        Column(
          children: [
            _hero(),
            SizedBox(height: 60),
          ],
        ),
        Positioned(
          bottom: 5,
          left: 16,
          right: 16,
          child: _buildKaiPay(),
        )
      ],
    );
  }

  Widget _hero() {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomRight,
              stops: [0, 0.2, 1],
              colors: [PrimaryColors.purple, PrimaryColors.purple, PrimaryColors.lightPurple]
            )
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(15, 45, 15, 15),
                child: _appBar(),
              ),
              Container(
                height: 130,
              )
            ],
          )
        ),
        Positioned(
          top: -20,
          left: 0,
          right: 0,
          bottom: 0,
          child: Opacity(
            opacity: 0.1,
            child: Image.asset(
              'assets/images/city.png',
              width: double.infinity,
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildKaiPay() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.shade300,
        ),
        borderRadius: BorderRadius.circular(10),
        color: Colors.white
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    spacing: 5,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        spacing: 5,
                        children: [
                          Image.asset(
                            'assets/icons/planner.webp',
                            height: 23,
                            width: 23
                          ),
                          Text(
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold
                            ),
                            "KAI PAY"
                          ),
                        ],
                      ),
                      OutlineButtonRedirect("Aktivasi KAIPay")
                    ],
                  ),
                  VerticalDivider(
                    width: 3,
                    color: Colors.grey.shade300,
                    thickness: 1,
                  ),
                  SizedBox(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _kaiPayButtonIcon(Icons.qr_code_scanner, "Scan"),
                        _kaiPayButtonIcon(Icons.wallet, "Top Up"),
                        _kaiPayButtonIcon(Icons.history, "Riwayat", disabled: true),  
                      ],
                    ),
                  )
                ],
              ),
            )
          ),
          Divider(
            height: 1,
            color: Colors.grey.shade200
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Row(
                    spacing: 4,
                    children: [
                      Image.asset(
                        'assets/icons/coin.png',
                        height: 23,
                        width: 23
                      ),
                      Row(
                        spacing: 2,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.red 
                            ),
                            "0"
                          ),
                          Text(
                            style: TextStyle(
                              fontSize: 12,
                            ),
                            "RailPoin"
                          ),
                        ]
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 33,
                  child: IconButton(
                    onPressed: () {},
                    style: IconButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 13),
                      backgroundColor: PrimaryColors.blue.withValues(alpha: 0.1),
                    ),
                    icon: Row(
                      spacing: 4,
                      children: [
                        Icon(
                          size: 25,
                          Icons.stars_outlined,
                          color: PrimaryColors.blue,
                        ), 
                        Text(
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: PrimaryColors.blue
                          ),
                          "Basic"
                        ),
                        DecoratedBox(
                          decoration: BoxDecoration(
                            color: PrimaryColors.blue,
                            borderRadius: BorderRadius.circular(999)
                          ),
                          child: Icon(
                            size: 18,
                            color: Colors.white,
                            Icons.keyboard_arrow_right_rounded
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      )
    );
  }

  Widget _kaiPayButtonIcon(IconData icon, String text, {bool disabled = false}) {
    return IconButton(
      style: IconButton.styleFrom(
        foregroundColor: disabled? Colors.grey : PrimaryColors.blue,
        fixedSize: Size.fromWidth(50),
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      onPressed: () {}, 
      icon: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            size: 25,
            icon
          ),
          Text(
            softWrap: false,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: disabled? Colors.grey : PrimaryColors.blue
            ),
            text
          ),
        ]
      )
    );
  }

  Widget _buildTripPlannerCard() {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/images/card_background.png"), fit: BoxFit.cover),
          ),
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Row(
              spacing: 10,
              children: [
                Container(
                  width: 65,
                  height: 65,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: AssetImage("assets/icons/portuma.webp"),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        "TRIP Planner"
                      ),
                      Text(
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.white,
                        ),
                        "Buat perencanaan terbaik untuk perjalananmu"
                      ),
                    ],
                  ),
                ),
                OutlinedButton(
                  onPressed: () {}, 
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    side: BorderSide(
                      color: Colors.white
                    )
                  ),
                  child: Text(
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    "BUAT"
                  ),
                )
              ],
            ),
          )
        ),
      ),
    );
  }

  Widget _newestDiscountBanner() {
    return Column(
      spacing: 15,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.bold
                ),
                "Promo Terbaru"
              ),
              OutlineButtonRedirect("Lihat Semua", index: 3,)
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            spacing: 16,
            children: [
              _bannerWithText1("assets/images/promo1.jpg", "Promo Akhir Tahun"),
              _bannerWithText1("assets/images/promo2.jpg", "Promo Akhir Tahun"),
              _bannerWithText1("assets/images/promo3.jpg", "Promo Akhir Tahun"),
              _bannerWithText1("assets/images/promo4.jpg", "Promo Akhir Tahun"),
            ],
          ),
        )
      ]
    );
  }

  Widget _popularDestinationBanner() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 15,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.bold
                ),
                "Tujuan Populer"
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            spacing: 16,
            children: [
              TitleInside('assets/images/jakarta.png', 'Jakarta', maxWidth: 250,),
              TitleInside('assets/images/bandung.jpg', 'Bandung', maxWidth: 250,),
              TitleInside('assets/images/jogjakarta.jpg', 'Jogjakarta', maxWidth: 250,),
              TitleInside('assets/images/semarang.jpg', 'Semarang', maxWidth: 250,),
              TitleInside('assets/images/surabaya.jpg', 'Surabaya', maxWidth: 250,),
            ],
          )
        )
      ],
    );
  }

  Widget _pointExchange() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 15,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.bold
                ),
                "Tukar Railpoinm mu sekarang"
              ),
              OutlineButtonRedirect("Lihat Semua")
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            spacing: 16,
            children: [
              _bannerWithText3("assets/images/mapclub-point.png", "DAPATKAN 25.000 MAPCLUB POINTS"),
              _bannerWithText3("assets/images/mapclub-point.png", "DAPATKAN 25.000 MAPCLUB POINTS"),
              _bannerWithText3("assets/images/mapclub-point.png", "DAPATKAN 25.000 MAPCLUB POINTS"),
              _bannerWithText3("assets/images/mapclub-point.png", "DAPATKAN 25.000 MAPCLUB POINTS"),
            ],
          ),
        )
      ]
    );
  }

  Widget _newestArticles() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 15,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.bold
                ),
                "Artikel Menarik"
              ),
              OutlineButtonRedirect("Lihat Semua")
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            spacing: 16,
            children: [
              _bannerWithText1("assets/images/layanan-kai.jpg", "Holiday Vibes Maksimal Bareng KAI di Liburan Nataru 2024"),
              _bannerWithText1("assets/images/layanan-kai.jpg", "Holiday Vibes Maksimal Bareng KAI di Liburan Nataru 2024"),
              _bannerWithText1("assets/images/layanan-kai.jpg", "Holiday Vibes Maksimal Bareng KAI di Liburan Nataru 2024"),
              _bannerWithText1("assets/images/layanan-kai.jpg", "Holiday Vibes Maksimal Bareng KAI di Liburan Nataru 2024"),
            ],
          ),
        )
      ]
    );
  }

  Widget _bannerWithText1(String imageUrl, String title) {
    return Container(
      constraints: BoxConstraints(maxWidth: 250, minWidth: 100),
      child: Column(
        spacing: 5,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 16/8,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                  image: AssetImage(imageUrl),
                  fit: BoxFit.cover
                ),
              ),
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          Text(
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500
            ),
            title
          )
        ],
      )
    );
  }

  Widget _bannerWithText3(String imageUrl, String title) {
    return Container(
      constraints: BoxConstraints(maxWidth: 200, minWidth: 100),
      child: Column(
        spacing: 5,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 16/9,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                  image: AssetImage(imageUrl),
                  fit: BoxFit.cover
                ),
              ),
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          Text(
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500
            ),
            title
          ),
          Row(
            spacing: 3,
            children: [
              DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.yellow.shade100,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 2, horizontal: 4),
                  child: Text(
                    style: TextStyle(
                      color: Colors.yellow.shade900,
                      fontSize: 12,
                      fontWeight: FontWeight.bold
                    ),
                    "500",
                  ),
                ),
              ),
              Text(
                style: TextStyle(
                  fontSize: 11
                ),
                'Railpoint'
              )
            ],
          )
        ],
      )
    );
  }
}
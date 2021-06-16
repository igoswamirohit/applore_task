import 'package:applore_task/utils/color_constants.dart';
import 'package:applore_task/widgets/bottom_nav_bar.dart';
import 'package:applore_task/widgets/search_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  var latoStyle = GoogleFonts.lato();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavBar(),
        backgroundColor: bgColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              buildHeader(),
              SizedBox(
                height: 8,
              ),
              buildUtilityGrid(),
              // buildSizedBox18(),
              buildRemainingUI(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildRemainingUI() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildCallBackWidget(latoStyle),
          buildSizedBox18(),
          buildViewAllRowWithCustomLabel(latoStyle, 'Certified Partner Labs'),
          buildSizedBox18(),
          buildCertifiedPartnerItemList(),
          buildSizedBox18(),
          buildViewAllRowWithCustomLabel(latoStyle, 'Benefits'),
          buildSizedBox18(),
          Container(
            height: 70,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: [
                buildBenefitItem(paleGreen, 'Affordable'),
                buildBenefitItem(paleYellow, 'Experts'),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildBenefitItem(Color color, String label) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 154,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: Text(
            label,
            style:
                latoStyle.copyWith(fontSize: 17, fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }

  Widget buildCertifiedPartnerItemList() {
    return Container(
      height: 120,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: [
          buildCertifiedPartnerItem('assets/pngs/beaker.png', 'Medlife Lab'),
          buildCertifiedPartnerItem('assets/pngs/beaker.png', 'LabFor All'),
          buildCertifiedPartnerItem('assets/pngs/beaker.png', 'Lorem'),
        ],
      ),
    );
  }

  Widget buildCertifiedPartnerItem(String assetPath, String label) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 2,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            width: 108,
            padding: EdgeInsets.all(15),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    assetPath,
                    height: 42,
                    width: 42,
                  ),
                  Text(
                    label,
                    style: latoStyle.copyWith(
                        fontSize: 12, fontWeight: FontWeight.w700),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  SizedBox buildSizedBox18() => SizedBox(
        height: 18,
      );

  Widget buildViewAllRowWithCustomLabel(TextStyle latoStyle, String label) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: latoStyle.copyWith(fontSize: 18, color: Colors.black),
        ),
        Text(
          'VIEW ALL',
          style: latoStyle.copyWith(
              decoration: TextDecoration.underline,
              color: lightOrange,
              fontSize: 10),
        )
      ],
    );
  }

  Container buildCallBackWidget(TextStyle latoStyle) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: lightPurpleColor),
      child: ListTile(
        title: Text(
          'Unable to find the right test?',
          style: latoStyle.copyWith(fontSize: 16, fontWeight: FontWeight.w400),
        ),
        subtitle: Text(
          'Request a call back',
          style: latoStyle.copyWith(
            color: textGrey,
          ),
        ),
        trailing: Container(
          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13), color: Colors.black),
          child: Icon(
            Icons.arrow_forward,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget buildUtilityGrid() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(45)),
          color: lightGreyColor),
      padding: EdgeInsets.symmetric(vertical: 25, horizontal: 20),
      child: GridView(
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 15,
            crossAxisCount: 2,
            mainAxisSpacing: 15,
            childAspectRatio: 3),
        shrinkWrap: true,
        children: [
          buildCard(assetPath: 'assets/pngs/image 1.png', label: 'All Tests'),
          buildCard(
              assetPath: 'assets/pngs/cardiogram 1.png',
              label: 'Health\nPackages'),
          buildCard(
              assetPath: 'assets/pngs/prescription 1.png',
              label: 'Upload\nPrescription'),
          buildCard(assetPath: 'assets/pngs/nurse 1.png', label: 'Book Nurse'),
        ],
      ),
    );
  }

  Widget buildCard({required String assetPath, required String label}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            assetPath,
            height: 24,
            width: 24,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            label,
            style:
                latoStyle.copyWith(fontSize: 12, fontWeight: FontWeight.w700),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }

  Widget buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          buildCustomAppBar(),
          SizedBox(
            height: 20,
          ),
          SearchField(style: latoStyle),
        ],
      ),
    );
  }

  Widget buildCustomAppBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(Icons.arrow_back),
        Text(
          'Search',
          style: latoStyle.copyWith(fontSize: 18),
        ),
        Icon(Icons.more_vert)
      ],
    );
  }
}

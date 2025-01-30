import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sca_ui_imp/shared/app_colors.dart';
import 'package:sca_ui_imp/shared/assets.dart';
import 'package:sca_ui_imp/shared/navigation/app_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.appColor,
      appBar: AppBar(
        backgroundColor: AppColors.appColor,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Good Afternoon",
                  textAlign: TextAlign.start,
                  style: style.copyWith(
                    color: AppColors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "Susan Clay",
                  textAlign: TextAlign.start,
                  style: style.copyWith(
                    color: AppColors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          SvgPicture.asset(AppAssets.notificationIcon),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Stack(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 40),
                height: 100,
                decoration: const BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    imageBuilder(key: const ValueKey('profile_img')),
                    const SizedBox(
                      height: 10,
                    ),
                    SvgPicture.asset(AppAssets.rankIcon)
                  ],
                ),
              )
            ],
          ),
          Expanded(
            child: Container(
              width: size.width,
              color: AppColors.white,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: "Your fresh and green\ncomfortable",
                            children: [
                              TextSpan(
                                text: " place",
                                style: style.copyWith(
                                  fontSize: 27,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.appColor,
                                ),
                              ),
                            ],
                            style: style.copyWith(
                              fontSize: 27,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      height: 51,
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              style: style.copyWith(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: AppColors.black,
                              ),
                              cursorColor: AppColors.appColor,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                prefixIcon: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    SvgPicture.asset(
                                      AppAssets.searchIcon,
                                      height: 25,
                                      width: 25,
                                    ),
                                  ],
                                ),
                                hintText: "Search Now",
                                hintStyle: style.copyWith(
                                  fontSize: 16,
                                  color: AppColors.appColor,
                                  fontWeight: FontWeight.w400,
                                ),
                                filled: true,
                                fillColor: AppColors.appColor.withOpacity(.1),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(13),
                                  borderSide: BorderSide.none,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(13),
                                  borderSide: BorderSide.none,
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(13),
                                  borderSide: BorderSide.none,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(13),
                                  borderSide: BorderSide.none,
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(13),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          SvgPicture.asset(AppAssets.filterIcon)
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 150,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          _rowItems(
                              isFirst: true,
                              asset: AppAssets.nearByIcon,
                              title: "Near By"),
                          _rowItems(
                              asset: AppAssets.bookRoomIcon,
                              title: "Book Room"),
                          _rowItems(
                              asset: AppAssets.addEventIcon,
                              title: "Add Event"),
                          _rowItems(
                              asset: AppAssets.nearByIcon, title: "Near By"),
                          _rowItems(
                              asset: AppAssets.bookRoomIcon,
                              title: "Book Room"),
                          _rowItems(
                              asset: AppAssets.addEventIcon,
                              title: "Add Event"),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Recommended for You",
                            style: style.copyWith(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          ListView.separated(
                            padding: const EdgeInsets.only(
                              top: 20,
                              bottom: 100,
                            ),
                            separatorBuilder: (_, __) => const SizedBox(
                              height: 20,
                            ),
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (_, i) {
                              final valueKey = ValueKey("product_img_$i");
                              return InkWell(
                                onTap: () {
                                  AppRouter.push(AppRouterString.detailsScreen,
                                      arg: valueKey);
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          color: AppColors.greyText
                                              .withOpacity(.2),
                                          spreadRadius: .1,
                                          blurRadius: 10)
                                    ],
                                    borderRadius: BorderRadius.circular(17),
                                    color: AppColors.white,
                                  ),
                                  child: Row(
                                    children: [
                                      imageBuilder(
                                        url:
                                            "https://unsplash.com/photos/0g4OCfUAhuY/download?ixid=M3wxMjA3fDB8MXxzZWFyY2h8NHx8Z3JlZW50b3dufGVufDB8fHx8MTczODE1NzUzMXww&force=true&w=2400",
                                        key: valueKey,
                                      ),
                                      const SizedBox(
                                        width: 25,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "876 Green town",
                                            style: style.copyWith(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          Text(
                                            "Rosaville",
                                            style: style.copyWith(
                                                fontSize: 17,
                                                fontWeight: FontWeight.w400,
                                                color: AppColors.greyText),
                                          ),
                                          Row(
                                            children: [
                                              SvgPicture.asset(
                                                  AppAssets.yellowStarIcon),
                                              const SizedBox(
                                                width: 3,
                                              ),
                                              Text(
                                                "4.9",
                                                style: style.copyWith(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400,
                                                ),
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
                            itemCount: 10,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _rowItems(
      {required String asset, required String title, bool isFirst = false}) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(right: 15, left: isFirst ? 20 : 0),
          height: 113,
          width: 113,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: AppColors.greyText.withOpacity(.2),
                  spreadRadius: .1,
                  blurRadius: 10)
            ],
            color: AppColors.white,
            borderRadius: BorderRadius.circular(17),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(asset),
              const SizedBox(
                height: 10,
              ),
              Text(
                title,
                style: style.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.black,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

Widget imageBuilder(
    {double height = 84,
    double width = 84,
    required Key key,
    String url =
        "https://unsplash.com/photos/svGwIp_YcOU/download?ixid=M3wxMjA3fDB8MXxzZWFyY2h8MTJ8fGxhd3llciUyMGZhY2V8ZW58MHx8fHwxNzM4MTU0ODYyfDA&force=true&w=2400",
    double borderRadius = 17}) {
  return Hero(
    tag: key,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            image:
                DecorationImage(fit: BoxFit.cover, image: NetworkImage(url))),
      ),
    ),
  );
}

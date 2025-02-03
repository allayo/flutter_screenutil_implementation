import 'package:flutter/material.dart';
import 'package:sca_ui_imp/shared/app_colors.dart';
import 'package:sca_ui_imp/shared/assets.dart';
import 'package:sca_ui_imp/shared/navigation/app_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: pageLength, vsync: this);
    _tabController.addListener(() => setState(() {}));
    super.initState();
  }

  int pageLength = 4;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.appColor,
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: AppColors.white,
              child: TabBarView(
                children: [
                  _imgItem(size),
                  _imgItem(size),
                  _imgItem(size),
                  _imgItem(size),
                ],
                controller: _tabController,
              ),
            ),
          ),
          Container(
            padding:
                const EdgeInsets.only(left: 40, right: 20, bottom: 40, top: 0),
            decoration: const BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                )),
            child: Row(
              children: List.generate(
                pageLength,
                (i) => AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  margin: const EdgeInsets.only(right: 12),
                  height: 10.h,
                  width: 10.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _tabController.index == i
                        ? AppColors.black
                        : AppColors.inactiveGrey,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
              top: 40,
            ),
            child: AppButton(
              callback: () {
                AppRouter.push(AppRouterString.homeScreen);
              },
              text: "Let’s Start",
            ),
          ),
          const SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }

  Column _imgItem(Size size) {
    return Column(
      children: [
        SizedBox(
          height: size.height * .6,
          width: size.width,
          child: Image.asset(
            AppAssets.onboardingBg,
            fit: BoxFit.fitHeight,
          ),
        ),
        Container(
          width: size.width,
          color: AppColors.white,
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  text: "Book a Green Room &\n",
                  children: [
                    TextSpan(
                      text: "Workspace",
                      style: style.copyWith(
                        fontSize: 27.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.appColor,
                      ),
                    ),
                    const TextSpan(
                      text: " On-Demand",
                    ),
                  ],
                  style: style.copyWith(
                    fontSize: 27.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "A Space that unite the conscious individuals who collaborate to reduce their carbon footprint.",
                style: style.copyWith(
                  fontSize: 14.sp,
                  color: AppColors.greyText,
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

class AppButton extends StatelessWidget {
  const AppButton({super.key, required this.text, this.callback});

  final String text;
  final VoidCallback? callback;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: callback,
      child: Container(
        width: size.width,
        padding: const EdgeInsets.symmetric(
          vertical: 15,
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: style.copyWith(
            color: AppColors.white,
            fontSize: 19.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        decoration: BoxDecoration(
          color: AppColors.black,
          borderRadius: BorderRadius.circular(17),
        ),
      ),
    );
  }
}

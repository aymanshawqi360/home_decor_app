import 'package:home_decor_app/core/helper/app_assets.dart';
import 'package:home_decor_app/features/onboarding/dowmin/entities/onboarding_modle.dart';

class ListOnboardingDescription extends OnboardingModle {
  ListOnboardingDescription({
    required String image,
    required String descriptions,
    required String title,
  }) : super(descriptions: descriptions, title: title, image: image);
  static List<ListOnboardingDescription> listOnboarding = [
    ListOnboardingDescription(
      descriptions:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ",
      title: "Confortable Space",
      image: AppAssets.imageAndSvg.onboardingPageOne,
    ),
    ListOnboardingDescription(
      descriptions:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ",
      title: "Modern Design",
      image: AppAssets.imageAndSvg.onboardingPageTwo,
    ),
    ListOnboardingDescription(
      descriptions:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ",
      title: "Styled Living",
      image: AppAssets.imageAndSvg.onboardingPageThree,
    ),
    ListOnboardingDescription(
      descriptions:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ",
      title: "Relaxing Furniture",
      image: AppAssets.imageAndSvg.onboardingPageFoure,
    ),
  ];
}

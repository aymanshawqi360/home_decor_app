import 'package:home_decor_app/core/helper/app_assets.dart';

class OnboardingImagesAndTitlesAndDescriptions {
  String? title;
  String? image;
  String? descriptions;
  OnboardingImagesAndTitlesAndDescriptions._({
    required this.descriptions,
    required this.title,
    required this.image,
  });

  static List<OnboardingImagesAndTitlesAndDescriptions> get listOnboarding =>
      list;

  static List<OnboardingImagesAndTitlesAndDescriptions> list = [
    OnboardingImagesAndTitlesAndDescriptions._(
      descriptions:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ",
      title: "Confortable Space",
      image: AppAssets.imageAndSvg.onboardingPageOne,
    ),
    OnboardingImagesAndTitlesAndDescriptions._(
      descriptions:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ",
      title: "Modern Design",
      image: AppAssets.imageAndSvg.onboardingPageTwo,
    ),
    OnboardingImagesAndTitlesAndDescriptions._(
      descriptions:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ",
      title: "Styled Living",
      image: AppAssets.imageAndSvg.onboardingPageThree,
    ),
    OnboardingImagesAndTitlesAndDescriptions._(
      descriptions:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ",
      title: "Relaxing Furniture",
      image: AppAssets.imageAndSvg.onboardingPageFoure,
    ),
  ];
}

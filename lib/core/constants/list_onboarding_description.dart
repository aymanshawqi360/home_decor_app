import 'package:home_decor_app/core/helper/app_assets.dart';
import 'package:home_decor_app/features/onboarding/dowmin/entities/onboarding_modle.dart';

<<<<<<< HEAD:lib/core/constants/list_onboarding_description.dart
class ListOnboardingDescription extends OnboardingModle {
  ListOnboardingDescription({
    required String image,
    required String descriptions,
    required String title,
  }) : super(descriptions: descriptions, title: title, image: image);
  static List<ListOnboardingDescription> listOnboarding = [
    ListOnboardingDescription(
=======
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
>>>>>>> features/login_ui:lib/core/constants/onboarding_images_and_titles_and_descriptions.dart
      descriptions:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ",
      title: "Confortable Space",
      image: AppAssets.imageAndSvg.onboardingPageOne,
    ),
<<<<<<< HEAD:lib/core/constants/list_onboarding_description.dart
    ListOnboardingDescription(
=======
    OnboardingImagesAndTitlesAndDescriptions._(
>>>>>>> features/login_ui:lib/core/constants/onboarding_images_and_titles_and_descriptions.dart
      descriptions:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ",
      title: "Modern Design",
      image: AppAssets.imageAndSvg.onboardingPageTwo,
    ),
<<<<<<< HEAD:lib/core/constants/list_onboarding_description.dart
    ListOnboardingDescription(
=======
    OnboardingImagesAndTitlesAndDescriptions._(
>>>>>>> features/login_ui:lib/core/constants/onboarding_images_and_titles_and_descriptions.dart
      descriptions:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ",
      title: "Styled Living",
      image: AppAssets.imageAndSvg.onboardingPageThree,
    ),
<<<<<<< HEAD:lib/core/constants/list_onboarding_description.dart
    ListOnboardingDescription(
=======
    OnboardingImagesAndTitlesAndDescriptions._(
>>>>>>> features/login_ui:lib/core/constants/onboarding_images_and_titles_and_descriptions.dart
      descriptions:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ",
      title: "Relaxing Furniture",
      image: AppAssets.imageAndSvg.onboardingPageFoure,
    ),
  ];
}

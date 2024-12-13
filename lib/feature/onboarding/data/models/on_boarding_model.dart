import 'package:atele_online/core/utils/app_assets.dart';

class OnBoardingModel {
  final String imagePath;
  final String title;
  final String subtitle;

  OnBoardingModel(
      {required this.imagePath, required this.title, required this.subtitle});
}

List<OnBoardingModel> onBoardingData = [
  OnBoardingModel(
      imagePath: Assets.imagesOnboarding,
      title: 'From Every Placeon Egypt',
      subtitle: 'A Big Variety Of Dress All Over The Egypt'),
  OnBoardingModel(
      imagePath: Assets.imagesDrees5,
      title: 'Save your valuable time with ease!',
      subtitle:
          'Shop Locally With Ease And Book Appointments At The Atelier For Those Final Finishing Touches!'),
];

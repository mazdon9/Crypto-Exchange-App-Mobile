import 'package:crypto_exchange_app/core/constants/app_paths.dart';
import 'package:crypto_exchange_app/models/onboarding_data.dart';
import 'package:crypto_exchange_app/screens/onboarding/onboarding_screen.dart';

class AppData {
  final List<OnboardingData> onboardingDataList = [
    OnboardingData(
      imagePath: AppImagesPath.manWithCircleImages,
      title: 'Take hold of your finances',
      subtitle:
          'Lorem ipsum dolor sit amet, consectetur\nadipiscing elit. Ut eget mauris massa pharetra.',
    ),
    OnboardingData(
      imagePath: AppImagesPath.phoneWithTradingImages,
      title: 'Smart trading tools',
      subtitle:
          'Lorem ipsum dolor sit amet, consectetur\nadipiscing elit. Ut eget mauris massa pharetra.',
    ),
    OnboardingData(
      imagePath: AppImagesPath.laptopTechImages,
      title: 'Invest in the future',
      subtitle:
          'Lorem ipsum dolor sit amet, consectetur\nadipiscing elit. Ut eget mauris massa pharetra.',
    ),
  ];
}

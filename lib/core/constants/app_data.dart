import 'package:crypto_exchange_app/core/constants/app_paths.dart';
import 'package:crypto_exchange_app/models/onboarding_data.dart';

class AppData {
  final List<OnboardingData> onboardingDataList = [
    OnboardingData(
      imagePath: AppPaths.manWithCircleImages,
      title: 'Take hold of your finances',
      subtitle:
          'Lorem ipsum dolor sit amet, consectetur\nadipiscing elit. Ut eget mauris massa pharetra.',
    ),
    OnboardingData(
      imagePath: AppPaths.phoneWithTradingImages,
      title: 'Smart trading tools',
      subtitle:
          'Lorem ipsum dolor sit amet, consectetur\nadipiscing elit. Ut eget mauris massa pharetra.',
    ),
    OnboardingData(
      imagePath: AppPaths.laptopTechImages,
      title: 'Invest in the future',
      subtitle:
          'Lorem ipsum dolor sit amet, consectetur\nadipiscing elit. Ut eget mauris massa pharetra.',
    ),
  ];

  static final List<String> coins = [
    'btcusdt',
    'ethusdt',
    'bnbusdt',
    'solusdt',
    'adausdt',
    'xrpusdt',
    'dotusdt',
    'maticusdt',
    'dogeusdt',
    'avaxusdt',
    'linkusdt',
    'ltcusdt',
    'atomusdt',
    'nearusdt',
    'filusdt',
    'uniusdt',
    'trxusdt',
    'xlmusdt',
    'apeusdt',
    'egldusdt'
  ];
}

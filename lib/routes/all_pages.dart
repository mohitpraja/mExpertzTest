import 'package:get/get.dart';
import 'package:mexpertztest/feature/dashboard/dashboard_binding.dart';
import 'package:mexpertztest/feature/dashboard/dashboard_view.dart';
import 'package:mexpertztest/feature/home/home_binding.dart';
import 'package:mexpertztest/feature/home/home_view.dart';
import 'package:mexpertztest/feature/login/login_binding.dart';
import 'package:mexpertztest/feature/login/login_view.dart';
import 'package:mexpertztest/feature/onboard/onboard_binding.dart';
import 'package:mexpertztest/feature/onboard/onboard_view.dart';
import 'package:mexpertztest/feature/otp/otp_binding.dart';
import 'package:mexpertztest/feature/otp/otp_view.dart';
import 'package:mexpertztest/feature/signup/signup_binding.dart';
import 'package:mexpertztest/feature/signup/signup_view.dart';
import 'package:mexpertztest/feature/splash/splash_binding.dart';
import 'package:mexpertztest/feature/splash/splash_view.dart';
import 'package:mexpertztest/routes/routes.dart';

List<GetPage> allPages = [
  GetPage(name: Routes.splash, page: () => SplashView(),binding: SplashBinding()),
  GetPage(name: Routes.home, page: () => HomeView(),binding: HomeBinding()),
  GetPage(name: Routes.onboard, page: () => OnboardView(),binding: OnboardBinding()),
  GetPage(name: Routes.login, page: () => LoginView(),binding: LoginBinding()),
  GetPage(name: Routes.signup, page: () => SignupView(),binding: SignupBinding()),
  GetPage(name: Routes.otp, page: () => OtpView(),binding: OtpBinding()),
  GetPage(name: Routes.dashboard, page: () => DashboardView(),binding: DashboardBinding()),
];
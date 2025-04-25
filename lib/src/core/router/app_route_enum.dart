enum AppRouteEnum {
  infoPage,
  loginPage,
  signUpPage,
  profilePage,
  welcomePage,
  postPage,
  homePage,
}

extension AppRouteExtension on AppRouteEnum {
  String get name {
    switch (this) {
      case AppRouteEnum.infoPage:
        return "/info";

      case AppRouteEnum.loginPage:
        return "/login";

      case AppRouteEnum.signUpPage:
        return "/sign_up";

      case AppRouteEnum.profilePage:
        return "/profile";

      case AppRouteEnum.welcomePage:
        return "/welcome";

      case AppRouteEnum.postPage:
        return "/post";

      default:
        return "/home";
    }
  }
}

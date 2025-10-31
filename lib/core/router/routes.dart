enum Routes {
  splash("/splash"),
  onboarding("/onboarding"),
  login("/login"),
  register("/register"),
  setUpAccount("/set_up_account"),
  home("/home");

  const Routes(this.path);

  final String path;

  static bool isAuthRoute(String path) => {
    onboarding.path,
    login.path,
    register.path,
  }.contains(path);

}

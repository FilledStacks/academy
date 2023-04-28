enum Environment {
  development(path: 'assets/environments/development.env'),
  staging(path: 'assets/environments/staging.env'),
  production(path: 'assets/environments/production.env');

  final String path;
  const Environment({this.path = 'assets/environments/development.env'});
}

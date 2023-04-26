enum Environment {
  development(path: 'environments/.development.env'),
  staging(path: 'environments/.staging.env'),
  production(path: 'environments/.production.env');

  final String path;
  const Environment({this.path = 'environments/.development.env'});
}

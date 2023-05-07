import 'package:gsheets/gsheets.dart';
 Worksheet? sheet;
class UserSheetsApi {
  static const _credentials = r'''
{
  "type": "service_account",
  "project_id": "testingsheets-383803",
  "private_key_id": "d6074131a997a368d8c3829b735a7ea5b1a44c79",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQDI6Zpp4VwXspGQ\nwW7jMQEX6bfDKJ9xtvgO2mubIitaa+hj7L4ZUPT6BWJrSbdgZCImcvJU+h2iq8B1\noQKYxbSWJ3QtE6k+5iBkrdZE5dw/R3xUMEg/BijROW7v8Zxcp6BFkw/lZV/kZuFl\nykTU8ydJfHkk05dfSZwON+It6nEmlMuh3uopgFSwY86sgUiOLev/QF2zD7ybdWEn\nWB+KfQEcr2xOTHXQ9+zOR25w6/GZWc2E+zilUu04pfYAcMiASHwd4uKfXsp6iRAj\n8jvQgGqJLsWmK1E483iov+n+K3HMkWCoJIeTnpGqT1U1MywPzbStFu0G8+RSqtkH\nH2gP3gNpAgMBAAECggEACOtiCRBRs9WgI8KKpzhuOX8NQvNDPNuoIJSu0UjPjuia\nfREuEVaoQY9KosO3ieZ4I6fXvVELTsT8Otymjly8myvuOvAUA/BYgM+84vsnb4G/\nccdg9bdSyZMYqztZOz3P3jbcrkz1WGD+4bN8oc2XsWn+wNVJ85eDf5gYiPxPAKzn\nJv58LDNOwvO6/C3EDpbUIdfDzJtf1kEA2HbFOS77iYHju/I3KHOxR45eMfFofObh\nsvwWMaqHr0XDxoZVteP5tfcUzMXWCVjlHQOXSl0HZdjpFf6DfCQs1qovHVlo0xr/\ntVm0TqLTrADskeLpM/W3/uMJ/cFw9h7T8Gbyb5C1OQKBgQD+HV9OlUQUHS8rnCw3\nfq029smx9NBaLoZ1HO6DHi/o3tLpmRbEs6j4HTVFa75Bpygk0UeYxq9EpFdxWaSx\nc2rOkBeQDZ0g1ohx4WMH5dVQOwwcQLR7V0Pa5Yk+dhdgQwk08/1qOK/7g5H43jTB\nFpCHUuCOo+vgjqB4p7W4qRdr1QKBgQDKZy++ia23NBd5f2UEAdSr/85LRqg6ByVK\nJXVih//HNLeUGZBl3s5t9fPIS2ItkKvSJ+h9RK9rAV8wBqZpH3V93qxT26d1iSwW\nakSP/+7rERa+ySU6kd38zaNaqwHiPhkaS6GUX10SZ59DMSksB6HAPQqbB0QimZrk\nEeffqV6nRQKBgQCL0OdummxR0NjyWsRtaFKv6kuBkZzN8cljSJ7nH8XmkCtmAihn\n5B41HgUAhE6zWuCYmVmWcsNetjmykUsvo7yBmQCN7x+kQMXkOsm9P7UFpud76BIl\nxxb7qs2/w0QLX/cB3rlxJ22Uqoi3cLOABgVRn8UUVpbjADbFDCnNR6QuXQKBgHgw\nwCxQS4Tf/RSb7ttrTuP4WoNe6OTUe3NFPSiOg/fCOUVLzPCBV2n6xJHrGdje8Pkx\n06AXmmdbgC/fsw/3q2hcQ07kv9NO6oxA/IfaPgD+u9f9UAswtXa6kkd0BwFXSMbR\npJib7IPSXsOivMU1nvquBM88iFxXhJ/sdhnd1KRVAoGBAOJcDXBTFp/fAu5w0N4K\nwBp9OIo43hvZwZ8u8b5Ot/5dtalHNFc882uagjfxzIKWnosdnHZdqWdlCWJbnSF9\n85VKYtonPmW3Qdqnb5wRrXWQeKzfLevk4fWZWTj5FUZ0DNeQ9iYFPw/y6y09or6F\ni7hQRuqT+UzaxebxpxMfvk6J\n-----END PRIVATE KEY-----\n",
  "client_email": "flutter-testsheet@testingsheets-383803.iam.gserviceaccount.com",
  "client_id": "114999769278435666518",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/flutter-testsheet%40testingsheets-383803.iam.gserviceaccount.com"
}
''';
  static const _spreadsheetId = '1xsffvoxdSmm1AFlD9lQwMnqnvaeTr68ymFnbTqbtR-A';
  static final _gsheets = GSheets(_credentials);
  static Future init(String worksheetTitle) async {
   try {
    final spreadsheet = await _gsheets.spreadsheet(_spreadsheetId);
    sheet = spreadsheet.worksheetByTitle(worksheetTitle);
    // sheet!.cells.cell(row: 1, column: 1);
    // String name = await _userSheet!.values.value(column: 2, row: 1);
    // return name;
    // final firstRow = UserFields.getFields();
    // _userSheet!.values.insertRow(1, firstRow);
   } catch (e) {
     // ignore: avoid_print
     print('Init Error:$e');
   }
  }
  // static Future<Worksheet?> getWorkSheet(
  //   Spreadsheet spreadsheet, {
  //    String? title,
  // }) async {
  //     return spreadsheet.worksheetByTitle(title!);  //هناخد ده
  // }
  // static Future<User?> getById(int id) async {
  //   if (sheet == null) return null;
  //   final json = await sheet!.values.map.rowByKey(id, fromColumn: 1);
  //   return json ==null ? null : User.fromJson(json);
  // }

  // static Future insert(List<Map<String,dynamic>>rowList)async{
  //   if (_userSheet==null)return;
  //   _userSheet!.values.map.appendRows(rowList);
  // }

}

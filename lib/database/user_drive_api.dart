import 'package:googleapis/drive/v3.dart' as drive;
import 'package:googleapis_auth/auth_io.dart' as auth;
import 'package:students_app/database/view_files.dart';

String? folderId;

class GoogleDriveApi {
  static final credentials = auth.ServiceAccountCredentials.fromJson({
    "type": "service_account",
    "project_id": "testingsheets-383803",
    "private_key_id": "be34afc7f8e1a0ecf9fbf88e33fada1c9d80912f",
    "private_key":
        "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQCf4Zx7mYMIp9Om\ncNPxn9bc8AMKya4m0y/r2P8loPfFhcpI3k79KgV8rRSbFPMG/2qF6ND36qMrKnYS\nU/YVg0bk7t27zDx9cLHElon2047iDZ6ttdU5xPkcrNtV8p+M1aKzisywmaYnK59n\nmzS5sRCvvvuuEFZi8btIlJSz/SpPch9AoouSKUrHLKTeoftcYz8VDIGN4st52sqK\nkiM87FnL33apO+rSTuTv9xuMVeuDIiO6WVSn7b03s9fqjboEKRiHmi4eTUEWHKWT\nRZfxNrKsfBlkqvo/+as6wHLPFtH7qaZi08XWpgcwUSEOvODUxWQZFd0uBUnSEiPa\nIMtAKoEPAgMBAAECggEAFdJkWlZklRza/X+u3e7UE8nKkIFgfLocc1Nl18v1pYcS\nSgnVvCYtI4w4IMamORFJh8d0JjJnXO/pt6ywDNWjKoITz5sbsn9cNBnb8M2FVgNH\n4ivMU5s36RsKwNthvYY3M8xBDeWa0QPaOPjtJF8viN1HWsWuFMkrp8dn2H04dilF\nGj3Jbycq1db2uCSKxM7qEOLDDXmdGl4zDf1IO+CanX1zqIwmyrqkz73jQSpd+WzD\n1459RGKZw/aZh/ublnF6rKNkg4RmN8q58YrTrtcJsGeqHK41VbTFWMqpXxVEmQcN\nixqev0YWHa+UeZp+HTRLCq2Z3yDxZiaoJbHddeKuUQKBgQDWkKs61YldoZugNYX+\ngBv53vhvPY7eQsjgYuWsvH3gDUsbYEpVRGX2OLmyUqBpMtHEmBTq+JLcu9IjWrSv\nW3u3PGVJ7wcWvWBMvkoQ5A9/nMKpk/x4WnkaNNj1Cc/M6cKEzhONVwwZIc20g6I+\nZzKClRbNRZO7rMcSaV5mWzZpOQKBgQC+wZH0eEO3Fajtj81mzJqkYFNScWSJtMk8\n8gC2O34Ac/eMBhDTqWaOUJdGn4TS0202V5NZmsC6k2V0YXOvKVG80KgbxBjeW1d4\nrXc+FONp6XqS69UOpht7QZqddaPevXxdXMRJ9ZMxdjW/GtwjT0EUbiQxvmg10t4x\nDgWzzhUkhwKBgCrCAZ1j2E/0WJMAl4cz+F8+87sXRVU9cdJlYuedWGhBvenism1z\nh+4dN8Q1ewn7upm2xNReXMXoF+Q7uy4GyQym2Hh3Ta5WZs5kTVY4XG5Nyu0INJO3\nU9LJHUMXhXWMT9svRe4wnpSTi+6hHL/ayNIE69pUNzB7KeCdZtZ27szhAoGBAKpg\n6qSY5qKYzhGh56xyA43eG43/ifUVbMjqvogGCz0MV4bRxCXJoLhsczG5OUG1Zk6r\nWgkmmA4NqQiSImnJViB3ni9ur2er3i0DgwYIUjc/OyQPUHWNF+63YgpSENPaG0Ko\noQoONjJviwHuU8GWAGLnHZzwnNO2TI80HxPCdk/xAoGBAMQHwxvzn0uCuKqNxFtH\nFWJocYRRDG1010RWkdwflcRsCIzLEvxSzB61h49LHXdfKnJTrOKIH7XEKAWxR8fm\nWgziy2Anz8386WJRKvPzT6gOFmyqpFBweLgFTuXE38oyx334ooqrx0hjbvv3gzkv\nLoOIE/dsb7DzRIcnjlNVfX4y\n-----END PRIVATE KEY-----\n",
    "client_email":
        "subjects-data@testingsheets-383803.iam.gserviceaccount.com",
    "client_id": "101816782860670409652",
    "auth_uri": "https://accounts.google.com/o/oauth2/auth",
    "token_uri": "https://oauth2.googleapis.com/token",
    "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
    "client_x509_cert_url":
        "https://www.googleapis.com/robot/v1/metadata/x509/subjects-data%40testingsheets-383803.iam.gserviceaccount.com",
    "universe_domain": "googleapis.com"
  });
  static final scopes = [drive.DriveApi.driveReadonlyScope];

  static Future init(String folderId) async {
    final client = await auth.clientViaServiceAccount(credentials, scopes);
    final driveApi = drive.DriveApi(client);
    final fileList = await driveApi.files.list(
        q: "'$folderId' in parents and trashed=false",
        $fields: 'files(id, name, thumbnailLink)');
    final files = fileList.files!.asMap();
    // print(files[0])
    // print(files[0]!.name);
    // const folderQuery = "mimeType='application/vnd.google-apps.folder' and trashed=false and '16xEfrgw4JjaFyhejwH6D2C8nU6bj8zXs' in parents";
    // final folderList = await driveApi.files.list(q: folderQuery);
    // final files = await driveApi.files.list();
    // final fileId =  files.files?.firstWhere((file) => file.name == '2.pdf').id;
    // final first =  files.files!.asMap();
    // // final file = await driveApi.files.get(fileId!);
    // final url = 'https://drive.google.com/file/d/$fileId/view';
    // // await launch(url);
    // print(first.length);
    return files;
  }
  
}
 Future updatefiles(String id) async {
    folderId = id;
    files = await GoogleDriveApi.init(folderId!);
  }

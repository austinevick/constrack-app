import 'enum.dart';

extension ResponseEnumParsing on Response {
  String value() {
    return toString().split('.').last;
  }

  static Response fromString(String status) {
    return Response.values.firstWhere((element) => element.value() == status);
  }
}

// ignore_for_file: constant_identifier_names

class ErrorMessages {
  static const String NO_INTERNET_CONNECTION = "لا يوجد اتصال بالانترنت";
  static const String SOMETHING_WENT_WRONG_TRY_AGAIN =
      "حدث خطأ ما، الرجاء المحاولة مرة أخرى";

  // Attendance
  static const YOU_DIDNT_LEAVE_YET = "لم تغادر بعد";
  static const YOU_HAVE_NOT_ATTENDED = "لم تحضر بعد";
  static const WRONG_CREDINTIALS = "اسم المستخدم او كلمة المرور خطأ";

  static Map<String, dynamic> map = {
    "NO_INTERNET_CONNECTION": NO_INTERNET_CONNECTION,
    "SOMETHING_WENT_WRONG_TRY_AGAIN": SOMETHING_WENT_WRONG_TRY_AGAIN,
    "YOU_DIDNT_LEAVE_YET": YOU_DIDNT_LEAVE_YET,
    "YOU_HAVE_NOT_ATTENDED": YOU_HAVE_NOT_ATTENDED,
    "WRONG_CREDINTIALS": WRONG_CREDINTIALS,
  };
}

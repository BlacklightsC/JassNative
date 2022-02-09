library JNString
static if not REFORGED_MODE then
    native JNStringPos takes string str, string sub returns integer
    native JNStringReverse takes string str returns string
    native JNStringTrim takes string str returns string
    native JNStringTrimStart takes string str returns string
    native JNStringTrimEnd takes string str returns string
    native JNStringRegex takes string str, string regex, integer index returns string
    native JNStringCount takes string str, string sub returns integer
    native JNStringContains takes string str, string sub returns boolean
    native JNStringSplit takes string str, string sub, integer index returns string
    native JNStringReplace takes string str, string old, string newstr returns string
    native JNStringInsert takes string str, integer index, string val returns string
    native JNStringSub takes string str, integer start, integer length returns string
    native JNStringLength takes string str returns integer
    native JNStringEncrypt takes string plainText, string key returns string
    native JNStringDecrypt takes string cipherText, string key returns string
    native JNStringFromBase64 takes string str returns string
    native JNStringToBase64 takes string str returns string
endif
endlibrary
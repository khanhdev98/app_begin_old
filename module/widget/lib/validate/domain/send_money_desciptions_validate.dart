// Todo: Cho phép chữ không dấu, số, khoảng trắng và không được nhập ký tự đặc biệt
bool isValidDescriptionSendMoneyRequest(String value) =>
    !RegExp("[\$&+,:;=?@#|'<>.^*()%!/_{}\"`~\\[\\]-]").hasMatch(value);

bool isLessThan150(String value) => value.length <= 150;

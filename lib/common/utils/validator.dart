class Validator {

  Validator._();

  static String? validateName(String? value) {
    final condition = RegExp(r"\b([A-ZÀ-ÿ][-,a-z. ']+[ ]*)+");
    if (value != null && value.isEmpty) {
      return "Esse campo não pode ser vazio";
    }
    if(value != null && !value.contains(condition)){
      return "Nome inválido. Digite um nome válido.";
    }
    return null;
  }

  static String? validateEmail(String? value) {
    final condition = RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?");
    if (value != null && value.isEmpty) {
      return "Esse campo não pode ser vazio";
    }
    if(value != null && !value.contains(condition)){
      return "Email inválido. Digite um email válido.";
    }
    return null;
  }

  static String? validatePassword(String? value){
    final condition = RegExp(r"^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$");
    if(value != null && value.isEmpty){
      return "Esse campo não pode ser vazio";
    }
    if(value != null && !value.contains(condition)){
      return "Formato da senha inválido.";
    }
    return null;
  }

  static String? validateConfirmPassword(String? first, String? second) {
    if(first != null && first.isEmpty){
      return "Esse campo não pode ser vazio";
    }
    if(first != second){
      return "As senhas estão diferentes";
    }
    return null;
  }

}
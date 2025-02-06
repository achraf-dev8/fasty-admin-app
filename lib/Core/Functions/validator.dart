


String? validInput(String val, int min, int max, String type, var parentController){

  RegExp? regExp;
  if(val.isEmpty){
    if(type == "Old Price") return null;
    return type != "Address" || type != "email" ? "Enter a $type" : "Enter an $type";
  }
  
  if(type == "First Name" || type == "Last Name"){

     regExp = RegExp(r"^[A-Za-z]+(([',. -][A-Za-z ])?[A-Za-z]*)*$");
  }else if(type == "Address"){

    regExp = RegExp(r"^[a-zA-Z0-9\s,.'-]*$");

  }else if(type == "Email"){
    
   regExp = RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
    caseSensitive: false,);
    
  }else if(type == "Email or phone number"){
       regExp = RegExp(
  r'^(?:\+?[1-9]\d{1,14}|[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,})$',
  caseSensitive: false,
);
  }else if(type == "Phone number"){
    regExp = RegExp(r'^[\d\s\-()+]{7,}$',
    caseSensitive: false,);
  }
  
  else if(type == "Password"){
    const String wrongMsg= "Password must be at least 8 characters, include at least one letter and one number.";

   if (val.length < 8) {
    return wrongMsg;
  }
  
  final letterRegExp = RegExp(r'[a-zA-Z]');
  final numberRegExp = RegExp(r'\d');
  
  bool hasLetter = letterRegExp.hasMatch(val);
  bool hasNumber = numberRegExp.hasMatch(val);
  if(!hasLetter || !hasNumber){
    return wrongMsg;
  }}

  if(regExp != null){
    if(!regExp.hasMatch(val)){
      return "$type is not valid";
    }
    
  }

  if(val.length< min){
    return "$type is too short";
  }
    if(val.length> max){
    return "$type is too long";
  }

  if(type == "Old Price" || type == "Price"){
    final doubleValue = double.tryParse(val);
    final intValue = int.tryParse(val );
    if(doubleValue == null && intValue == null){
      return "Enter a valid price";
    }
  }

    if(parentController != null){
        return parentController.loginExists;  
    }
    
    return null;
}
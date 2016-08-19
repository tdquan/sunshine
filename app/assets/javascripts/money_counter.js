function digitCheck(x,y){
  var digitsOld = splitToArray(x),
  digitsNew = splitToArray(y);
  for (var i = 0, c = digitsNew.length; i < c; i++){
    if (digitsNew[i] != digitsOld[i]){
      animateDigit(i, digitsOld[i], digitsNew[i]);
    }
  }

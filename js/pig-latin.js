function translate(phrase, translation=[]){
  phrase.split(" ").forEach(function(word){
    translation.push(pigLatinify(word));
  });
  return translation.join(" ");
};

function pigLatinify(word){
  if (word[0].match(/[aeiou]/) && !(word[0]="u" && word[word.length-1]=="q")){
    return word + 'ay';;
  }
  else{
    return pigLatinify(word.substring(1, word.length) + word[0]);
  };
};

module.exports.translate = translate;

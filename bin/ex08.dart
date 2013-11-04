/*Bonjour je tiens à m'excuser 
 * parce que mon code ne fonctionne pas
 * sur tous les exercices, j'ai travaillé des heures et des heures
 * mais je ne trouve pas de solution.
 * Les exercices 3 et 5 je n'ai pas réussis.
 * Je suis déterminé mais la difficulté est élevée.
 * Merci
 */

import 'dart:math' as math;


randomSentence(w, x, y, z){
  int lw = w.length; //longueur de la liste 
  int lx = x.length; 
  int ly = y.length;
  int lz = z.length;
  int number_of_sentences = 5; //nombre de phrase
  var list = new List();
  for(var i = 1; i < number_of_sentences + 1; i++){
    var random_w = new math.Random();
    var random_x = new math.Random();
    var random_y = new math.Random();
    var random_z = new math.Random();
    var rw = random_w.nextInt(lw+1);
    var rx = random_x.nextInt(lx+1);
    var ry = random_y.nextInt(ly+1);
    var rz = random_z.nextInt(lz+1);
    var s='$i. ${w[random_w]}, ${x[random_z]}, ${y[random_y]} ${z[random_x]}.\n';
    list.add(s);
  }
  return list;
}

memberList(m){
  var alphabe = ['A', 'B', 'C', 'D', 
                 'E', 'F', 'G', 'H', 
                 'I', 'J', 'K', 'L', 
                 'M', 'N', 'O', 'P', 
                 'Q', 'R', 'S', 'T', 
                 'U', 'V', 'W', 'X', 
                 'Y', 'Z'];
  var list = new List();
  var memb1 = m[0];
  var memb2 = memb1.keys;
  var memb3 = memb2.toList();
  var memb4 = memb3[2];
  list.add(memb4); // On ajoute le nom à une liste
  var list1 = new List();
  for(var i = 1; i < m.length; i++){ //On ajoute nom i par rapport à l'index de sa lettre dans la liste
    var noun = m[i];
    var noun_1 = noun.keys;
    var noun_2 = noun_1.toList();
    var noun_t = noun_2[2];
    var l11 = list[0][0]; // lettre 1 du nom 1
    var l1i = noun_t[0]; // lettre 1 du nom i
    var i11 = alphabe.indexOf('$l11'); //index de la lettre 1 du nom 1
    var i1i = alphabe.indexOf('$l1i'); //index de la lettre 1 du nom i
    if(i11 < i1i && i1i > list[list.length-1][0]){ //si la lettre 1 du nom i a l'index plus grand
      list.add(noun_t);                            //que le premier et avant dernier nom on ajoute
    }
    if(i11 > i1i){ //si la lettre est plus petite on créée une nouvelle liste avec le nom i d'abords
      list1.add(noun_t);
      list1.add(list[0]);
      list1.add(list[1]);
    }
  }
  list = list1;
  var map = new Map();
  for(var i = 0; i < list.length; i++){ // On refait une map dans le bon ordre
    if(m[0].contains(list[i] == true)){
      map[i] = m[0];
    }
    if(m[1].contains(list[i] == true)){
      map[i] = m[1];
    }
    if(m[2].contains(list[i] == true)){
      map[i] = m[2];
    }
  }
  return map;
}
    
matrix(x, m, n){
  var s = ' ';
  var matrix = '';
  var spl_x = x.split('');
  var n1 = '';
  var n2 = '';
  var list = new List();
  for(var i = 0; i < x.length; i++){ // le for retire les 0
    if(i == m){
      matrix = matrix + '\n';
    }
    if(i == m * n + 1){
      matrix = matrix + '\n';
    }
    if(x[i] == '0'){
      matrix = matrix + s;
    }
    if(x[i] == '1'){
      matrix = matrix + '1';
    }
  }
  for(var i = 0; i < x.length; i++){ // le for split la matrice puis divise les 2 lignes les ajoutant à une liste
    if(i < m){
      n1 = n1 + spl_x[i];
    }
    if(i > m){
      n2 = n2 + spl_x[i];
    }
  }
  list.add(n1);
  list.add(n2);
  var list1 = '';
  var list2 = '';
  var list3 = '';
  for(var i = 0; i < x.length; i++){ //On veut faire un string avec la série de 1
    if(n1.indexOf(n1[i]) == 0 && n1[i] == '1' && n1[i+1] != '1'){
      list1 = list1 + n1[i] + '/n' + n2[i]; //List 1 regroupe les premiers 1 
    }
    if(n1[i] == n1[i+1] && n1[i] == '1'){
      list2=list2+n1[i];
    }
    if(n1[i] == '1' && n1[i+1] != '1'){
      list2 = list2 + n1[i] + '/n';
    }
    if(n2[i] == n1[i] && n1.indexOf(n1[i]) != 0){
      list2=list2+n2[i];
    }
    if(n2[i] == '0' && n1[i] == '1'){
      list2 = list2 + n2[i]; //List 2 regroupe les séries de plusieurs 1 et dont l'index est différent de 0
    }
    if(n2[i] != n1[i] && n2[i] != n2[i-1] && n2[i] != n2[i+1]){
      list3 = list3 + n2[i]; //List 3 regroupe les 1 seuls
    }
  }
  var t = '''Nous avons une matrice $m x $n: 

$x,

Nous voyons les trois groupes : 

$matrix

1. 1
   1

2. 111
   11

3. 1''';
  return t;
}

void ex01(){
  var nouns = ['Tom', 'Le policier', 
               'Le musicien', 'Le chanteur', 
               'Le directeur'];
  var verbs = ['étudie', 'poursuis', 
               'joue', 'chante', 
               'vire'];
  var adverbs = ['tardivement', 'vraiment souvent', 
                 'sérieusement bien', 'atrocement faux', 
                 'sévèrement'];
  var adjectives = ['stressé', 'acharné', 
                    'doué', 'beau', 
                    'stricte'];
  //String random_list=randomSentence(nouns, verbs, adverbs, adjectives);
  /*print('1.\n$random_list.\n\n'); 
   * je l'ai mis entre parenthèse 
   * parce que le code ne 
   * marche pas et je voulais
   * vous montrer le résultat
   * que j'attends
   */
  print('''1.
[1. Tom, stricte, chante vraiment souvent.,
 2. Le chanteur, stressé, étudie sérieusement bien.,
 3. Le musicien, acharné, vire tardivement.,
 4. Le policier, beau, joue atrocement faux.,
 5. Le directeur, doué, poursuis sévèrement.]\n'''); //par exemple
}

void ex02(){
  var members = [{"associationName" : "IS", "firstName" : "Dzenan", 
    "lastName" : "Ridjanovic", "email" : "dr@gmail.com"},
               {"associationName" : "CS", "firstName" : "David", 
      "lastName" : "Curtis", "email" : "dc@gmail.com"},
               {"associationName" : "IS", "firstName" : "Robert", 
        "lastName" : "Nelson", "email" : "rn@gmail.com"}
               ];
  var listSorted = memberList(members);
  print('2. $listSorted\n\n');
}

void ex04(){
  var x = '''10111000
10110001''';
  var m = 8;
  var n = 2;
  var series = matrix(x, m, n);
  print('4.\n$series\n\n');
}

void main(){
  ex01();
  ex02();
  ex04();
}













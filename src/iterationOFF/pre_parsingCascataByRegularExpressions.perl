#!/usr/bin/perl -X

##flag -a=analisador -c=corrector
$flag = shift(@ARGV);

## -a por defeito
if (!defined $flag) {
    $flag = "-a";
}
  
#fronteira de frase:
$Border="SENT";

#identificar nomes de dependencias lexicais (idiomaticas)
$DepLex = "^<\$|^>\$|lex\$" ;


#string com todos os atributos:
$b = "[^ _<>]*" ;

$a = "\\_<${b}>" ; ##todos os atributos
$l =  "\\_<${b}" ; ##atributos parte esquerda
$r =  "${b}>" ;  ##atributos parte direita


###########################GENERATED CODE BY COMPI#############################################

#__ICODE__

####################################END CODE BY COMPI################################################



$i=0;
$listTags="";
$seq="";
$CountLines=0;

$j=0;
while (<>) {
   chop($_);

  ($token, $info) = split(" ", $_);

  if ( ($CountLines % 100) == 0) {;
       printf  STDERR "- - - processar linha:(%6d) - - -\r",$CountLines;
  }
  $CountLines++;


  ###Convertimos characteres significativos na sintaxe de DepPattern em tags especiais
  if ($token =~ /:/) {
      ConvertChar ('\:', "Fd");
  }
  if ($token =~ /\|/) {
      ConvertChar ('\|', "Fz");
  }
  if ($token =~ /\>/) {
      ConvertChar ('\>', "Fz1");
  }
  if ($token =~ /\</) {
      ConvertChar ('\<', "Fz2");
  }


  ##organizamos a informacao de cada token:
   if ($info ne "") {
     (@info) = split ('\|', $info);
     for ($i=0;$i<=$#info;$i++) {
       if ($info[$i] ne "") {
        ($attrib, $value) = split (':', $info[$i]) ;
        $Exp{$attrib} = $value ;
       }
     }
   }

   ##construimos os vectores da oracao
   if ($Exp{"tag"} ne $Border) {
     $Token[$j] = $token ;
     if ($info ne "") {
       $Lemma[$j] = $Exp{"lemma"} ;
       $Tag[$j] = $Exp{"tag"} ;
       $Attributes[$j] = "";
       foreach $at (sort keys %Exp) {
	 if ($at ne "tag"){
	     $Attributes[$j] .= "$at:$Exp{$at}|" ; 
             $ATTR[$j]{$at} = $Exp{$at} ;
         }
       }
       foreach $at (sort keys %Exp) {
	   delete $Exp{$at};
       }
     }

     $j++;
     #print STDERR "$j\r";
   }

   elsif ($Exp{"tag"} eq $Border) {
     $Token[$j] = $token ;
     $Lemma[$j] = $Exp{"lemma"} ;
     $Tag[$j] = $Exp{"tag"} ;
     $Attributes[$j] = "";
     foreach $at (sort keys %Exp) {
         if ($at ne "tag"){
             $Attributes[$j] .= "$at:$Exp{$at}|" ;
             $ATTR[$j]{$at} = $Exp{$at} ;
         }
     }
     foreach $at (sort keys %Exp) {
           delete $Exp{$at};
     }


     ##construimos os strings com a lista de tags-atributos e os token-tags da oraçao
     for ($i=0;$i<=$#Token;$i++) {

       ReConvertChar ('\:', "Fd", $i);
       ReConvertChar ('\|', "Fz", $i);
       ReConvertChar ('\>', "Fz1", $i);
       ReConvertChar ('\<', "Fz2", $i);

       $listTags .= "$Tag[$i]_${i}_<$Attributes[$i]>" ;
       $seq .= "$Token[$i]_$Tag[$i]_${i}_<$Attributes[$i]>" . " ";

	 
      }##fim do for
     # $seq .= "\." . "_" . $Border ;
     


###########################BEGIN GRAMMAR#############################################

#!/bin/bash

#shopt -s extglob


###################################################################
# Script para facilitar o uso dos parser gerados polo compilador compi-beta.
#   - - A vari�bel DEPPATTERN_DIR estabelece o PATH dos programas.
#   - - O sistema inclui o PoS tagger CitiusTools
#
# Pablo Gamallo
# Grupo ProLNat@GE
###################################################################

############################
# Config
############################

DEPPATTERN_DIR="/home/gamallo/DepPattern/devel/DepPattern"
PROGS=$DEPPATTERN_DIR"/scripts"
DIRPARSER=$DEPPATTERN_DIR"/parsers"



############################
# Functions
############################

help()
{
  echo "Syntax: deppattern.sh  <type_of_output> <lang> <file> [parser] [grammar]
      
      type_of_output= -a (dependency analysis), -fa (full dependency analysis) -c (correct tagged text)
      language=gl, es, en, pt, metaromance
      file=path of the file input 
            parser=path of the parser, or name of the parser generated from grammar (i.e. metaromance)
            grammar=path of the file grammar
         
"
  exit
}


# Par�metros obrigatorios
[ $# -lt 3 ] && help
FLAG=$1
LING=$2
FILE=$3

# Par�metros opcionais
GRAMMAR=""
PARSER="user_parser" #por defeito
[ "$4" != "" ] && PARSER=$4
[ "$5" != "" ] && GRAMMAR=$5 


SENT=./CitiusTools/$LING"/sentences-"$LING"_exe.perl" 
TOK=./CitiusTools/$LING"/tokens-"$LING"_exe.perl" 
SPLIT=./CitiusTools/$LING"/splitter-"$LING"_exe.perl" 
NER=./CitiusTools/$LING"/ner-"$LING"_exe.perl"
TAGGER=./CitiusTools/$LING"/tagger-"$LING"_exe.perl" 
#NEC=$LING"/nec-"$LING"_exe.perl"


if [ "$FLAG" != "-a" ] &&  [ "$FLAG" != "-c" ] && [ "$FLAG" != "-fa" ] ; then
  help;
  echo "help" ;
fi

case $LING in
  es) ;;
  en) ;;
  gl) ;;
  pt) ;;
 # fr) ;;
  *) help
esac

#echo "$FLAG $TAGGER - $LING - $FILE - $GRAMMAR - $PARSER"

##Lan�ar o Compi se houver gram�tica
if [ "$GRAMMAR" != "" ]; then
        ruby compi-beta.rb $GRAMMAR $PARSER ;
        NAMEPARSER="./$PARSER"

#Lan�ar o parser MetaRomance no caso de nao houver gramatica e fosse especificado
elif [ "$GRAMMAR" == "" ] && [ "$PARSER" == "metaromance" ]; then
      NAMEPARSER="$DIRPARSER/parserDefault-metaromance"
     
#Lan�ar o parser especificado no caso de nao houver gramatica
elif [ "$GRAMMAR" == "" ] && [ "$PARSER" != "user_parser" ]; then
      NAMEPARSER="./$PARSER"
      NAMEPARSER=`echo $NAMEPARSER | sed "s/.perl$//" | sed "s/^\.\/\//\//"`
# Lan�ar o parser por defeito
else
     NAMEPARSER="$DIRPARSER/parserDefault-$LING"
     NAMEPARSER=`echo $NAMEPARSER | sed "s/.perl$//"`
fi


FILTER="$PROGS/AdapterFreeling-${LING}.perl"


#NAMEFILE=`basename $FILE`;

ZIP=`echo $FILE |awk '($0 ~ /(gz$|zip$)/) {print "zip"}'`


if [ "$ZIP" == "zip" ] ; then
 zcat $FILE |tr -d '\015' | $SENT  | $TOK | $SPLIT | $NER | $TAGGER |
      $FILTER | $NAMEPARSER.perl $FLAG  ;
 
else 
  cat  $FILE |tr -d '\015' | $SENT  | $TOK | $SPLIT | $NER | $TAGGER |
       $FILTER | $NAMEPARSER.perl $FLAG  ;
fi

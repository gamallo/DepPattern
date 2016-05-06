#!/bin/bash

#shopt -s extglob


###################################################################
# Script para facilitar o uso do pos tagger e nec 
#   - - A variábel PROLNAT_DIR estabelece o PATH dos programas.
#  
#
# Grupo ProLNat@GE 2014
###################################################################



############################
# Functions
############################

help()
{
  echo "Syntax: nec.sh  <language> <file>
      
      language=es pt en gl
      file=path of the file input 
"
  exit
}


# Parámetros obrigatorios
[ $# -lt 2 ] && help
LING=$1
FILE=$2

case $LING in
  es) ;;
  pt) ;;
  en) ;;
  gl) ;;
  *) help
esac


SENT=$LING"/sentences-"$LING"_exe.perl" 
TOK=$LING"/tokens-"$LING"_exe.perl" 
SPLIT=$LING"/splitter-"$LING"_exe.perl" 
NER=$LING"/ner-"$LING"_exe.perl"
TAGGER=$LING"/tagger-"$LING"_exe.perl" 
NEC=$LING"/nec-"$LING"_exe.perl"


#NAMEFILE=`basename $FILE`;

ZIP=`echo $FILE |awk '($0 ~ /(gz$|zip$)/) {print "zip"}'`

#echo "OKKKKK";
if [ "$ZIP" == "zip" ] ; then
 zcat $FILE |tr -d '\015' | $SENT  | $TOK | $SPLIT | $NER | $TAGGER | $NEC ;

else 
  cat $FILE |tr -d '\015' | $SENT | $TOK | $SPLIT | $NER | $TAGGER | $NEC   ;

fi

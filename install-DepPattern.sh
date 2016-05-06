#!/bin/sh



for file in deppattern.sh*
do
    awk '$0=="DEPPATTERN_DIR=\"./DepPattern\""{print "DEPPATTERN_DIR=\"'`pwd`'\"";next}\
        {print}' $file > $file.tmp;
    mv $file.tmp $file;
done


echo 'Path variables modified in tagging scripts.'

chmod 0755 deppattern.sh
chmod 0755 scripts/*
chmod 0755 parsers/*
chmod 0755 CitiusTagger/es/*
chmod 0755 CitiusTagger/en/*
chmod 0755 CitiusTagger/pt/*
chmod 0755 CitiusTagger/gl/*
chmod 0755 CitiusTagger/*sh

echo ''
echo 'You should add  '`pwd`', '`pwd`'/tree-tagger/cmd and '`pwd`'/tree-tagger/bin to the command search path.'
echo ''

echo "Don't forget that you can also install and use Freeling."
echo "If you use Freeling, it should be installed in /usr/local/."

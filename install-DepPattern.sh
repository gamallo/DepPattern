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
chmod 0755 CitiusTools/es/*
chmod 0755 CitiusTools/en/*
chmod 0755 CitiusTools/pt/*
chmod 0755 CitiusTools/gl/*
chmod 0755 CitiusTools/*sh


echo "Install done. Try deppattern.sh command"

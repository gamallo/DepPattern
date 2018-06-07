# DepPattern parsers (including MetaRomance) and grammar compiler

NEW VERSION: 

https://github.com/citiususc/DepPattern

Author: 
Pablo Gamallo Otero, Isaac González, Marcos Garcia, 
Grupo ProLNat@GE, CiTIUS, 
University of Santiago de Compostela, 
Galiza


## DESCRIPTION
This software contains 4 default parsers for 4 languages (English, Spanish, Galician, and Portuguese), as well as MetaRomance, a multilingual parser suited for Romance languages. The parsers were implemented in PERL and are stored in the 'parsers' file. They were generated from test grammars, stored in the folder 'grammars'. 

The software also contains a compiler (compi-beta.rb), implemented in Ruby, which generate parsers in PERL from DepPattern grammars. To write formal grammars using the formalism "DepPattern", please, look up the tutorial (docs/tutorialDepPattern.pdf).
Besides, the software provides the PoS tagger 'CitiusTools", also developed by our group.


## REQUIREMENTS
GNU/LINUX (bash + perl)
Ruby (for the grammar compiler) 


## HOW TO INSTALL

(1)
> git clone https://github.com/gamallo/DepPattern.git
(2)
> sh install-DepPattern.sh

Pay attention: do not install the package in a directory whose name contain blank spaces!

## HOW TO USE

deppattern.sh  <type_of_output> <lang> <file> [parser] [grammar]

      type_of_output= -a (dependency analysis), -c (correct tagged text)
      language=gl, es, en, pt
      file=path of the file input
            parser=path of the parser, or name of the parser generated from grammar (i.e. metaromance)
            grammar=path of the file grammar



## MetaRomance
One of the parsers provided by the package is MetaRomance, made of Universal Dependencies for Romance languages, and one of the systems that participated at CoNLL-2017 Shared Task on multilingual dependency parsing. If the input text is in Portuguese, the command to run MetaRomance would be the following:

    \.deppattern.sh  -a  pt  ./tests/test-pt  metaromance

More information in:

Garcia, Marcos and Pablo Gamallo (2017) "A rule-based system for cross-lingual parsing of Romance languages with Universal Dependencies", ConLL-2017, Vancouver, Canada.


## INPUT FILE
The input file must be in plain text format, and codified in UTF8.


## GRAMMAR FILE
The file containing the grammar must be in plain text format. 
Below, you'll find a toy example of a grammar with 4 dependency-based rules:


###### GRAMMAR #########
```
AdjnR:  NOUN  ADJ
Agr: number, genre
%

SpecL:  DT  NOUN 
Agr: number, genre
%

SubjL:  NOUN  [ADV]* VERB
Agr: number
%

DobjR:  VERB [ADV]* NOUN
%
```


Look up the tutorial stored in the doc directory.


## OUTPUT FORMAT (flag -a):
Option -a means that the dp.sh generates a file with a dependency-based analysis. Each analysed sentence consists of two elements:

1. a line containing the POS tagged lemmas of the sentence. This line begins with the tag SENT. The set of tags used here are listed in file TagSet.txt. All lemmas are identified by means of a position number from 1 to N, where N is the size of the sentence.

2. All dependency triplets identified by the grammar. A triplet consists of:

(relation;head_lemma;dependent_lemma)

For instance, the sentence "I am a man." generates the following output:

```
SENT::<I_PRO_0_<number:0|lemma:I|possessor:0|case:0|genre:0|person:0|politeness:0|type:P|token:I|> am_VERB_1_<number:0|mode:0|lemma:be|genre:0|tense:0|person:0|type:S|token:am|> a_DT_2_<number:0|lemma:a|possessor:0|genre:0|person:0|type:0|token:a|> man_NOUN_3_<number:S|lemma:man|genre:0|person:3|type:C|token:man|> ._SENT>

(Lobj;be_VERBF_1;I_PN_0)
(Spec;man_NOM_3;a_DT_2)
(Robj;be_VERBF_1;man_NOM_3)
```


The set of dependency relationships used by the 5 grammars can be consulted and modified in the corresponding configuration file: src/dependencies.conf.

Morpho-syntactic information is provided by a POS tagger, either tree-tagger or freeling. 

## OUTPUT FORMAT (flag -fa):
Option -fa gives rise to a full represention of the depedency-based analysis. Each triplet is associated with two pieces of information: morpho-syntactic features of both the head and the dependent. 


## OUTPUT FORMAT (flag -c):
Option -c allows dp.sh to generate a file with the same input (a tagged text) but with some corrections proposed by the grammar. This option is useful to identify and correct regular errors of PoS taggers using grammatical rules. 


## CoNLL OUTPUT FILE FORMAT
It is also possible to get an output file with the format defined by CoNLL-X, inspired by Lin (1998):

Lin, D., 1998. Dependency-based Evaluation of MINIPAR. In Proceedings of the Workshop on the Evaluation of Parsing Systems, First International Conference on Language Resources and Evaluation. Granada, Spain. 12

This format was adopted by the evaluation tasks defined in CoNLL.

To get this ouput format file, you have to run ./scripts/saidaCoNLL.perl taking as input the output of 'dp.sh -a'. 



## EXTENSIONS
You can use the output of the parser to build a cooccurrences file. This file contains all coocurrences between lemmas and dependency contexts. It consists of 3 columns:

context	lemma frequency

To get this cooccurrence information, you have to run ./scripts/contextsDep.perl taking as input the output file generated with -a and the default parsers. 

	

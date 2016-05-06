# Single: VERB
# Add: nomin:no
(@temp) = ($listTags =~ /($VERB$a)/g);
$Rel =  "Single";
Head($Rel,"",@temp);
$listTags =~ s/($VERB$a)/$1/g;
Add("Head","nomin:no",@temp);

# Single: [NOUN] [Fc]? CONJ<lemma:que> [NOUN] [VERB]
# Corr: tag:PRO, type:R
(@temp) = ($listTags =~ /(?:$NOUN$a)(?:$Fc$a)?($CONJ${l}lemma:que\|${r})(?:$NOUN$a)(?:$VERB$a)/g);
$Rel =  "Single";
Head($Rel,"",@temp);
$listTags =~ s/($NOUN$a)($Fc$a)?($CONJ${l}lemma:que\|${r})($NOUN$a)($VERB$a)/$1$2$3$4$5/g;
Corr("Head","tag:PRO,type:R",@temp);

# Single: [X]? NOUN<lemma:$AdvTemp>
# Corr: tag:ADV
(@temp) = ($listTags =~ /(?:$X$a)?($NOUN${l}lemma:$AdvTemp\|${r})/g);
$Rel =  "Single";
Head($Rel,"",@temp);
$listTags =~ s/($X$a)?($NOUN${l}lemma:$AdvTemp\|${r})/$1$2/g;
Corr("Head","tag:ADV",@temp);

# PunctR: X Fz|Fe
(@temp) = ($listTags =~ /($X$a)($Fz$a|$Fe$a)/g);
$Rel =  "PunctR";
HeadDep($Rel,"",@temp);
$listTags =~ s/($X$a)($Fz$a|$Fe$a)/$1/g;

# PunctL: Fz|Fe X
(@temp) = ($listTags =~ /($Fz$a|$Fe$a)($X$a)/g);
$Rel =  "PunctL";
DepHead($Rel,"",@temp);
$listTags =~ s/($Fz$a|$Fe$a)($X$a)/$2/g;

# >: VERB<lemma:tener|ter|haber|haver|take|have> NOUN<number:S> [PRP]
(@temp) = ($listTags =~ /($VERB${l}lemma:(?:tener|ter|haber|haver|take|have)\|${r})($NOUN${l}number:S\|${r})(?:$PRP$a)/g);
$Rel =  ">";
HeadDep_lex($Rel,"",@temp);
$listTags =~ s/($VERB${l}lemma:(?:tener|ter|haber|haver|take|have)\|${r})($NOUN${l}number:S\|${r})($PRP$a)/$1$3/g;
LEX();

# >: VERB<lemma:be|ser> ADJ [PRP]
(@temp) = ($listTags =~ /($VERB${l}lemma:(?:be|ser)\|${r})($ADJ$a)(?:$PRP$a)/g);
$Rel =  ">";
HeadDep_lex($Rel,"",@temp);
$listTags =~ s/($VERB${l}lemma:(?:be|ser)\|${r})($ADJ$a)($PRP$a)/$1$3/g;
LEX();

# <: [VERB<lemma:ser|tornar|converter|be|become>] ADV<lemma:$Quant> ADJ [CONJ|PRO<lemma:que|como>]
# NEXT
# >: VERB<lemma:ser|tornar|converter|be|become> [ADV<lemma:$Quant>] ADJ [CONJ|PRO<lemma:que|como>]
# NEXT
# >: VERB<lemma:ser|tornar|converter|be|become>  [ADV<lemma:$Quant>] [ADJ] CONJ|PRO<lemma:que|como>
(@temp) = ($listTags =~ /(?:$VERB${l}lemma:(?:ser|tornar|converter|be|become)\|${r})($ADV${l}lemma:$Quant\|${r})($ADJ$a)(?:$CONJ$a|$PRO${l}lemma:(?:que|como)\|${r})/g);
$Rel =  "<";
DepHead_lex($Rel,"",@temp);
(@temp) = ($listTags =~ /($VERB${l}lemma:(?:ser|tornar|converter|be|become)\|${r})(?:$ADV${l}lemma:$Quant\|${r})($ADJ$a)(?:$CONJ$a|$PRO${l}lemma:(?:que|como)\|${r})/g);
$Rel =  ">";
HeadDep_lex($Rel,"",@temp);
(@temp) = ($listTags =~ /($VERB${l}lemma:(?:ser|tornar|converter|be|become)\|${r})(?:$ADV${l}lemma:$Quant\|${r})(?:$ADJ$a)($CONJ$a|$PRO${l}lemma:(?:que|como)\|${r})/g);
$Rel =  ">";
HeadDep_lex($Rel,"",@temp);
$listTags =~ s/($VERB${l}lemma:(?:ser|tornar|converter|be|become)\|${r})($ADV${l}lemma:$Quant\|${r})($ADJ$a)($CONJ$a|$PRO${l}lemma:(?:que|como)\|${r})/$1/g;
LEX();

# CoordL: ADV [Fc] [ADV] CONJ<(type:C)|(lemma:$CCord)> [ADV]
# NEXT
# PunctL: [ADV] Fc [ADV] CONJ<(type:C)|(lemma:$CCord)> [ADV]
# Recursivity: 10
(@temp) = ($listTags =~ /($ADV$a)(?:$Fc$a)(?:$ADV$a)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})(?:$ADV$a)/g);
$Rel =  "CoordL";
DepHead($Rel,"",@temp);
(@temp) = ($listTags =~ /(?:$ADV$a)($Fc$a)(?:$ADV$a)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})(?:$ADV$a)/g);
$Rel =  "PunctL";
DepHead($Rel,"",@temp);
$listTags =~ s/($ADV$a)($Fc$a)($ADV$a)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})($ADV$a)/$3$4$5/g;
(@temp) = ($listTags =~ /($ADV$a)(?:$Fc$a)(?:$ADV$a)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})(?:$ADV$a)/g);
$Rel =  "CoordL";
DepHead($Rel,"",@temp);
(@temp) = ($listTags =~ /(?:$ADV$a)($Fc$a)(?:$ADV$a)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})(?:$ADV$a)/g);
$Rel =  "PunctL";
DepHead($Rel,"",@temp);
$listTags =~ s/($ADV$a)($Fc$a)($ADV$a)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})($ADV$a)/$3$4$5/g;
(@temp) = ($listTags =~ /($ADV$a)(?:$Fc$a)(?:$ADV$a)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})(?:$ADV$a)/g);
$Rel =  "CoordL";
DepHead($Rel,"",@temp);
(@temp) = ($listTags =~ /(?:$ADV$a)($Fc$a)(?:$ADV$a)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})(?:$ADV$a)/g);
$Rel =  "PunctL";
DepHead($Rel,"",@temp);
$listTags =~ s/($ADV$a)($Fc$a)($ADV$a)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})($ADV$a)/$3$4$5/g;
(@temp) = ($listTags =~ /($ADV$a)(?:$Fc$a)(?:$ADV$a)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})(?:$ADV$a)/g);
$Rel =  "CoordL";
DepHead($Rel,"",@temp);
(@temp) = ($listTags =~ /(?:$ADV$a)($Fc$a)(?:$ADV$a)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})(?:$ADV$a)/g);
$Rel =  "PunctL";
DepHead($Rel,"",@temp);
$listTags =~ s/($ADV$a)($Fc$a)($ADV$a)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})($ADV$a)/$3$4$5/g;
(@temp) = ($listTags =~ /($ADV$a)(?:$Fc$a)(?:$ADV$a)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})(?:$ADV$a)/g);
$Rel =  "CoordL";
DepHead($Rel,"",@temp);
(@temp) = ($listTags =~ /(?:$ADV$a)($Fc$a)(?:$ADV$a)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})(?:$ADV$a)/g);
$Rel =  "PunctL";
DepHead($Rel,"",@temp);
$listTags =~ s/($ADV$a)($Fc$a)($ADV$a)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})($ADV$a)/$3$4$5/g;
(@temp) = ($listTags =~ /($ADV$a)(?:$Fc$a)(?:$ADV$a)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})(?:$ADV$a)/g);
$Rel =  "CoordL";
DepHead($Rel,"",@temp);
(@temp) = ($listTags =~ /(?:$ADV$a)($Fc$a)(?:$ADV$a)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})(?:$ADV$a)/g);
$Rel =  "PunctL";
DepHead($Rel,"",@temp);
$listTags =~ s/($ADV$a)($Fc$a)($ADV$a)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})($ADV$a)/$3$4$5/g;
(@temp) = ($listTags =~ /($ADV$a)(?:$Fc$a)(?:$ADV$a)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})(?:$ADV$a)/g);
$Rel =  "CoordL";
DepHead($Rel,"",@temp);
(@temp) = ($listTags =~ /(?:$ADV$a)($Fc$a)(?:$ADV$a)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})(?:$ADV$a)/g);
$Rel =  "PunctL";
DepHead($Rel,"",@temp);
$listTags =~ s/($ADV$a)($Fc$a)($ADV$a)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})($ADV$a)/$3$4$5/g;
(@temp) = ($listTags =~ /($ADV$a)(?:$Fc$a)(?:$ADV$a)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})(?:$ADV$a)/g);
$Rel =  "CoordL";
DepHead($Rel,"",@temp);
(@temp) = ($listTags =~ /(?:$ADV$a)($Fc$a)(?:$ADV$a)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})(?:$ADV$a)/g);
$Rel =  "PunctL";
DepHead($Rel,"",@temp);
$listTags =~ s/($ADV$a)($Fc$a)($ADV$a)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})($ADV$a)/$3$4$5/g;
(@temp) = ($listTags =~ /($ADV$a)(?:$Fc$a)(?:$ADV$a)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})(?:$ADV$a)/g);
$Rel =  "CoordL";
DepHead($Rel,"",@temp);
(@temp) = ($listTags =~ /(?:$ADV$a)($Fc$a)(?:$ADV$a)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})(?:$ADV$a)/g);
$Rel =  "PunctL";
DepHead($Rel,"",@temp);
$listTags =~ s/($ADV$a)($Fc$a)($ADV$a)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})($ADV$a)/$3$4$5/g;
(@temp) = ($listTags =~ /($ADV$a)(?:$Fc$a)(?:$ADV$a)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})(?:$ADV$a)/g);
$Rel =  "CoordL";
DepHead($Rel,"",@temp);
(@temp) = ($listTags =~ /(?:$ADV$a)($Fc$a)(?:$ADV$a)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})(?:$ADV$a)/g);
$Rel =  "PunctL";
DepHead($Rel,"",@temp);
$listTags =~ s/($ADV$a)($Fc$a)($ADV$a)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})($ADV$a)/$3$4$5/g;
(@temp) = ($listTags =~ /($ADV$a)(?:$Fc$a)(?:$ADV$a)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})(?:$ADV$a)/g);
$Rel =  "CoordL";
DepHead($Rel,"",@temp);
(@temp) = ($listTags =~ /(?:$ADV$a)($Fc$a)(?:$ADV$a)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})(?:$ADV$a)/g);
$Rel =  "PunctL";
DepHead($Rel,"",@temp);
$listTags =~ s/($ADV$a)($Fc$a)($ADV$a)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})($ADV$a)/$3$4$5/g;

# CoordL: [Fc]? ADV CONJ<(type:C)|(lemma:$CCord)> [ADV]
# NEXT
# CoordR: [Fc]? [ADV] CONJ<(type:C)|(lemma:$CCord)> ADV
# Add: coord:adv
(@temp) = ($listTags =~ /(?:$Fc$a)?($ADV$a)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})(?:$ADV$a)/g);
$Rel =  "CoordL";
DepHead($Rel,"",@temp);
(@temp) = ($listTags =~ /(?:$Fc$a)?(?:$ADV$a)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})($ADV$a)/g);
$Rel =  "CoordR";
HeadDep($Rel,"",@temp);
$listTags =~ s/($Fc$a)?($ADV$a)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})($ADV$a)/$1$3/g;
Add("HeadDep","coord:adv",@temp);

# PunctL: Fc CONJ<coord:adv>
(@temp) = ($listTags =~ /($Fc$a)($CONJ${l}coord:adv\|${r})/g);
$Rel =  "PunctL";
DepHead($Rel,"",@temp);
$listTags =~ s/($Fc$a)($CONJ${l}coord:adv\|${r})/$2/g;

# AdjnL: ADV<lemma:$Quant> ADV|ADJ
(@temp) = ($listTags =~ /($ADV${l}lemma:$Quant\|${r})($ADV$a|$ADJ$a)/g);
$Rel =  "AdjnL";
DepHead($Rel,"",@temp);
$listTags =~ s/($ADV${l}lemma:$Quant\|${r})($ADV$a|$ADJ$a)/$2/g;

# AdjnL: ADV<lemma:[Mm]ais@de> [DET]? CARD|NOUN
(@temp) = ($listTags =~ /($ADV${l}lemma:[Mm]ais@de\|${r})(?:$DET$a)?($CARD$a|$NOUN$a)/g);
$Rel =  "AdjnL";
DepHead($Rel,"",@temp);
$listTags =~ s/($ADV${l}lemma:[Mm]ais@de\|${r})($DET$a)?($CARD$a|$NOUN$a)/$2$3/g;

# PunctL: [ADJ] Fc ADJ [NOUN]
# NEXT
# AdjnL: ADJ [Fc] ADJ [NOUN]
# Recursivity: 5
(@temp) = ($listTags =~ /(?:$ADJ$a)($Fc$a)($ADJ$a)(?:$NOUN$a)/g);
$Rel =  "PunctL";
DepHead($Rel,"",@temp);
(@temp) = ($listTags =~ /($ADJ$a)(?:$Fc$a)($ADJ$a)(?:$NOUN$a)/g);
$Rel =  "AdjnL";
DepHead($Rel,"",@temp);
$listTags =~ s/($ADJ$a)($Fc$a)($ADJ$a)($NOUN$a)/$3$4/g;
(@temp) = ($listTags =~ /(?:$ADJ$a)($Fc$a)($ADJ$a)(?:$NOUN$a)/g);
$Rel =  "PunctL";
DepHead($Rel,"",@temp);
(@temp) = ($listTags =~ /($ADJ$a)(?:$Fc$a)($ADJ$a)(?:$NOUN$a)/g);
$Rel =  "AdjnL";
DepHead($Rel,"",@temp);
$listTags =~ s/($ADJ$a)($Fc$a)($ADJ$a)($NOUN$a)/$3$4/g;
(@temp) = ($listTags =~ /(?:$ADJ$a)($Fc$a)($ADJ$a)(?:$NOUN$a)/g);
$Rel =  "PunctL";
DepHead($Rel,"",@temp);
(@temp) = ($listTags =~ /($ADJ$a)(?:$Fc$a)($ADJ$a)(?:$NOUN$a)/g);
$Rel =  "AdjnL";
DepHead($Rel,"",@temp);
$listTags =~ s/($ADJ$a)($Fc$a)($ADJ$a)($NOUN$a)/$3$4/g;
(@temp) = ($listTags =~ /(?:$ADJ$a)($Fc$a)($ADJ$a)(?:$NOUN$a)/g);
$Rel =  "PunctL";
DepHead($Rel,"",@temp);
(@temp) = ($listTags =~ /($ADJ$a)(?:$Fc$a)($ADJ$a)(?:$NOUN$a)/g);
$Rel =  "AdjnL";
DepHead($Rel,"",@temp);
$listTags =~ s/($ADJ$a)($Fc$a)($ADJ$a)($NOUN$a)/$3$4/g;
(@temp) = ($listTags =~ /(?:$ADJ$a)($Fc$a)($ADJ$a)(?:$NOUN$a)/g);
$Rel =  "PunctL";
DepHead($Rel,"",@temp);
(@temp) = ($listTags =~ /($ADJ$a)(?:$Fc$a)($ADJ$a)(?:$NOUN$a)/g);
$Rel =  "AdjnL";
DepHead($Rel,"",@temp);
$listTags =~ s/($ADJ$a)($Fc$a)($ADJ$a)($NOUN$a)/$3$4/g;
(@temp) = ($listTags =~ /(?:$ADJ$a)($Fc$a)($ADJ$a)(?:$NOUN$a)/g);
$Rel =  "PunctL";
DepHead($Rel,"",@temp);
(@temp) = ($listTags =~ /($ADJ$a)(?:$Fc$a)($ADJ$a)(?:$NOUN$a)/g);
$Rel =  "AdjnL";
DepHead($Rel,"",@temp);
$listTags =~ s/($ADJ$a)($Fc$a)($ADJ$a)($NOUN$a)/$3$4/g;

# CoordL: ADJ [Fc] [ADJ] CONJ<(type:C)|(lemma:$CCord)> [ADJ]
# NEXT
# PunctL: [ADJ] Fc [ADJ] CONJ<(type:C)|(lemma:$CCord)> [ADJ]
# Recursivity: 10
(@temp) = ($listTags =~ /($ADJ$a)(?:$Fc$a)(?:$ADJ$a)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})(?:$ADJ$a)/g);
$Rel =  "CoordL";
DepHead($Rel,"",@temp);
(@temp) = ($listTags =~ /(?:$ADJ$a)($Fc$a)(?:$ADJ$a)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})(?:$ADJ$a)/g);
$Rel =  "PunctL";
DepHead($Rel,"",@temp);
$listTags =~ s/($ADJ$a)($Fc$a)($ADJ$a)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})($ADJ$a)/$3$4$5/g;
(@temp) = ($listTags =~ /($ADJ$a)(?:$Fc$a)(?:$ADJ$a)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})(?:$ADJ$a)/g);
$Rel =  "CoordL";
DepHead($Rel,"",@temp);
(@temp) = ($listTags =~ /(?:$ADJ$a)($Fc$a)(?:$ADJ$a)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})(?:$ADJ$a)/g);
$Rel =  "PunctL";
DepHead($Rel,"",@temp);
$listTags =~ s/($ADJ$a)($Fc$a)($ADJ$a)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})($ADJ$a)/$3$4$5/g;
(@temp) = ($listTags =~ /($ADJ$a)(?:$Fc$a)(?:$ADJ$a)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})(?:$ADJ$a)/g);
$Rel =  "CoordL";
DepHead($Rel,"",@temp);
(@temp) = ($listTags =~ /(?:$ADJ$a)($Fc$a)(?:$ADJ$a)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})(?:$ADJ$a)/g);
$Rel =  "PunctL";
DepHead($Rel,"",@temp);
$listTags =~ s/($ADJ$a)($Fc$a)($ADJ$a)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})($ADJ$a)/$3$4$5/g;
(@temp) = ($listTags =~ /($ADJ$a)(?:$Fc$a)(?:$ADJ$a)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})(?:$ADJ$a)/g);
$Rel =  "CoordL";
DepHead($Rel,"",@temp);
(@temp) = ($listTags =~ /(?:$ADJ$a)($Fc$a)(?:$ADJ$a)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})(?:$ADJ$a)/g);
$Rel =  "PunctL";
DepHead($Rel,"",@temp);
$listTags =~ s/($ADJ$a)($Fc$a)($ADJ$a)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})($ADJ$a)/$3$4$5/g;
(@temp) = ($listTags =~ /($ADJ$a)(?:$Fc$a)(?:$ADJ$a)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})(?:$ADJ$a)/g);
$Rel =  "CoordL";
DepHead($Rel,"",@temp);
(@temp) = ($listTags =~ /(?:$ADJ$a)($Fc$a)(?:$ADJ$a)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})(?:$ADJ$a)/g);
$Rel =  "PunctL";
DepHead($Rel,"",@temp);
$listTags =~ s/($ADJ$a)($Fc$a)($ADJ$a)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})($ADJ$a)/$3$4$5/g;
(@temp) = ($listTags =~ /($ADJ$a)(?:$Fc$a)(?:$ADJ$a)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})(?:$ADJ$a)/g);
$Rel =  "CoordL";
DepHead($Rel,"",@temp);
(@temp) = ($listTags =~ /(?:$ADJ$a)($Fc$a)(?:$ADJ$a)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})(?:$ADJ$a)/g);
$Rel =  "PunctL";
DepHead($Rel,"",@temp);
$listTags =~ s/($ADJ$a)($Fc$a)($ADJ$a)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})($ADJ$a)/$3$4$5/g;
(@temp) = ($listTags =~ /($ADJ$a)(?:$Fc$a)(?:$ADJ$a)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})(?:$ADJ$a)/g);
$Rel =  "CoordL";
DepHead($Rel,"",@temp);
(@temp) = ($listTags =~ /(?:$ADJ$a)($Fc$a)(?:$ADJ$a)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})(?:$ADJ$a)/g);
$Rel =  "PunctL";
DepHead($Rel,"",@temp);
$listTags =~ s/($ADJ$a)($Fc$a)($ADJ$a)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})($ADJ$a)/$3$4$5/g;
(@temp) = ($listTags =~ /($ADJ$a)(?:$Fc$a)(?:$ADJ$a)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})(?:$ADJ$a)/g);
$Rel =  "CoordL";
DepHead($Rel,"",@temp);
(@temp) = ($listTags =~ /(?:$ADJ$a)($Fc$a)(?:$ADJ$a)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})(?:$ADJ$a)/g);
$Rel =  "PunctL";
DepHead($Rel,"",@temp);
$listTags =~ s/($ADJ$a)($Fc$a)($ADJ$a)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})($ADJ$a)/$3$4$5/g;
(@temp) = ($listTags =~ /($ADJ$a)(?:$Fc$a)(?:$ADJ$a)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})(?:$ADJ$a)/g);
$Rel =  "CoordL";
DepHead($Rel,"",@temp);
(@temp) = ($listTags =~ /(?:$ADJ$a)($Fc$a)(?:$ADJ$a)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})(?:$ADJ$a)/g);
$Rel =  "PunctL";
DepHead($Rel,"",@temp);
$listTags =~ s/($ADJ$a)($Fc$a)($ADJ$a)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})($ADJ$a)/$3$4$5/g;
(@temp) = ($listTags =~ /($ADJ$a)(?:$Fc$a)(?:$ADJ$a)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})(?:$ADJ$a)/g);
$Rel =  "CoordL";
DepHead($Rel,"",@temp);
(@temp) = ($listTags =~ /(?:$ADJ$a)($Fc$a)(?:$ADJ$a)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})(?:$ADJ$a)/g);
$Rel =  "PunctL";
DepHead($Rel,"",@temp);
$listTags =~ s/($ADJ$a)($Fc$a)($ADJ$a)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})($ADJ$a)/$3$4$5/g;
(@temp) = ($listTags =~ /($ADJ$a)(?:$Fc$a)(?:$ADJ$a)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})(?:$ADJ$a)/g);
$Rel =  "CoordL";
DepHead($Rel,"",@temp);
(@temp) = ($listTags =~ /(?:$ADJ$a)($Fc$a)(?:$ADJ$a)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})(?:$ADJ$a)/g);
$Rel =  "PunctL";
DepHead($Rel,"",@temp);
$listTags =~ s/($ADJ$a)($Fc$a)($ADJ$a)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})($ADJ$a)/$3$4$5/g;

# CoordL: [Fc]? ADJ CONJ<(type:C)|(lemma:$CCord)> [ADJ]
# NEXT
# CoordR: [Fc]? [ADJ] CONJ<(type:C)|(lemma:$CCord)> ADJ
# Add: coord:adj
# Inherit: gender, number
(@temp) = ($listTags =~ /(?:$Fc$a)?($ADJ$a)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})(?:$ADJ$a)/g);
$Rel =  "CoordL";
DepHead($Rel,"",@temp);
(@temp) = ($listTags =~ /(?:$Fc$a)?(?:$ADJ$a)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})($ADJ$a)/g);
$Rel =  "CoordR";
HeadDep($Rel,"",@temp);
$listTags =~ s/($Fc$a)?($ADJ$a)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})($ADJ$a)/$1$3/g;
Inherit("HeadDep","gender,number",@temp);
Add("HeadDep","coord:adj",@temp);

# PunctL: Fc CONJ<coord:adj>
(@temp) = ($listTags =~ /($Fc$a)($CONJ${l}coord:adj\|${r})/g);
$Rel =  "PunctL";
DepHead($Rel,"",@temp);
$listTags =~ s/($Fc$a)($CONJ${l}coord:adj\|${r})/$2/g;

# AdjnR:  NOUN NOUN
# Recursivity: 1
(@temp) = ($listTags =~ /($NOUN$a)($NOUN$a)/g);
$Rel =  "AdjnR";
HeadDep($Rel,"",@temp);
$listTags =~ s/($NOUN$a)($NOUN$a)/$1/g;
(@temp) = ($listTags =~ /($NOUN$a)($NOUN$a)/g);
$Rel =  "AdjnR";
HeadDep($Rel,"",@temp);
$listTags =~ s/($NOUN$a)($NOUN$a)/$1/g;

# Single: [DET] ADJ [PRP]
# Corr: tag:NOUN
(@temp) = ($listTags =~ /(?:$DET$a)($ADJ$a)(?:$PRP$a)/g);
$Rel =  "Single";
Head($Rel,"",@temp);
$listTags =~ s/($DET$a)($ADJ$a)($PRP$a)/$1$2$3/g;
Corr("Head","tag:NOUN",@temp);

# SpecL: DET DET|PRO<type:X> [NOUN]
# NEXT
# SpecL: [DET] DET|PRO<type:X> NOUN
(@temp) = ($listTags =~ /($DET$a)($DET$a|$PRO${l}type:X\|${r})(?:$NOUN$a)/g);
$Rel =  "SpecL";
DepHead($Rel,"",@temp);
(@temp) = ($listTags =~ /(?:$DET$a)($DET$a|$PRO${l}type:X\|${r})($NOUN$a)/g);
$Rel =  "SpecL";
DepHead($Rel,"",@temp);
$listTags =~ s/($DET$a)($DET$a|$PRO${l}type:X\|${r})($NOUN$a)/$3/g;

# SpecL: DET<type:I> DET<type:A> [PRO<type:R>]
(@temp) = ($listTags =~ /($DET${l}type:I\|${r})($DET${l}type:A\|${r})(?:$PRO${l}type:R\|${r})/g);
$Rel =  "SpecL";
DepHead($Rel,"",@temp);
$listTags =~ s/($DET${l}type:I\|${r})($DET${l}type:A\|${r})($PRO${l}type:R\|${r})/$2$3/g;

# AdjnL: [DET] VERB<mode:P> NOUN
# NEXT
# SpecL: DET [VERB<mode:P>] NOUN
(@temp) = ($listTags =~ /(?:$DET$a)($VERB${l}mode:P\|${r})($NOUN$a)/g);
$Rel =  "AdjnL";
DepHead($Rel,"",@temp);
(@temp) = ($listTags =~ /($DET$a)(?:$VERB${l}mode:P\|${r})($NOUN$a)/g);
$Rel =  "SpecL";
DepHead($Rel,"",@temp);
$listTags =~ s/($DET$a)($VERB${l}mode:P\|${r})($NOUN$a)/$3/g;

# SpecL: DET CARD|DATE
(@temp) = ($listTags =~ /($DET$a)($CARD$a|$DATE$a)/g);
$Rel =  "SpecL";
DepHead($Rel,"",@temp);
$listTags =~ s/($DET$a)($CARD$a|$DATE$a)/$2/g;

# SpecL: DET NOUN
(@temp) = ($listTags =~ /($DET$a)($NOUN$a)/g);
$Rel =  "SpecL";
DepHead($Rel,"",@temp);
$listTags =~ s/($DET$a)($NOUN$a)/$2/g;

# SpecL: DET<type:A> PRO<type:X>
(@temp) = ($listTags =~ /($DET${l}type:A\|${r})($PRO${l}type:X\|${r})/g);
$Rel =  "SpecL";
DepHead($Rel,"",@temp);
$listTags =~ s/($DET${l}type:A\|${r})($PRO${l}type:X\|${r})/$2/g;

# SpecL: DET<type:[AD]>|PRO<type:D> PRO<type:[RW]>
# Add: sust:yes
# Inherit: number, person
(@temp) = ($listTags =~ /($DET${l}type:[AD]\|${r}|$PRO${l}type:D\|${r})($PRO${l}type:[RW]\|${r})/g);
$Rel =  "SpecL";
DepHead($Rel,"",@temp);
$listTags =~ s/($DET${l}type:[AD]\|${r}|$PRO${l}type:D\|${r})($PRO${l}type:[RW]\|${r})/$2/g;
Inherit("DepHead","number,person",@temp);
Add("DepHead","sust:yes",@temp);

# SpecL: DET<type:[AD]>|PRO<type:D> PRP<lemma:de> [NOUNSINGLE|PRO<type:D|P|I|X>]
# Add: nomin:yes
# Inherit: number, person
(@temp) = ($listTags =~ /($DET${l}type:[AD]\|${r}|$PRO${l}type:D\|${r})($PRP${l}lemma:de\|${r})(?:$NOUNSINGLE$a|$PRO${l}type:(?:D|P|I|X)\|${r})/g);
$Rel =  "SpecL";
DepHead($Rel,"",@temp);
$listTags =~ s/($DET${l}type:[AD]\|${r}|$PRO${l}type:D\|${r})($PRP${l}lemma:de\|${r})($NOUNSINGLE$a|$PRO${l}type:(?:D|P|I|X)\|${r})/$2$3/g;
Inherit("DepHead","number,person",@temp);
Add("DepHead","nomin:yes",@temp);

# ClitL: PRO<lemma:se> VERB
# Add: se:yes
# Uniq
(@temp) = ($listTags =~ /($PRO${l}lemma:se\|${r})($VERB$a)/g);
$Rel =  "ClitL";
DepHead($Rel,"",@temp);
$listTags =~ s/($PRO${l}lemma:se\|${r})($VERB$a)/$2/g;
Add("DepHead","se:yes",@temp);

# ClitR: VERB PRO<lemma:se>
# Add: se:yes
# Uniq
(@temp) = ($listTags =~ /($VERB$a)($PRO${l}lemma:se\|${r})/g);
$Rel =  "ClitR";
HeadDep($Rel,"",@temp);
$listTags =~ s/($VERB$a)($PRO${l}lemma:se\|${r})/$1/g;
Add("HeadDep","se:yes",@temp);

# ClitL: PRO<token:$cliticoind> VERB
# Add: ind:yes
# Uniq
(@temp) = ($listTags =~ /($PRO${l}token:$cliticoind\|${r})($VERB$a)/g);
$Rel =  "ClitL";
DepHead($Rel,"",@temp);
$listTags =~ s/($PRO${l}token:$cliticoind\|${r})($VERB$a)/$2/g;
Add("DepHead","ind:yes",@temp);

# ClitR: VERB PRO<token:$cliticoind>
# Add: ind:yes
# Uniq
(@temp) = ($listTags =~ /($VERB$a)($PRO${l}token:$cliticoind\|${r})/g);
$Rel =  "ClitR";
HeadDep($Rel,"",@temp);
$listTags =~ s/($VERB$a)($PRO${l}token:$cliticoind\|${r})/$1/g;
Add("HeadDep","ind:yes",@temp);

# ClitL: PRO<token:$cliticopers> VERB
# Recursivity: 1
(@temp) = ($listTags =~ /($PRO${l}token:$cliticopers\|${r})($VERB$a)/g);
$Rel =  "ClitL";
DepHead($Rel,"",@temp);
$listTags =~ s/($PRO${l}token:$cliticopers\|${r})($VERB$a)/$2/g;
(@temp) = ($listTags =~ /($PRO${l}token:$cliticopers\|${r})($VERB$a)/g);
$Rel =  "ClitL";
DepHead($Rel,"",@temp);
$listTags =~ s/($PRO${l}token:$cliticopers\|${r})($VERB$a)/$2/g;

# ClitR: VERB PRO<token:$cliticopers>
# Recursivity: 1
(@temp) = ($listTags =~ /($VERB$a)($PRO${l}token:$cliticopers\|${r})/g);
$Rel =  "ClitR";
HeadDep($Rel,"",@temp);
$listTags =~ s/($VERB$a)($PRO${l}token:$cliticopers\|${r})/$1/g;
(@temp) = ($listTags =~ /($VERB$a)($PRO${l}token:$cliticopers\|${r})/g);
$Rel =  "ClitR";
HeadDep($Rel,"",@temp);
$listTags =~ s/($VERB$a)($PRO${l}token:$cliticopers\|${r})/$1/g;

# VSpecL: VERB<type:S> [ADV]? [ADV]? [ADV]? [ADV]? [ADV]? [ADV]? [ADV]? [ADV]? [ADV]? [ADV]? VERB<mode:P>
# Add: voice:passive
# Inherit: mode, person, tense, number
(@temp) = ($listTags =~ /($VERB${l}type:S\|${r})(?:$ADV$a)?(?:$ADV$a)?(?:$ADV$a)?(?:$ADV$a)?(?:$ADV$a)?(?:$ADV$a)?(?:$ADV$a)?(?:$ADV$a)?(?:$ADV$a)?(?:$ADV$a)?($VERB${l}mode:P\|${r})/g);
$Rel =  "VSpecL";
DepHead($Rel,"",@temp);
$listTags =~ s/($VERB${l}type:S\|${r})($ADV$a)?($ADV$a)?($ADV$a)?($ADV$a)?($ADV$a)?($ADV$a)?($ADV$a)?($ADV$a)?($ADV$a)?($ADV$a)?($VERB${l}mode:P\|${r})/$2$3$4$5$6$7$8$9$10$11$12/g;
Inherit("DepHead","mode,person,tense,number",@temp);
Add("DepHead","voice:passive",@temp);

# VSpecL: VERB<(type:A)|(lemma:ter|haver|haber|avoir|have)> [ADV]? [ADV]? [ADV]? [ADV]? [ADV]? [ADV]? [ADV]? [ADV]? [ADV]? [ADV]? VERB<mode:P>
# Add: type:perfect
# Inherit: mode, person, tense, number
(@temp) = ($listTags =~ /($VERB${l}type:A\|${r}|$VERB${l}lemma:(?:ter|haver|haber|avoir|have)\|${r})(?:$ADV$a)?(?:$ADV$a)?(?:$ADV$a)?(?:$ADV$a)?(?:$ADV$a)?(?:$ADV$a)?(?:$ADV$a)?(?:$ADV$a)?(?:$ADV$a)?(?:$ADV$a)?($VERB${l}mode:P\|${r})/g);
$Rel =  "VSpecL";
DepHead($Rel,"",@temp);
$listTags =~ s/($VERB${l}type:A\|${r}|$VERB${l}lemma:(?:ter|haver|haber|avoir|have)\|${r})($ADV$a)?($ADV$a)?($ADV$a)?($ADV$a)?($ADV$a)?($ADV$a)?($ADV$a)?($ADV$a)?($ADV$a)?($ADV$a)?($VERB${l}mode:P\|${r})/$2$3$4$5$6$7$8$9$10$11$12/g;
Inherit("DepHead","mode,person,tense,number",@temp);
Add("DepHead","type:perfect",@temp);

# VSpecL: VERB<lemma:$VModalEs> [ADV]? [ADV]? [ADV]? [ADV]? [ADV]? [ADV]? [ADV]? [ADV]? [ADV]? [ADV]? VERB<mode:N>
# Inherit: mode, person, tense, number
(@temp) = ($listTags =~ /($VERB${l}lemma:$VModalEs\|${r})(?:$ADV$a)?(?:$ADV$a)?(?:$ADV$a)?(?:$ADV$a)?(?:$ADV$a)?(?:$ADV$a)?(?:$ADV$a)?(?:$ADV$a)?(?:$ADV$a)?(?:$ADV$a)?($VERB${l}mode:N\|${r})/g);
$Rel =  "VSpecL";
DepHead($Rel,"",@temp);
$listTags =~ s/($VERB${l}lemma:$VModalEs\|${r})($ADV$a)?($ADV$a)?($ADV$a)?($ADV$a)?($ADV$a)?($ADV$a)?($ADV$a)?($ADV$a)?($ADV$a)?($ADV$a)?($VERB${l}mode:N\|${r})/$2$3$4$5$6$7$8$9$10$11$12/g;
Inherit("DepHead","mode,person,tense,number",@temp);

# VSpecLocL: VERB<lemma:ter|haver> [ADV]? [ADV]? [ADV]? [ADV]? [ADV]? [ADV]? [ADV]? [ADV]? [ADV]? [ADV]? PRP<lemma:de>|CONJ<lemma:que&type:S> [ADV]? [ADV]? [ADV]? [ADV]? [ADV]? [ADV]? [ADV]? [ADV]? [ADV]? [ADV]? VERB<mode:N>
# Inherit: mode, person, tense, number
(@temp) = ($listTags =~ /($VERB${l}lemma:(?:ter|haver)\|${r})(?:$ADV$a)?(?:$ADV$a)?(?:$ADV$a)?(?:$ADV$a)?(?:$ADV$a)?(?:$ADV$a)?(?:$ADV$a)?(?:$ADV$a)?(?:$ADV$a)?(?:$ADV$a)?($PRP${l}lemma:de\|${r}|$CONJ${l}lemma:que\|${b}type:S\|${r})(?:$ADV$a)?(?:$ADV$a)?(?:$ADV$a)?(?:$ADV$a)?(?:$ADV$a)?(?:$ADV$a)?(?:$ADV$a)?(?:$ADV$a)?(?:$ADV$a)?(?:$ADV$a)?($VERB${l}mode:N\|${r})/g);
$Rel =  "VSpecLocL";
DepRelHead($Rel,"",@temp);
$listTags =~ s/($VERB${l}lemma:(?:ter|haver)\|${r})($ADV$a)?($ADV$a)?($ADV$a)?($ADV$a)?($ADV$a)?($ADV$a)?($ADV$a)?($ADV$a)?($ADV$a)?($ADV$a)?($PRP${l}lemma:de\|${r}|$CONJ${l}lemma:que\|${b}type:S\|${r})($ADV$a)?($ADV$a)?($ADV$a)?($ADV$a)?($ADV$a)?($ADV$a)?($ADV$a)?($ADV$a)?($ADV$a)?($ADV$a)?($VERB${l}mode:N\|${r})/$2$3$4$5$6$7$8$9$10$11$13$14$15$16$17$18$19$20$21$22$23/g;
Inherit("DepRelHead","mode,person,tense,number",@temp);

# VSpecLocL: VERB<lemma:ir|vir|comezar|acabar|finalizar|terminar|passar|estar> [ADV]? [ADV]? [ADV]? [ADV]? [ADV]? [ADV]? [ADV]? [ADV]? [ADV]? [ADV]? PRP<lemma:$PrepLocs> [ADV]? [ADV]? [ADV]? [ADV]? [ADV]? [ADV]? [ADV]? [ADV]? [ADV]? [ADV]? VERB<mode:N>
# Inherit: mode, person, tense, number
(@temp) = ($listTags =~ /($VERB${l}lemma:(?:ir|vir|comezar|acabar|finalizar|terminar|passar|estar)\|${r})(?:$ADV$a)?(?:$ADV$a)?(?:$ADV$a)?(?:$ADV$a)?(?:$ADV$a)?(?:$ADV$a)?(?:$ADV$a)?(?:$ADV$a)?(?:$ADV$a)?(?:$ADV$a)?($PRP${l}lemma:$PrepLocs\|${r})(?:$ADV$a)?(?:$ADV$a)?(?:$ADV$a)?(?:$ADV$a)?(?:$ADV$a)?(?:$ADV$a)?(?:$ADV$a)?(?:$ADV$a)?(?:$ADV$a)?(?:$ADV$a)?($VERB${l}mode:N\|${r})/g);
$Rel =  "VSpecLocL";
DepRelHead($Rel,"",@temp);
$listTags =~ s/($VERB${l}lemma:(?:ir|vir|comezar|acabar|finalizar|terminar|passar|estar)\|${r})($ADV$a)?($ADV$a)?($ADV$a)?($ADV$a)?($ADV$a)?($ADV$a)?($ADV$a)?($ADV$a)?($ADV$a)?($ADV$a)?($PRP${l}lemma:$PrepLocs\|${r})($ADV$a)?($ADV$a)?($ADV$a)?($ADV$a)?($ADV$a)?($ADV$a)?($ADV$a)?($ADV$a)?($ADV$a)?($ADV$a)?($VERB${l}mode:N\|${r})/$2$3$4$5$6$7$8$9$10$11$13$14$15$16$17$18$19$20$21$22$23/g;
Inherit("DepRelHead","mode,person,tense,number",@temp);

# VSpecL: VERB<lemma:estar> [ADV]? [ADV]? [ADV]? [ADV]? [ADV]? [ADV]? [ADV]? [ADV]? [ADV]? [ADV]? VERB<mode:G>
# Inherit: mode, person, tense, number
(@temp) = ($listTags =~ /($VERB${l}lemma:estar\|${r})(?:$ADV$a)?(?:$ADV$a)?(?:$ADV$a)?(?:$ADV$a)?(?:$ADV$a)?(?:$ADV$a)?(?:$ADV$a)?(?:$ADV$a)?(?:$ADV$a)?(?:$ADV$a)?($VERB${l}mode:G\|${r})/g);
$Rel =  "VSpecL";
DepHead($Rel,"",@temp);
$listTags =~ s/($VERB${l}lemma:estar\|${r})($ADV$a)?($ADV$a)?($ADV$a)?($ADV$a)?($ADV$a)?($ADV$a)?($ADV$a)?($ADV$a)?($ADV$a)?($ADV$a)?($VERB${l}mode:G\|${r})/$2$3$4$5$6$7$8$9$10$11$12/g;
Inherit("DepHead","mode,person,tense,number",@temp);

# PunctL: [ADV<pos:0>] Fc VERB
# NEXT
# AdjnL: ADV<pos:0> [Fc] VERB
(@temp) = ($listTags =~ /(?:$ADV${l}pos:0\|${r})($Fc$a)($VERB$a)/g);
$Rel =  "PunctL";
DepHead($Rel,"",@temp);
(@temp) = ($listTags =~ /($ADV${l}pos:0\|${r})(?:$Fc$a)($VERB$a)/g);
$Rel =  "AdjnL";
DepHead($Rel,"",@temp);
$listTags =~ s/($ADV${l}pos:0\|${r})($Fc$a)($VERB$a)/$3/g;

# PunctR:  VERB [Fc]? [ADV] Fc
# NEXT
# PunctR: VERB Fc [ADV] [Fc]
# NEXT
# AdjnR: VERB [Fc]? ADV [Fc]
(@temp) = ($listTags =~ /($VERB$a)(?:$Fc$a)?(?:$ADV$a)($Fc$a)/g);
$Rel =  "PunctR";
HeadDep($Rel,"",@temp);
(@temp) = ($listTags =~ /($VERB$a)($Fc$a)(?:$ADV$a)(?:$Fc$a)/g);
$Rel =  "PunctR";
HeadDep($Rel,"",@temp);
(@temp) = ($listTags =~ /($VERB$a)(?:$Fc$a)?($ADV$a)(?:$Fc$a)/g);
$Rel =  "AdjnR";
HeadDep($Rel,"",@temp);
$listTags =~ s/($VERB$a)($Fc$a)?($ADV$a)($Fc$a)/$1/g;

# PunctL: Fc [ADV] [Fc]? VERB
# NEXT
# PunctL: [Fc] [ADV] Fc VERB
# NEXT
# AdjnL: [Fc] ADV [Fc]? VERB
(@temp) = ($listTags =~ /($Fc$a)(?:$ADV$a)(?:$Fc$a)?($VERB$a)/g);
$Rel =  "PunctL";
DepHead($Rel,"",@temp);
(@temp) = ($listTags =~ /(?:$Fc$a)(?:$ADV$a)($Fc$a)($VERB$a)/g);
$Rel =  "PunctL";
DepHead($Rel,"",@temp);
(@temp) = ($listTags =~ /(?:$Fc$a)($ADV$a)(?:$Fc$a)?($VERB$a)/g);
$Rel =  "AdjnL";
DepHead($Rel,"",@temp);
$listTags =~ s/($Fc$a)($ADV$a)($Fc$a)?($VERB$a)/$4/g;

# AdjnR: VERB [NOUN|PRO<type:D|P|I|X>]? ADV|CONJ<coord:adv>
# Recursivity: 1
(@temp) = ($listTags =~ /($VERB$a)(?:$NOUN$a|$PRO${l}type:(?:D|P|I|X)\|${r})?($ADV$a|$CONJ${l}coord:adv\|${r})/g);
$Rel =  "AdjnR";
HeadDep($Rel,"",@temp);
$listTags =~ s/($VERB$a)($NOUN$a|$PRO${l}type:(?:D|P|I|X)\|${r})?($ADV$a|$CONJ${l}coord:adv\|${r})/$1$2/g;
(@temp) = ($listTags =~ /($VERB$a)(?:$NOUN$a|$PRO${l}type:(?:D|P|I|X)\|${r})?($ADV$a|$CONJ${l}coord:adv\|${r})/g);
$Rel =  "AdjnR";
HeadDep($Rel,"",@temp);
$listTags =~ s/($VERB$a)($NOUN$a|$PRO${l}type:(?:D|P|I|X)\|${r})?($ADV$a|$CONJ${l}coord:adv\|${r})/$1$2/g;

# AdjnL:  ADV|CONJ<coord:adv>  VERB
# Recursivity: 1
(@temp) = ($listTags =~ /($ADV$a|$CONJ${l}coord:adv\|${r})($VERB$a)/g);
$Rel =  "AdjnL";
DepHead($Rel,"",@temp);
$listTags =~ s/($ADV$a|$CONJ${l}coord:adv\|${r})($VERB$a)/$2/g;
(@temp) = ($listTags =~ /($ADV$a|$CONJ${l}coord:adv\|${r})($VERB$a)/g);
$Rel =  "AdjnL";
DepHead($Rel,"",@temp);
$listTags =~ s/($ADV$a|$CONJ${l}coord:adv\|${r})($VERB$a)/$2/g;

# TermR: PRP NOUN [Fc] [PRP] [NOUN] [CONJ<lemma:$CCord>] [PRP] [NOUN]
# NEXT
# CoordL: PRP [NOUN] [Fc] [PRP] [NOUN] CONJ<lemma:$CCord> [PRP] [NOUN]
# NEXT
# PunctL: [PRP] [NOUN] Fc [PRP] [NOUN] CONJ<lemma:$CCord> [PRP] [NOUN]
# Recursivity: 3
(@temp) = ($listTags =~ /($PRP$a)($NOUN$a)(?:$Fc$a)(?:$PRP$a)(?:$NOUN$a)(?:$CONJ${l}lemma:$CCord\|${r})(?:$PRP$a)(?:$NOUN$a)/g);
$Rel =  "TermR";
HeadDep($Rel,"",@temp);
(@temp) = ($listTags =~ /($PRP$a)(?:$NOUN$a)(?:$Fc$a)(?:$PRP$a)(?:$NOUN$a)($CONJ${l}lemma:$CCord\|${r})(?:$PRP$a)(?:$NOUN$a)/g);
$Rel =  "CoordL";
DepHead($Rel,"",@temp);
(@temp) = ($listTags =~ /(?:$PRP$a)(?:$NOUN$a)($Fc$a)(?:$PRP$a)(?:$NOUN$a)($CONJ${l}lemma:$CCord\|${r})(?:$PRP$a)(?:$NOUN$a)/g);
$Rel =  "PunctL";
DepHead($Rel,"",@temp);
$listTags =~ s/($PRP$a)($NOUN$a)($Fc$a)($PRP$a)($NOUN$a)($CONJ${l}lemma:$CCord\|${r})($PRP$a)($NOUN$a)/$4$5$6$7$8/g;
(@temp) = ($listTags =~ /($PRP$a)($NOUN$a)(?:$Fc$a)(?:$PRP$a)(?:$NOUN$a)(?:$CONJ${l}lemma:$CCord\|${r})(?:$PRP$a)(?:$NOUN$a)/g);
$Rel =  "TermR";
HeadDep($Rel,"",@temp);
(@temp) = ($listTags =~ /($PRP$a)(?:$NOUN$a)(?:$Fc$a)(?:$PRP$a)(?:$NOUN$a)($CONJ${l}lemma:$CCord\|${r})(?:$PRP$a)(?:$NOUN$a)/g);
$Rel =  "CoordL";
DepHead($Rel,"",@temp);
(@temp) = ($listTags =~ /(?:$PRP$a)(?:$NOUN$a)($Fc$a)(?:$PRP$a)(?:$NOUN$a)($CONJ${l}lemma:$CCord\|${r})(?:$PRP$a)(?:$NOUN$a)/g);
$Rel =  "PunctL";
DepHead($Rel,"",@temp);
$listTags =~ s/($PRP$a)($NOUN$a)($Fc$a)($PRP$a)($NOUN$a)($CONJ${l}lemma:$CCord\|${r})($PRP$a)($NOUN$a)/$4$5$6$7$8/g;
(@temp) = ($listTags =~ /($PRP$a)($NOUN$a)(?:$Fc$a)(?:$PRP$a)(?:$NOUN$a)(?:$CONJ${l}lemma:$CCord\|${r})(?:$PRP$a)(?:$NOUN$a)/g);
$Rel =  "TermR";
HeadDep($Rel,"",@temp);
(@temp) = ($listTags =~ /($PRP$a)(?:$NOUN$a)(?:$Fc$a)(?:$PRP$a)(?:$NOUN$a)($CONJ${l}lemma:$CCord\|${r})(?:$PRP$a)(?:$NOUN$a)/g);
$Rel =  "CoordL";
DepHead($Rel,"",@temp);
(@temp) = ($listTags =~ /(?:$PRP$a)(?:$NOUN$a)($Fc$a)(?:$PRP$a)(?:$NOUN$a)($CONJ${l}lemma:$CCord\|${r})(?:$PRP$a)(?:$NOUN$a)/g);
$Rel =  "PunctL";
DepHead($Rel,"",@temp);
$listTags =~ s/($PRP$a)($NOUN$a)($Fc$a)($PRP$a)($NOUN$a)($CONJ${l}lemma:$CCord\|${r})($PRP$a)($NOUN$a)/$4$5$6$7$8/g;
(@temp) = ($listTags =~ /($PRP$a)($NOUN$a)(?:$Fc$a)(?:$PRP$a)(?:$NOUN$a)(?:$CONJ${l}lemma:$CCord\|${r})(?:$PRP$a)(?:$NOUN$a)/g);
$Rel =  "TermR";
HeadDep($Rel,"",@temp);
(@temp) = ($listTags =~ /($PRP$a)(?:$NOUN$a)(?:$Fc$a)(?:$PRP$a)(?:$NOUN$a)($CONJ${l}lemma:$CCord\|${r})(?:$PRP$a)(?:$NOUN$a)/g);
$Rel =  "CoordL";
DepHead($Rel,"",@temp);
(@temp) = ($listTags =~ /(?:$PRP$a)(?:$NOUN$a)($Fc$a)(?:$PRP$a)(?:$NOUN$a)($CONJ${l}lemma:$CCord\|${r})(?:$PRP$a)(?:$NOUN$a)/g);
$Rel =  "PunctL";
DepHead($Rel,"",@temp);
$listTags =~ s/($PRP$a)($NOUN$a)($Fc$a)($PRP$a)($NOUN$a)($CONJ${l}lemma:$CCord\|${r})($PRP$a)($NOUN$a)/$4$5$6$7$8/g;

# CoordL: [Fc]? PRP [NOUN] CONJ<lemma:$CCord> [PRP] [NOUN]
# NEXT
# TermR: [Fc]? [PRP] [NOUN] [CONJ<lemma:$CCord>] PRP NOUN
# NEXT
# TermR: [Fc]? PRP NOUN [CONJ<lemma:$CCord>] [PRP] [NOUN]
# NEXT
# CoordR: [Fc]? [PRP] [NOUN] CONJ<lemma:$CCord> PRP [NOUN]
# Add: coord:cprep
(@temp) = ($listTags =~ /(?:$Fc$a)?($PRP$a)(?:$NOUN$a)($CONJ${l}lemma:$CCord\|${r})(?:$PRP$a)(?:$NOUN$a)/g);
$Rel =  "CoordL";
DepHead($Rel,"",@temp);
(@temp) = ($listTags =~ /(?:$Fc$a)?(?:$PRP$a)(?:$NOUN$a)(?:$CONJ${l}lemma:$CCord\|${r})($PRP$a)($NOUN$a)/g);
$Rel =  "TermR";
HeadDep($Rel,"",@temp);
(@temp) = ($listTags =~ /(?:$Fc$a)?($PRP$a)($NOUN$a)(?:$CONJ${l}lemma:$CCord\|${r})(?:$PRP$a)(?:$NOUN$a)/g);
$Rel =  "TermR";
HeadDep($Rel,"",@temp);
(@temp) = ($listTags =~ /(?:$Fc$a)?(?:$PRP$a)(?:$NOUN$a)($CONJ${l}lemma:$CCord\|${r})($PRP$a)(?:$NOUN$a)/g);
$Rel =  "CoordR";
HeadDep($Rel,"",@temp);
$listTags =~ s/($Fc$a)?($PRP$a)($NOUN$a)($CONJ${l}lemma:$CCord\|${r})($PRP$a)($NOUN$a)/$1$4/g;
Add("HeadDep","coord:cprep",@temp);

# CprepR: [NOUNSINGLE] [PRP] [NOUNSINGLE] [PRP] [NOUNSINGLE] [PRP] [NOUNSINGLE] [PRP] NOUN<type:C> PRP<lemma:$PrepRA> NOUNSINGLE|PRO<type:D|P|I|X>
(@temp) = ($listTags =~ /(?:$NOUNSINGLE$a)(?:$PRP$a)(?:$NOUNSINGLE$a)(?:$PRP$a)(?:$NOUNSINGLE$a)(?:$PRP$a)(?:$NOUNSINGLE$a)(?:$PRP$a)($NOUN${l}type:C\|${r})($PRP${l}lemma:$PrepRA\|${r})($NOUNSINGLE$a|$PRO${l}type:(?:D|P|I|X)\|${r})/g);
$Rel =  "CprepR";
HeadRelDep($Rel,"",@temp);
$listTags =~ s/($NOUNSINGLE$a)($PRP$a)($NOUNSINGLE$a)($PRP$a)($NOUNSINGLE$a)($PRP$a)($NOUNSINGLE$a)($PRP$a)($NOUN${l}type:C\|${r})($PRP${l}lemma:$PrepRA\|${r})($NOUNSINGLE$a|$PRO${l}type:(?:D|P|I|X)\|${r})/$1$2$3$4$5$6$7$8$9/g;

# CprepR: [NOUNSINGLE] [PRP] [NOUNSINGLE] [PRP] [NOUNSINGLE] [PRP] NOUN<type:C> PRP<lemma:$PrepRA> NOUNSINGLE|PRO<type:D|P|I|X>
(@temp) = ($listTags =~ /(?:$NOUNSINGLE$a)(?:$PRP$a)(?:$NOUNSINGLE$a)(?:$PRP$a)(?:$NOUNSINGLE$a)(?:$PRP$a)($NOUN${l}type:C\|${r})($PRP${l}lemma:$PrepRA\|${r})($NOUNSINGLE$a|$PRO${l}type:(?:D|P|I|X)\|${r})/g);
$Rel =  "CprepR";
HeadRelDep($Rel,"",@temp);
$listTags =~ s/($NOUNSINGLE$a)($PRP$a)($NOUNSINGLE$a)($PRP$a)($NOUNSINGLE$a)($PRP$a)($NOUN${l}type:C\|${r})($PRP${l}lemma:$PrepRA\|${r})($NOUNSINGLE$a|$PRO${l}type:(?:D|P|I|X)\|${r})/$1$2$3$4$5$6$7/g;

# CprepR: [NOUNSINGLE] [PRP] [NOUNSINGLE] [PRP] NOUN<type:C> PRP<lemma:$PrepRA> NOUNSINGLE|PRO<type:D|P|I|X>
(@temp) = ($listTags =~ /(?:$NOUNSINGLE$a)(?:$PRP$a)(?:$NOUNSINGLE$a)(?:$PRP$a)($NOUN${l}type:C\|${r})($PRP${l}lemma:$PrepRA\|${r})($NOUNSINGLE$a|$PRO${l}type:(?:D|P|I|X)\|${r})/g);
$Rel =  "CprepR";
HeadRelDep($Rel,"",@temp);
$listTags =~ s/($NOUNSINGLE$a)($PRP$a)($NOUNSINGLE$a)($PRP$a)($NOUN${l}type:C\|${r})($PRP${l}lemma:$PrepRA\|${r})($NOUNSINGLE$a|$PRO${l}type:(?:D|P|I|X)\|${r})/$1$2$3$4$5/g;

# CprepR: [NOUNSINGLE] [PRP] NOUN<type:C> PRP<lemma:$PrepRA> NOUNSINGLE|PRO<type:D|P|I|X>
(@temp) = ($listTags =~ /(?:$NOUNSINGLE$a)(?:$PRP$a)($NOUN${l}type:C\|${r})($PRP${l}lemma:$PrepRA\|${r})($NOUNSINGLE$a|$PRO${l}type:(?:D|P|I|X)\|${r})/g);
$Rel =  "CprepR";
HeadRelDep($Rel,"",@temp);
$listTags =~ s/($NOUNSINGLE$a)($PRP$a)($NOUN${l}type:C\|${r})($PRP${l}lemma:$PrepRA\|${r})($NOUNSINGLE$a|$PRO${l}type:(?:D|P|I|X)\|${r})/$1$2$3/g;

# CprepR: NOUN<type:C> PRP<lemma:$PrepRA> NOUNSINGLE|PRO<type:D|P|I|X>
(@temp) = ($listTags =~ /($NOUN${l}type:C\|${r})($PRP${l}lemma:$PrepRA\|${r})($NOUNSINGLE$a|$PRO${l}type:(?:D|P|I|X)\|${r})/g);
$Rel =  "CprepR";
HeadRelDep($Rel,"",@temp);
$listTags =~ s/($NOUN${l}type:C\|${r})($PRP${l}lemma:$PrepRA\|${r})($NOUNSINGLE$a|$PRO${l}type:(?:D|P|I|X)\|${r})/$1/g;

# CprepR: [NOUNSINGLE] [PRP] [NOUNSINGLE] [PRP] [NOUNSINGLE] [PRP] [NOUNSINGLE] [PRP] NOUNSINGLE PRP<lemma:de> NOUNSINGLE|PRO<type:D|P|I|X>
(@temp) = ($listTags =~ /(?:$NOUNSINGLE$a)(?:$PRP$a)(?:$NOUNSINGLE$a)(?:$PRP$a)(?:$NOUNSINGLE$a)(?:$PRP$a)(?:$NOUNSINGLE$a)(?:$PRP$a)($NOUNSINGLE$a)($PRP${l}lemma:de\|${r})($NOUNSINGLE$a|$PRO${l}type:(?:D|P|I|X)\|${r})/g);
$Rel =  "CprepR";
HeadRelDep($Rel,"",@temp);
$listTags =~ s/($NOUNSINGLE$a)($PRP$a)($NOUNSINGLE$a)($PRP$a)($NOUNSINGLE$a)($PRP$a)($NOUNSINGLE$a)($PRP$a)($NOUNSINGLE$a)($PRP${l}lemma:de\|${r})($NOUNSINGLE$a|$PRO${l}type:(?:D|P|I|X)\|${r})/$1$2$3$4$5$6$7$8$9/g;

# CprepR: [NOUNSINGLE] [PRP] [NOUNSINGLE] [PRP] [NOUNSINGLE] [PRP] NOUNSINGLE PRP<lemma:de> NOUNSINGLE|PRO<type:D|P|I|X>
(@temp) = ($listTags =~ /(?:$NOUNSINGLE$a)(?:$PRP$a)(?:$NOUNSINGLE$a)(?:$PRP$a)(?:$NOUNSINGLE$a)(?:$PRP$a)($NOUNSINGLE$a)($PRP${l}lemma:de\|${r})($NOUNSINGLE$a|$PRO${l}type:(?:D|P|I|X)\|${r})/g);
$Rel =  "CprepR";
HeadRelDep($Rel,"",@temp);
$listTags =~ s/($NOUNSINGLE$a)($PRP$a)($NOUNSINGLE$a)($PRP$a)($NOUNSINGLE$a)($PRP$a)($NOUNSINGLE$a)($PRP${l}lemma:de\|${r})($NOUNSINGLE$a|$PRO${l}type:(?:D|P|I|X)\|${r})/$1$2$3$4$5$6$7/g;

# CprepR: [NOUNSINGLE] [PRP] [NOUNSINGLE] [PRP] NOUNSINGLE PRP<lemma:de> NOUNSINGLE|PRO<type:D|P|I|X>
(@temp) = ($listTags =~ /(?:$NOUNSINGLE$a)(?:$PRP$a)(?:$NOUNSINGLE$a)(?:$PRP$a)($NOUNSINGLE$a)($PRP${l}lemma:de\|${r})($NOUNSINGLE$a|$PRO${l}type:(?:D|P|I|X)\|${r})/g);
$Rel =  "CprepR";
HeadRelDep($Rel,"",@temp);
$listTags =~ s/($NOUNSINGLE$a)($PRP$a)($NOUNSINGLE$a)($PRP$a)($NOUNSINGLE$a)($PRP${l}lemma:de\|${r})($NOUNSINGLE$a|$PRO${l}type:(?:D|P|I|X)\|${r})/$1$2$3$4$5/g;

# CprepR: [NOUNSINGLE] [PRP] NOUNSINGLE PRP<lemma:de> NOUNSINGLE|PRO<type:D|P|I|X>
(@temp) = ($listTags =~ /(?:$NOUNSINGLE$a)(?:$PRP$a)($NOUNSINGLE$a)($PRP${l}lemma:de\|${r})($NOUNSINGLE$a|$PRO${l}type:(?:D|P|I|X)\|${r})/g);
$Rel =  "CprepR";
HeadRelDep($Rel,"",@temp);
$listTags =~ s/($NOUNSINGLE$a)($PRP$a)($NOUNSINGLE$a)($PRP${l}lemma:de\|${r})($NOUNSINGLE$a|$PRO${l}type:(?:D|P|I|X)\|${r})/$1$2$3/g;

# CprepR: NOUNSINGLE PRP<lemma:de> NOUNSINGLE|PRO<type:D|P|I|X>
(@temp) = ($listTags =~ /($NOUNSINGLE$a)($PRP${l}lemma:de\|${r})($NOUNSINGLE$a|$PRO${l}type:(?:D|P|I|X)\|${r})/g);
$Rel =  "CprepR";
HeadRelDep($Rel,"",@temp);
$listTags =~ s/($NOUNSINGLE$a)($PRP${l}lemma:de\|${r})($NOUNSINGLE$a|$PRO${l}type:(?:D|P|I|X)\|${r})/$1/g;

# CprepR: X<lemma:uno>|PRO<type:[DI]> PRP NOUNSINGLE|PRO<type:D|P|I|X>
# Add: tag:PRO
(@temp) = ($listTags =~ /($X${l}lemma:uno\|${r}|$PRO${l}type:[DI]\|${r})($PRP$a)($NOUNSINGLE$a|$PRO${l}type:(?:D|P|I|X)\|${r})/g);
$Rel =  "CprepR";
HeadRelDep($Rel,"",@temp);
$listTags =~ s/($X${l}lemma:uno\|${r}|$PRO${l}type:[DI]\|${r})($PRP$a)($NOUNSINGLE$a|$PRO${l}type:(?:D|P|I|X)\|${r})/$1/g;
Add("HeadRelDep","tag:PRO",@temp);

# TermR: PRP<nomin:yes> NOUNSINGLE|PRO<type:D|P|I|X>
(@temp) = ($listTags =~ /($PRP${l}nomin:yes\|${r})($NOUNSINGLE$a|$PRO${l}type:(?:D|P|I|X)\|${r})/g);
$Rel =  "TermR";
HeadDep($Rel,"",@temp);
$listTags =~ s/($PRP${l}nomin:yes\|${r})($NOUNSINGLE$a|$PRO${l}type:(?:D|P|I|X)\|${r})/$1/g;

# CoordL: NP [Fc] [NP] CONJ<(type:C)|(lemma:$CCord)> [NP]
# NEXT
# PunctL: [NP] Fc [NP] CONJ<(type:C)|(lemma:$CCord)> [NP]
# Recursivity: 10
(@temp) = ($listTags =~ /($NP)(?:$Fc$a)(?:$NP)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})(?:$NP)/g);
$Rel =  "CoordL";
DepHead($Rel,"",@temp);
(@temp) = ($listTags =~ /(?:$NP)($Fc$a)(?:$NP)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})(?:$NP)/g);
$Rel =  "PunctL";
DepHead($Rel,"",@temp);
$listTags =~ s/($NP)($Fc$a)($NP)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})($NP)/$3$4$5/g;
(@temp) = ($listTags =~ /($NP)(?:$Fc$a)(?:$NP)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})(?:$NP)/g);
$Rel =  "CoordL";
DepHead($Rel,"",@temp);
(@temp) = ($listTags =~ /(?:$NP)($Fc$a)(?:$NP)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})(?:$NP)/g);
$Rel =  "PunctL";
DepHead($Rel,"",@temp);
$listTags =~ s/($NP)($Fc$a)($NP)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})($NP)/$3$4$5/g;
(@temp) = ($listTags =~ /($NP)(?:$Fc$a)(?:$NP)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})(?:$NP)/g);
$Rel =  "CoordL";
DepHead($Rel,"",@temp);
(@temp) = ($listTags =~ /(?:$NP)($Fc$a)(?:$NP)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})(?:$NP)/g);
$Rel =  "PunctL";
DepHead($Rel,"",@temp);
$listTags =~ s/($NP)($Fc$a)($NP)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})($NP)/$3$4$5/g;
(@temp) = ($listTags =~ /($NP)(?:$Fc$a)(?:$NP)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})(?:$NP)/g);
$Rel =  "CoordL";
DepHead($Rel,"",@temp);
(@temp) = ($listTags =~ /(?:$NP)($Fc$a)(?:$NP)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})(?:$NP)/g);
$Rel =  "PunctL";
DepHead($Rel,"",@temp);
$listTags =~ s/($NP)($Fc$a)($NP)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})($NP)/$3$4$5/g;
(@temp) = ($listTags =~ /($NP)(?:$Fc$a)(?:$NP)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})(?:$NP)/g);
$Rel =  "CoordL";
DepHead($Rel,"",@temp);
(@temp) = ($listTags =~ /(?:$NP)($Fc$a)(?:$NP)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})(?:$NP)/g);
$Rel =  "PunctL";
DepHead($Rel,"",@temp);
$listTags =~ s/($NP)($Fc$a)($NP)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})($NP)/$3$4$5/g;
(@temp) = ($listTags =~ /($NP)(?:$Fc$a)(?:$NP)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})(?:$NP)/g);
$Rel =  "CoordL";
DepHead($Rel,"",@temp);
(@temp) = ($listTags =~ /(?:$NP)($Fc$a)(?:$NP)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})(?:$NP)/g);
$Rel =  "PunctL";
DepHead($Rel,"",@temp);
$listTags =~ s/($NP)($Fc$a)($NP)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})($NP)/$3$4$5/g;
(@temp) = ($listTags =~ /($NP)(?:$Fc$a)(?:$NP)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})(?:$NP)/g);
$Rel =  "CoordL";
DepHead($Rel,"",@temp);
(@temp) = ($listTags =~ /(?:$NP)($Fc$a)(?:$NP)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})(?:$NP)/g);
$Rel =  "PunctL";
DepHead($Rel,"",@temp);
$listTags =~ s/($NP)($Fc$a)($NP)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})($NP)/$3$4$5/g;
(@temp) = ($listTags =~ /($NP)(?:$Fc$a)(?:$NP)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})(?:$NP)/g);
$Rel =  "CoordL";
DepHead($Rel,"",@temp);
(@temp) = ($listTags =~ /(?:$NP)($Fc$a)(?:$NP)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})(?:$NP)/g);
$Rel =  "PunctL";
DepHead($Rel,"",@temp);
$listTags =~ s/($NP)($Fc$a)($NP)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})($NP)/$3$4$5/g;
(@temp) = ($listTags =~ /($NP)(?:$Fc$a)(?:$NP)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})(?:$NP)/g);
$Rel =  "CoordL";
DepHead($Rel,"",@temp);
(@temp) = ($listTags =~ /(?:$NP)($Fc$a)(?:$NP)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})(?:$NP)/g);
$Rel =  "PunctL";
DepHead($Rel,"",@temp);
$listTags =~ s/($NP)($Fc$a)($NP)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})($NP)/$3$4$5/g;
(@temp) = ($listTags =~ /($NP)(?:$Fc$a)(?:$NP)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})(?:$NP)/g);
$Rel =  "CoordL";
DepHead($Rel,"",@temp);
(@temp) = ($listTags =~ /(?:$NP)($Fc$a)(?:$NP)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})(?:$NP)/g);
$Rel =  "PunctL";
DepHead($Rel,"",@temp);
$listTags =~ s/($NP)($Fc$a)($NP)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})($NP)/$3$4$5/g;
(@temp) = ($listTags =~ /($NP)(?:$Fc$a)(?:$NP)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})(?:$NP)/g);
$Rel =  "CoordL";
DepHead($Rel,"",@temp);
(@temp) = ($listTags =~ /(?:$NP)($Fc$a)(?:$NP)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})(?:$NP)/g);
$Rel =  "PunctL";
DepHead($Rel,"",@temp);
$listTags =~ s/($NP)($Fc$a)($NP)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})($NP)/$3$4$5/g;

# CoordL: [Fc]? NP CONJ<(type:C)|(lemma:$CCord)> [NP]
# NEXT
# CoordR: [Fc]? [NP] CONJ<(type:C)|(lemma:$CCord)> NP
# Add: coord:noun
(@temp) = ($listTags =~ /(?:$Fc$a)?($NP)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})(?:$NP)/g);
$Rel =  "CoordL";
DepHead($Rel,"",@temp);
(@temp) = ($listTags =~ /(?:$Fc$a)?(?:$NP)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})($NP)/g);
$Rel =  "CoordR";
HeadDep($Rel,"",@temp);
$listTags =~ s/($Fc$a)?($NP)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})($NP)/$1$3/g;
Add("HeadDep","coord:noun",@temp);

# PunctL: Fc CONJ<coord:noun>
(@temp) = ($listTags =~ /($Fc$a)($CONJ${l}coord:noun\|${r})/g);
$Rel =  "PunctL";
DepHead($Rel,"",@temp);
$listTags =~ s/($Fc$a)($CONJ${l}coord:noun\|${r})/$2/g;

# PunctL: [NOUNCOORD|PRO<type:D|P|I|X>] Fc|Fpa|Fca NOUNCOORD|CARD|ADJ|PRO<type:D|P|I|X> [Fc|Fpt|Fct]
# NEXT
# PunctR: [NOUNCOORD|PRO<type:D|P|I|X>] [Fc|Fpa|Fca] NOUNCOORD|CARD|ADJ|PRO<type:D|P|I|X> Fc|Fpt|Fct
# NEXT
# AdjnR: NOUNCOORD|PRO<type:D|P|I|X> [Fc|Fpa|Fca] NOUNCOORD|CARD|ADJ|PRO<type:D|P|I|X> [Fc|Fpt|Fct]
(@temp) = ($listTags =~ /(?:$NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r})($Fc$a|$Fpa$a|$Fca$a)($NOUNCOORD|$CARD$a|$ADJ$a|$PRO${l}type:(?:D|P|I|X)\|${r})(?:$Fc$a|$Fpt$a|$Fct$a)/g);
$Rel =  "PunctL";
DepHead($Rel,"",@temp);
(@temp) = ($listTags =~ /(?:$NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r})(?:$Fc$a|$Fpa$a|$Fca$a)($NOUNCOORD|$CARD$a|$ADJ$a|$PRO${l}type:(?:D|P|I|X)\|${r})($Fc$a|$Fpt$a|$Fct$a)/g);
$Rel =  "PunctR";
HeadDep($Rel,"",@temp);
(@temp) = ($listTags =~ /($NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r})(?:$Fc$a|$Fpa$a|$Fca$a)($NOUNCOORD|$CARD$a|$ADJ$a|$PRO${l}type:(?:D|P|I|X)\|${r})(?:$Fc$a|$Fpt$a|$Fct$a)/g);
$Rel =  "AdjnR";
HeadDep($Rel,"",@temp);
$listTags =~ s/($NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r})($Fc$a|$Fpa$a|$Fca$a)($NOUNCOORD|$CARD$a|$ADJ$a|$PRO${l}type:(?:D|P|I|X)\|${r})($Fc$a|$Fpt$a|$Fct$a)/$1/g;

# PunctL: [NOUNCOORD|PRO<type:D|P|I|X>] Fc|Fpa|Fca [PRP] NOUNCOORD|PRO<type:D|P|I|X>|CARD [Fc|Fpt|Fct]
# NEXT
# PunctR: [NOUNCOORD|PRO<type:D|P|I|X>] [Fc|Fpa|Fca] [PRP] NOUNCOORD|PRO<type:D|P|I|X>|CARD Fc|Fpt|Fct
# NEXT
# CprepR: NOUNCOORD|PRO<type:D|P|I|X> [Fc|Fpa|Fca] PRP NOUNCOORD|PRO<type:D|P|I|X>|CARD [Fc|Fpt|Fct]
(@temp) = ($listTags =~ /(?:$NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r})($Fc$a|$Fpa$a|$Fca$a)(?:$PRP$a)($NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r}|$CARD$a)(?:$Fc$a|$Fpt$a|$Fct$a)/g);
$Rel =  "PunctL";
DepHead($Rel,"",@temp);
(@temp) = ($listTags =~ /(?:$NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r})(?:$Fc$a|$Fpa$a|$Fca$a)(?:$PRP$a)($NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r}|$CARD$a)($Fc$a|$Fpt$a|$Fct$a)/g);
$Rel =  "PunctR";
HeadDep($Rel,"",@temp);
(@temp) = ($listTags =~ /($NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r})(?:$Fc$a|$Fpa$a|$Fca$a)($PRP$a)($NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r}|$CARD$a)(?:$Fc$a|$Fpt$a|$Fct$a)/g);
$Rel =  "CprepR";
HeadRelDep($Rel,"",@temp);
$listTags =~ s/($NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r})($Fc$a|$Fpa$a|$Fca$a)($PRP$a)($NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r}|$CARD$a)($Fc$a|$Fpt$a|$Fct$a)/$1/g;

# AdjnR: NOUNCOORD|PRO<type:D|P|I|X> [Fc|Fpa|Fca] VERB<mode:P> [X]? [X]? [X]? [X]? [X]? [X]? [X]? [X]? [X]? [X]? [Fc|Fpt|Fct]
# NoUniq
(@temp) = ($listTags =~ /($NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r})(?:$Fc$a|$Fpa$a|$Fca$a)($VERB${l}mode:P\|${r})(?:$X$a)?(?:$X$a)?(?:$X$a)?(?:$X$a)?(?:$X$a)?(?:$X$a)?(?:$X$a)?(?:$X$a)?(?:$X$a)?(?:$X$a)?(?:$Fc$a|$Fpt$a|$Fct$a)/g);
$Rel =  "AdjnR";
HeadDep($Rel,"",@temp);
$listTags =~ s/($NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r})($Fc$a|$Fpa$a|$Fca$a)($VERB${l}mode:P\|${r})($X$a)?($X$a)?($X$a)?($X$a)?($X$a)?($X$a)?($X$a)?($X$a)?($X$a)?($X$a)?($Fc$a|$Fpt$a|$Fct$a)/$1$2$3$4$5$6$7$8$9$10$11$12$13$14/g;

# Single: [VERB<lemma:$SubcatClaus>]  [PRP<lemma:a>] [NOUNCOORD|PRO<type:D|P|I|X>] PRO<type:R>  [NOUNCOORD|PRO<type:D|P|I|X>]?  [VERB<mode:[^PNG]>]
# Corr: tag:CONJ, type:S
(@temp) = ($listTags =~ /(?:$VERB${l}lemma:$SubcatClaus\|${r})(?:$PRP${l}lemma:a\|${r})(?:$NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r})($PRO${l}type:R\|${r})(?:$NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r})?(?:$VERB${l}mode:[^PNG]\|${r})/g);
$Rel =  "Single";
Head($Rel,"",@temp);
$listTags =~ s/($VERB${l}lemma:$SubcatClaus\|${r})($PRP${l}lemma:a\|${r})($NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r})($PRO${l}type:R\|${r})($NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r})?($VERB${l}mode:[^PNG]\|${r})/$1$2$3$4$5$6/g;
Corr("Head","tag:CONJ,type:S",@temp);

# Single: [VERB<lemma:$SubcatClaus>]  [ADJ] PRO<type:R>  [NOUNCOORD|PRO<type:D|P|I|X>]?  [VERB<mode:[^PNG]>]
# Corr: tag:CONJ, type:S
(@temp) = ($listTags =~ /(?:$VERB${l}lemma:$SubcatClaus\|${r})(?:$ADJ$a)($PRO${l}type:R\|${r})(?:$NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r})?(?:$VERB${l}mode:[^PNG]\|${r})/g);
$Rel =  "Single";
Head($Rel,"",@temp);
$listTags =~ s/($VERB${l}lemma:$SubcatClaus\|${r})($ADJ$a)($PRO${l}type:R\|${r})($NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r})?($VERB${l}mode:[^PNG]\|${r})/$1$2$3$4$5/g;
Corr("Head","tag:CONJ,type:S",@temp);

# SubjL: [NOUNCOORD] PRO<type:R|W> VERB|CONJ<coord:verb>
# NEXT
# AdjnR: NOUNCOORD [PRO<type:R|W>] VERB|CONJ<coord:verb>
# NoUniq
(@temp) = ($listTags =~ /(?:$NOUNCOORD)($PRO${l}type:(?:R|W)\|${r})($VERB$a|$CONJ${l}coord:verb\|${r})/g);
$Rel =  "SubjL";
DepHead($Rel,"",@temp);
(@temp) = ($listTags =~ /($NOUNCOORD)(?:$PRO${l}type:(?:R|W)\|${r})($VERB$a|$CONJ${l}coord:verb\|${r})/g);
$Rel =  "AdjnR";
HeadDep($Rel,"",@temp);
$listTags =~ s/($NOUNCOORD)($PRO${l}type:(?:R|W)\|${r})($VERB$a|$CONJ${l}coord:verb\|${r})/$1$2$3/g;

# DobjL: [NOUNCOORD] PRO<type:R|W> [NOUNCOORD|PRO<type:D|P|I|X>] VERB|CONJ<coord:verb>
# NEXT
# AdjnR: NOUNCOORD [PRO<type:R|W>] [NOUNCOORD|PRO<type:D|P|I|X>] VERB|CONJ<coord:verb>
# NoUniq
(@temp) = ($listTags =~ /(?:$NOUNCOORD)($PRO${l}type:(?:R|W)\|${r})(?:$NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r})($VERB$a|$CONJ${l}coord:verb\|${r})/g);
$Rel =  "DobjL";
DepHead($Rel,"",@temp);
(@temp) = ($listTags =~ /($NOUNCOORD)(?:$PRO${l}type:(?:R|W)\|${r})(?:$NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r})($VERB$a|$CONJ${l}coord:verb\|${r})/g);
$Rel =  "AdjnR";
HeadDep($Rel,"",@temp);
$listTags =~ s/($NOUNCOORD)($PRO${l}type:(?:R|W)\|${r})($NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r})($VERB$a|$CONJ${l}coord:verb\|${r})/$1$2$3$4/g;

# CircL: [NOUNCOORD|PRO<type:D|P|I|X>]  PRP PRO<type:R|W> VERB|CONJ<coord:verb>
# NEXT
# AdjnR: NOUNCOORD|PRO<type:D|P|I|X> [PRP] [PRO<type:R|W>] VERB|CONJ<coord:verb>
# NoUniq
(@temp) = ($listTags =~ /(?:$NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r})($PRP$a)($PRO${l}type:(?:R|W)\|${r})($VERB$a|$CONJ${l}coord:verb\|${r})/g);
$Rel =  "CircL";
RelDepHead($Rel,"",@temp);
(@temp) = ($listTags =~ /($NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r})(?:$PRP$a)(?:$PRO${l}type:(?:R|W)\|${r})($VERB$a|$CONJ${l}coord:verb\|${r})/g);
$Rel =  "AdjnR";
HeadDep($Rel,"",@temp);
$listTags =~ s/($NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r})($PRP$a)($PRO${l}type:(?:R|W)\|${r})($VERB$a|$CONJ${l}coord:verb\|${r})/$1$2$3$4/g;

# AdjnR: NOUNCOORD|PRO<type:D|P|I|X>  VERB<mode:[GP]>|CONJ<coord:verb>
# NoUniq
(@temp) = ($listTags =~ /($NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r})($VERB${l}mode:[GP]\|${r}|$CONJ${l}coord:verb\|${r})/g);
$Rel =  "AdjnR";
HeadDep($Rel,"",@temp);
$listTags =~ s/($NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r})($VERB${l}mode:[GP]\|${r}|$CONJ${l}coord:verb\|${r})/$1$2/g;

# CircR: VERB<mode:P> [NOUNCOORD|PRO<type:D|P|I|X>] PRP<lemma:por|by> NOUNCOORD|PRO<type:D|P|I|X>|ADV
(@temp) = ($listTags =~ /($VERB${l}mode:P\|${r})(?:$NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r})($PRP${l}lemma:(?:por|by)\|${r})($NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r}|$ADV$a)/g);
$Rel =  "CircR";
HeadRelDep($Rel,"",@temp);
$listTags =~ s/($VERB${l}mode:P\|${r})($NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r})($PRP${l}lemma:(?:por|by)\|${r})($NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r}|$ADV$a)/$1$2/g;

# PunctR: VERB Fc [NOUNCOORD|PRO<type:D|P|I|X>] [PRP<lemma:$PrepMA>] [CARD|DATE]
# NEXT
# CircR: VERB [Fc]? [NOUNCOORD|PRO<type:D|P|I|X>] PRP<lemma:$PrepMA> CARD|DATE
(@temp) = ($listTags =~ /($VERB$a)($Fc$a)(?:$NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r})(?:$PRP${l}lemma:$PrepMA\|${r})(?:$CARD$a|$DATE$a)/g);
$Rel =  "PunctR";
HeadDep($Rel,"",@temp);
(@temp) = ($listTags =~ /($VERB$a)(?:$Fc$a)?(?:$NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r})($PRP${l}lemma:$PrepMA\|${r})($CARD$a|$DATE$a)/g);
$Rel =  "CircR";
HeadRelDep($Rel,"",@temp);
$listTags =~ s/($VERB$a)($Fc$a)?($NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r})($PRP${l}lemma:$PrepMA\|${r})($CARD$a|$DATE$a)/$1$3/g;

# CprepR: CARD PRP<lemma:de|entre|sobre|of|about|between> NOUNCOORD|PRO
(@temp) = ($listTags =~ /($CARD$a)($PRP${l}lemma:(?:de|entre|sobre|of|about|between)\|${r})($NOUNCOORD|$PRO$a)/g);
$Rel =  "CprepR";
HeadRelDep($Rel,"",@temp);
$listTags =~ s/($CARD$a)($PRP${l}lemma:(?:de|entre|sobre|of|about|between)\|${r})($NOUNCOORD|$PRO$a)/$1/g;

# CprepR: PRO<type:P> PRP<lemma:de|of> NOUNCOORD|PRO
(@temp) = ($listTags =~ /($PRO${l}type:P\|${r})($PRP${l}lemma:(?:de|of)\|${r})($NOUNCOORD|$PRO$a)/g);
$Rel =  "CprepR";
HeadRelDep($Rel,"",@temp);
$listTags =~ s/($PRO${l}type:P\|${r})($PRP${l}lemma:(?:de|of)\|${r})($NOUNCOORD|$PRO$a)/$1/g;

# CprepR: NOUNCOORD [PRP] [PRO<type:D|P|I|X>] PRP NOUNCOORD|ADV
# NEXT
# CprepR: NOUNCOORD PRP PRO<type:D|P|I|X> [PRP] [NOUNCOORD|ADV]
(@temp) = ($listTags =~ /($NOUNCOORD)(?:$PRP$a)(?:$PRO${l}type:(?:D|P|I|X)\|${r})($PRP$a)($NOUNCOORD|$ADV$a)/g);
$Rel =  "CprepR";
HeadRelDep($Rel,"",@temp);
(@temp) = ($listTags =~ /($NOUNCOORD)($PRP$a)($PRO${l}type:(?:D|P|I|X)\|${r})(?:$PRP$a)(?:$NOUNCOORD|$ADV$a)/g);
$Rel =  "CprepR";
HeadRelDep($Rel,"",@temp);
$listTags =~ s/($NOUNCOORD)($PRP$a)($PRO${l}type:(?:D|P|I|X)\|${r})($PRP$a)($NOUNCOORD|$ADV$a)/$1/g;

# PrepR: VERB [NOUNCOORD|PRO<type:D|P|I|X>] CONJ<coord:cprep>
(@temp) = ($listTags =~ /($VERB$a)(?:$NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r})($CONJ${l}coord:cprep\|${r})/g);
$Rel =  "PrepR";
HeadDep($Rel,"",@temp);
$listTags =~ s/($VERB$a)($NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r})($CONJ${l}coord:cprep\|${r})/$1$2/g;

# PrepR: NOUNCOORD|PRO<type:D|P|I|X> CONJ<coord:cprep>
(@temp) = ($listTags =~ /($NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r})($CONJ${l}coord:cprep\|${r})/g);
$Rel =  "PrepR";
HeadDep($Rel,"",@temp);
$listTags =~ s/($NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r})($CONJ${l}coord:cprep\|${r})/$1/g;

# SubjL: PRO<sust:yes>  VERB
# Add: nomin:yes adsubj:yes
# Inherit: number, person
(@temp) = ($listTags =~ /($PRO${l}sust:yes\|${r})($VERB$a)/g);
$Rel =  "SubjL";
DepHead($Rel,"",@temp);
$listTags =~ s/($PRO${l}sust:yes\|${r})($VERB$a)/$2/g;
Inherit("DepHead","number,person",@temp);
Add("DepHead","nomin:yes,adsubj:yes",@temp);

# SpecL: PRO<sust:yes> [NOUNCOORD|PRO<type:D|P|I|X>] [VERB]
# NEXT
# SubjL: [PRO<sust:yes>] NOUNCOORD|PRO<type:D|P|I|X> VERB
# Add: adsubj:yes
# NEXT
# DobjL: PRO<sust:yes> [NOUNCOORD|PRO<type:D|P|I|X>] VERB
# Add: nomin:yes
# Inherit: number, person
(@temp) = ($listTags =~ /($PRO${l}sust:yes\|${r})(?:$NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r})(?:$VERB$a)/g);
$Rel =  "SpecL";
DepHead($Rel,"",@temp);
(@temp) = ($listTags =~ /(?:$PRO${l}sust:yes\|${r})($NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r})($VERB$a)/g);
$Rel =  "SubjL";
DepHead($Rel,"",@temp);
Add("DepHead","adsubj:yes",@temp);
(@temp) = ($listTags =~ /($PRO${l}sust:yes\|${r})(?:$NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r})($VERB$a)/g);
$Rel =  "DobjL";
DepHead($Rel,"",@temp);
$listTags =~ s/($PRO${l}sust:yes\|${r})($NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r})($VERB$a)/$3/g;
Inherit("DepHead","number,person",@temp);
Add("DepHead","nomin:yes",@temp);

# AtrR: VERB<lemma:ser> NOUNCOORD|PRO<type:D|P|I|X>
(@temp) = ($listTags =~ /($VERB${l}lemma:ser\|${r})($NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r})/g);
$Rel =  "AtrR";
HeadDep($Rel,"",@temp);
$listTags =~ s/($VERB${l}lemma:ser\|${r})($NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r})/$1/g;

# AtrR: VERB ADJ|CONJ<coord:adj>
(@temp) = ($listTags =~ /($VERB$a)($ADJ$a|$CONJ${l}coord:adj\|${r})/g);
$Rel =  "AtrR";
HeadDep($Rel,"",@temp);
$listTags =~ s/($VERB$a)($ADJ$a|$CONJ${l}coord:adj\|${r})/$1/g;

# DobjR: VERB NOUNCOORD|PRO<type:D|P|I|X>
(@temp) = ($listTags =~ /($VERB$a)($NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r})/g);
$Rel =  "DobjR";
HeadDep($Rel,"",@temp);
$listTags =~ s/($VERB$a)($NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r})/$1/g;

# IobjR: VERB<lemma:($SubcatIND)|(SubcatBitr)>  [NOUNCOORD|PRO<type:D|P|I|X>]? PRP<lemma:a> NOUNCOORD|PRO<type:D|P|I|X>|VERB<mode:N>
(@temp) = ($listTags =~ /($VERB${l}lemma:$SubcatIND\|${r}|$VERB${l}SubcatBitr\|${r})(?:$NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r})?($PRP${l}lemma:a\|${r})($NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r}|$VERB${l}mode:N\|${r})/g);
$Rel =  "IobjR";
HeadRelDep($Rel,"",@temp);
$listTags =~ s/($VERB${l}lemma:$SubcatIND\|${r}|$VERB${l}SubcatBitr\|${r})($NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r})?($PRP${l}lemma:a\|${r})($NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r}|$VERB${l}mode:N\|${r})/$1$2/g;

# CregR: VERB<lemma:$SubcatA>  [NOUNCOORD|PRO<type:D|P|I|X>]? PRP<lemma:a> NOUNCOORD|PRO<type:D|P|I|X>|VERB<mode:N>
(@temp) = ($listTags =~ /($VERB${l}lemma:$SubcatA\|${r})(?:$NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r})?($PRP${l}lemma:a\|${r})($NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r}|$VERB${l}mode:N\|${r})/g);
$Rel =  "CregR";
HeadRelDep($Rel,"",@temp);
$listTags =~ s/($VERB${l}lemma:$SubcatA\|${r})($NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r})?($PRP${l}lemma:a\|${r})($NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r}|$VERB${l}mode:N\|${r})/$1$2/g;

# CregR: VERB<lemma:$SubcatEM>  [NOUNCOORD|PRO<type:D|P|I|X>]? PRP<lemma:en> NOUNCOORD|PRO<type:D|P|I|X>|VERB<mode:N>
(@temp) = ($listTags =~ /($VERB${l}lemma:$SubcatEM\|${r})(?:$NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r})?($PRP${l}lemma:en\|${r})($NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r}|$VERB${l}mode:N\|${r})/g);
$Rel =  "CregR";
HeadRelDep($Rel,"",@temp);
$listTags =~ s/($VERB${l}lemma:$SubcatEM\|${r})($NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r})?($PRP${l}lemma:en\|${r})($NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r}|$VERB${l}mode:N\|${r})/$1$2/g;

# CregR: VERB<lemma:$SubcatDE>  [NOUNCOORD|PRO<type:D|P|I|X>]? PRP<lemma:de> NOUNCOORD|PRO<type:D|P|I|X>|VERB<mode:N>
(@temp) = ($listTags =~ /($VERB${l}lemma:$SubcatDE\|${r})(?:$NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r})?($PRP${l}lemma:de\|${r})($NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r}|$VERB${l}mode:N\|${r})/g);
$Rel =  "CregR";
HeadRelDep($Rel,"",@temp);
$listTags =~ s/($VERB${l}lemma:$SubcatDE\|${r})($NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r})?($PRP${l}lemma:de\|${r})($NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r}|$VERB${l}mode:N\|${r})/$1$2/g;

# CregR: VERB<lemma:$SubcatCOM>  [NOUNCOORD|PRO<type:D|P|I|X>]? PRP<lemma:con> NOUNCOORD|PRO<type:D|P|I|X>|VERB<mode:N>
(@temp) = ($listTags =~ /($VERB${l}lemma:$SubcatCOM\|${r})(?:$NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r})?($PRP${l}lemma:con\|${r})($NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r}|$VERB${l}mode:N\|${r})/g);
$Rel =  "CregR";
HeadRelDep($Rel,"",@temp);
$listTags =~ s/($VERB${l}lemma:$SubcatCOM\|${r})($NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r})?($PRP${l}lemma:con\|${r})($NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r}|$VERB${l}mode:N\|${r})/$1$2/g;

# CregR: VERB<lemma:$SubcatPOR>  [NOUNCOORD|PRO<type:D|P|I|X>]? PRP<lemma:por> NOUNCOORD|PRO<type:D|P|I|X>|VERB<mode:N>
(@temp) = ($listTags =~ /($VERB${l}lemma:$SubcatPOR\|${r})(?:$NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r})?($PRP${l}lemma:por\|${r})($NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r}|$VERB${l}mode:N\|${r})/g);
$Rel =  "CregR";
HeadRelDep($Rel,"",@temp);
$listTags =~ s/($VERB${l}lemma:$SubcatPOR\|${r})($NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r})?($PRP${l}lemma:por\|${r})($NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r}|$VERB${l}mode:N\|${r})/$1$2/g;

# CregR: VERB<lemma:$SubcatPARA>  [NOUNCOORD|PRO<type:D|P|I|X>]? PRP<lemma:para|cara> NOUNCOORD|PRO<type:D|P|I|X>|VERB<mode:N>
(@temp) = ($listTags =~ /($VERB${l}lemma:$SubcatPARA\|${r})(?:$NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r})?($PRP${l}lemma:(?:para|cara)\|${r})($NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r}|$VERB${l}mode:N\|${r})/g);
$Rel =  "CregR";
HeadRelDep($Rel,"",@temp);
$listTags =~ s/($VERB${l}lemma:$SubcatPARA\|${r})($NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r})?($PRP${l}lemma:(?:para|cara)\|${r})($NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r}|$VERB${l}mode:N\|${r})/$1$2/g;

# CregR: VERB<lemma:$SubcatSOBRE>  [NOUNCOORD|PRO<type:D|P|I|X>]? PRP<lemma:sobre> NOUNCOORD|PRO<type:D|P|I|X>|VERB<mode:N>
(@temp) = ($listTags =~ /($VERB${l}lemma:$SubcatSOBRE\|${r})(?:$NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r})?($PRP${l}lemma:sobre\|${r})($NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r}|$VERB${l}mode:N\|${r})/g);
$Rel =  "CregR";
HeadRelDep($Rel,"",@temp);
$listTags =~ s/($VERB${l}lemma:$SubcatSOBRE\|${r})($NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r})?($PRP${l}lemma:sobre\|${r})($NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r}|$VERB${l}mode:N\|${r})/$1$2/g;

# CoordL: NP [Fc] [NP] CONJ<(type:C)|(lemma:$CCord)> [NP]
# NEXT
# PunctL: [NP] Fc [NP] CONJ<(type:C)|(lemma:$CCord)> [NP]
# Recursivity: 5
(@temp) = ($listTags =~ /($NP)(?:$Fc$a)(?:$NP)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})(?:$NP)/g);
$Rel =  "CoordL";
DepHead($Rel,"",@temp);
(@temp) = ($listTags =~ /(?:$NP)($Fc$a)(?:$NP)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})(?:$NP)/g);
$Rel =  "PunctL";
DepHead($Rel,"",@temp);
$listTags =~ s/($NP)($Fc$a)($NP)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})($NP)/$3$4$5/g;
(@temp) = ($listTags =~ /($NP)(?:$Fc$a)(?:$NP)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})(?:$NP)/g);
$Rel =  "CoordL";
DepHead($Rel,"",@temp);
(@temp) = ($listTags =~ /(?:$NP)($Fc$a)(?:$NP)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})(?:$NP)/g);
$Rel =  "PunctL";
DepHead($Rel,"",@temp);
$listTags =~ s/($NP)($Fc$a)($NP)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})($NP)/$3$4$5/g;
(@temp) = ($listTags =~ /($NP)(?:$Fc$a)(?:$NP)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})(?:$NP)/g);
$Rel =  "CoordL";
DepHead($Rel,"",@temp);
(@temp) = ($listTags =~ /(?:$NP)($Fc$a)(?:$NP)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})(?:$NP)/g);
$Rel =  "PunctL";
DepHead($Rel,"",@temp);
$listTags =~ s/($NP)($Fc$a)($NP)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})($NP)/$3$4$5/g;
(@temp) = ($listTags =~ /($NP)(?:$Fc$a)(?:$NP)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})(?:$NP)/g);
$Rel =  "CoordL";
DepHead($Rel,"",@temp);
(@temp) = ($listTags =~ /(?:$NP)($Fc$a)(?:$NP)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})(?:$NP)/g);
$Rel =  "PunctL";
DepHead($Rel,"",@temp);
$listTags =~ s/($NP)($Fc$a)($NP)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})($NP)/$3$4$5/g;
(@temp) = ($listTags =~ /($NP)(?:$Fc$a)(?:$NP)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})(?:$NP)/g);
$Rel =  "CoordL";
DepHead($Rel,"",@temp);
(@temp) = ($listTags =~ /(?:$NP)($Fc$a)(?:$NP)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})(?:$NP)/g);
$Rel =  "PunctL";
DepHead($Rel,"",@temp);
$listTags =~ s/($NP)($Fc$a)($NP)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})($NP)/$3$4$5/g;
(@temp) = ($listTags =~ /($NP)(?:$Fc$a)(?:$NP)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})(?:$NP)/g);
$Rel =  "CoordL";
DepHead($Rel,"",@temp);
(@temp) = ($listTags =~ /(?:$NP)($Fc$a)(?:$NP)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})(?:$NP)/g);
$Rel =  "PunctL";
DepHead($Rel,"",@temp);
$listTags =~ s/($NP)($Fc$a)($NP)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})($NP)/$3$4$5/g;

# CoordL: [Fc]? NP CONJ<(type:C)|(lemma:$CCord)> [NP]
# NEXT
# CoordR: [Fc]? [NP] CONJ<(type:C)|(lemma:$CCord)> NP
# Add: coord:noun
(@temp) = ($listTags =~ /(?:$Fc$a)?($NP)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})(?:$NP)/g);
$Rel =  "CoordL";
DepHead($Rel,"",@temp);
(@temp) = ($listTags =~ /(?:$Fc$a)?(?:$NP)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})($NP)/g);
$Rel =  "CoordR";
HeadDep($Rel,"",@temp);
$listTags =~ s/($Fc$a)?($NP)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})($NP)/$1$3/g;
Add("HeadDep","coord:noun",@temp);

# PunctL: Fc CONJ<coord:noun>
(@temp) = ($listTags =~ /($Fc$a)($CONJ${l}coord:noun\|${r})/g);
$Rel =  "PunctL";
DepHead($Rel,"",@temp);
$listTags =~ s/($Fc$a)($CONJ${l}coord:noun\|${r})/$2/g;

# CoordL: VERB<nomin:no> [Fc] [VERB<nomin:no>] CONJ<(type:C)|(lemma:$CCord)> [VERB<nomin:no>]
# NEXT
# PunctL: [VERB<nomin:no>] Fc [VERB<nomin:no>] CONJ<(type:C)|(lemma:$CCord)> [VERB<nomin:no>]
# Recursivity: 5
(@temp) = ($listTags =~ /($VERB${l}nomin:no\|${r})(?:$Fc$a)(?:$VERB${l}nomin:no\|${r})($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})(?:$VERB${l}nomin:no\|${r})/g);
$Rel =  "CoordL";
DepHead($Rel,"",@temp);
(@temp) = ($listTags =~ /(?:$VERB${l}nomin:no\|${r})($Fc$a)(?:$VERB${l}nomin:no\|${r})($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})(?:$VERB${l}nomin:no\|${r})/g);
$Rel =  "PunctL";
DepHead($Rel,"",@temp);
$listTags =~ s/($VERB${l}nomin:no\|${r})($Fc$a)($VERB${l}nomin:no\|${r})($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})($VERB${l}nomin:no\|${r})/$3$4$5/g;
(@temp) = ($listTags =~ /($VERB${l}nomin:no\|${r})(?:$Fc$a)(?:$VERB${l}nomin:no\|${r})($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})(?:$VERB${l}nomin:no\|${r})/g);
$Rel =  "CoordL";
DepHead($Rel,"",@temp);
(@temp) = ($listTags =~ /(?:$VERB${l}nomin:no\|${r})($Fc$a)(?:$VERB${l}nomin:no\|${r})($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})(?:$VERB${l}nomin:no\|${r})/g);
$Rel =  "PunctL";
DepHead($Rel,"",@temp);
$listTags =~ s/($VERB${l}nomin:no\|${r})($Fc$a)($VERB${l}nomin:no\|${r})($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})($VERB${l}nomin:no\|${r})/$3$4$5/g;
(@temp) = ($listTags =~ /($VERB${l}nomin:no\|${r})(?:$Fc$a)(?:$VERB${l}nomin:no\|${r})($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})(?:$VERB${l}nomin:no\|${r})/g);
$Rel =  "CoordL";
DepHead($Rel,"",@temp);
(@temp) = ($listTags =~ /(?:$VERB${l}nomin:no\|${r})($Fc$a)(?:$VERB${l}nomin:no\|${r})($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})(?:$VERB${l}nomin:no\|${r})/g);
$Rel =  "PunctL";
DepHead($Rel,"",@temp);
$listTags =~ s/($VERB${l}nomin:no\|${r})($Fc$a)($VERB${l}nomin:no\|${r})($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})($VERB${l}nomin:no\|${r})/$3$4$5/g;
(@temp) = ($listTags =~ /($VERB${l}nomin:no\|${r})(?:$Fc$a)(?:$VERB${l}nomin:no\|${r})($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})(?:$VERB${l}nomin:no\|${r})/g);
$Rel =  "CoordL";
DepHead($Rel,"",@temp);
(@temp) = ($listTags =~ /(?:$VERB${l}nomin:no\|${r})($Fc$a)(?:$VERB${l}nomin:no\|${r})($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})(?:$VERB${l}nomin:no\|${r})/g);
$Rel =  "PunctL";
DepHead($Rel,"",@temp);
$listTags =~ s/($VERB${l}nomin:no\|${r})($Fc$a)($VERB${l}nomin:no\|${r})($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})($VERB${l}nomin:no\|${r})/$3$4$5/g;
(@temp) = ($listTags =~ /($VERB${l}nomin:no\|${r})(?:$Fc$a)(?:$VERB${l}nomin:no\|${r})($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})(?:$VERB${l}nomin:no\|${r})/g);
$Rel =  "CoordL";
DepHead($Rel,"",@temp);
(@temp) = ($listTags =~ /(?:$VERB${l}nomin:no\|${r})($Fc$a)(?:$VERB${l}nomin:no\|${r})($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})(?:$VERB${l}nomin:no\|${r})/g);
$Rel =  "PunctL";
DepHead($Rel,"",@temp);
$listTags =~ s/($VERB${l}nomin:no\|${r})($Fc$a)($VERB${l}nomin:no\|${r})($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})($VERB${l}nomin:no\|${r})/$3$4$5/g;
(@temp) = ($listTags =~ /($VERB${l}nomin:no\|${r})(?:$Fc$a)(?:$VERB${l}nomin:no\|${r})($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})(?:$VERB${l}nomin:no\|${r})/g);
$Rel =  "CoordL";
DepHead($Rel,"",@temp);
(@temp) = ($listTags =~ /(?:$VERB${l}nomin:no\|${r})($Fc$a)(?:$VERB${l}nomin:no\|${r})($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})(?:$VERB${l}nomin:no\|${r})/g);
$Rel =  "PunctL";
DepHead($Rel,"",@temp);
$listTags =~ s/($VERB${l}nomin:no\|${r})($Fc$a)($VERB${l}nomin:no\|${r})($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})($VERB${l}nomin:no\|${r})/$3$4$5/g;

# CoordL: [Fc]? VERB<nomin:no> CONJ<(type:C)|(lemma:$CCord)> [VERB<nomin:no>]
# NEXT
# CoordR: [Fc]? [VERB<nomin:no>] CONJ<(type:C)|(lemma:$CCord)> VERB<nomin:no>
# Add: coord:verb
# Inherit: mode, tense
(@temp) = ($listTags =~ /(?:$Fc$a)?($VERB${l}nomin:no\|${r})($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})(?:$VERB${l}nomin:no\|${r})/g);
$Rel =  "CoordL";
DepHead($Rel,"",@temp);
(@temp) = ($listTags =~ /(?:$Fc$a)?(?:$VERB${l}nomin:no\|${r})($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})($VERB${l}nomin:no\|${r})/g);
$Rel =  "CoordR";
HeadDep($Rel,"",@temp);
$listTags =~ s/($Fc$a)?($VERB${l}nomin:no\|${r})($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})($VERB${l}nomin:no\|${r})/$1$3/g;
Inherit("HeadDep","mode,tense",@temp);
Add("HeadDep","coord:verb",@temp);

# PunctL: Fc CONJ<coord:verb>
(@temp) = ($listTags =~ /($Fc$a)($CONJ${l}coord:verb\|${r})/g);
$Rel =  "PunctL";
DepHead($Rel,"",@temp);
$listTags =~ s/($Fc$a)($CONJ${l}coord:verb\|${r})/$2/g;

# CircR: [VERB|CONJ<coord:verb>] [PRP] VERB|CONJ<coord:verb> [PRP] [CARD|NOUNCOORD|PRO<type:D|P|I|X>] PRP CARD|NOUNCOORD|PRO<type:D|P|I|X>
# Recursivity: 1
(@temp) = ($listTags =~ /(?:$VERB$a|$CONJ${l}coord:verb\|${r})(?:$PRP$a)($VERB$a|$CONJ${l}coord:verb\|${r})(?:$PRP$a)(?:$CARD$a|$NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r})($PRP$a)($CARD$a|$NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r})/g);
$Rel =  "CircR";
HeadRelDep($Rel,"",@temp);
$listTags =~ s/($VERB$a|$CONJ${l}coord:verb\|${r})($PRP$a)($VERB$a|$CONJ${l}coord:verb\|${r})($PRP$a)($CARD$a|$NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r})($PRP$a)($CARD$a|$NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r})/$1$2$3$4$5/g;
(@temp) = ($listTags =~ /(?:$VERB$a|$CONJ${l}coord:verb\|${r})(?:$PRP$a)($VERB$a|$CONJ${l}coord:verb\|${r})(?:$PRP$a)(?:$CARD$a|$NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r})($PRP$a)($CARD$a|$NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r})/g);
$Rel =  "CircR";
HeadRelDep($Rel,"",@temp);
$listTags =~ s/($VERB$a|$CONJ${l}coord:verb\|${r})($PRP$a)($VERB$a|$CONJ${l}coord:verb\|${r})($PRP$a)($CARD$a|$NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r})($PRP$a)($CARD$a|$NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r})/$1$2$3$4$5/g;

# CircR: [VERB|CONJ<coord:verb>] [PRP] VERB|CONJ<coord:verb> PRP CARD|NOUNCOORD|PRO<type:D|P|I|X>
# NEXT
# CircR: VERB|CONJ<coord:verb> PRP VERB|CONJ<coord:verb> [PRP] [CARD|NOUNCOORD|PRO<type:D|P|I|X>]
(@temp) = ($listTags =~ /(?:$VERB$a|$CONJ${l}coord:verb\|${r})(?:$PRP$a)($VERB$a|$CONJ${l}coord:verb\|${r})($PRP$a)($CARD$a|$NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r})/g);
$Rel =  "CircR";
HeadRelDep($Rel,"",@temp);
(@temp) = ($listTags =~ /($VERB$a|$CONJ${l}coord:verb\|${r})($PRP$a)($VERB$a|$CONJ${l}coord:verb\|${r})(?:$PRP$a)(?:$CARD$a|$NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r})/g);
$Rel =  "CircR";
HeadRelDep($Rel,"",@temp);
$listTags =~ s/($VERB$a|$CONJ${l}coord:verb\|${r})($PRP$a)($VERB$a|$CONJ${l}coord:verb\|${r})($PRP$a)($CARD$a|$NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r})/$1/g;

# CircR: VERB|CONJ<coord:verb>  PRP VERB<mode:[^PG]>|ADV|CARD
# Recursivity: 1
(@temp) = ($listTags =~ /($VERB$a|$CONJ${l}coord:verb\|${r})($PRP$a)($VERB${l}mode:[^PG]\|${r}|$ADV$a|$CARD$a)/g);
$Rel =  "CircR";
HeadRelDep($Rel,"",@temp);
$listTags =~ s/($VERB$a|$CONJ${l}coord:verb\|${r})($PRP$a)($VERB${l}mode:[^PG]\|${r}|$ADV$a|$CARD$a)/$1/g;
(@temp) = ($listTags =~ /($VERB$a|$CONJ${l}coord:verb\|${r})($PRP$a)($VERB${l}mode:[^PG]\|${r}|$ADV$a|$CARD$a)/g);
$Rel =  "CircR";
HeadRelDep($Rel,"",@temp);
$listTags =~ s/($VERB$a|$CONJ${l}coord:verb\|${r})($PRP$a)($VERB${l}mode:[^PG]\|${r}|$ADV$a|$CARD$a)/$1/g;

# SpecL: [VERB|CONJ<coord:verb>]  [PRP] DET<type:A>  VERB<mode:N>|ADV|CARD
# NEXT
# CircR: VERB|CONJ<coord:verb>  PRP  [DET<type:A>] VERB<mode:N>|ADV|CARD
# Recursivity: 1
(@temp) = ($listTags =~ /(?:$VERB$a|$CONJ${l}coord:verb\|${r})(?:$PRP$a)($DET${l}type:A\|${r})($VERB${l}mode:N\|${r}|$ADV$a|$CARD$a)/g);
$Rel =  "SpecL";
DepHead($Rel,"",@temp);
(@temp) = ($listTags =~ /($VERB$a|$CONJ${l}coord:verb\|${r})($PRP$a)(?:$DET${l}type:A\|${r})($VERB${l}mode:N\|${r}|$ADV$a|$CARD$a)/g);
$Rel =  "CircR";
HeadRelDep($Rel,"",@temp);
$listTags =~ s/($VERB$a|$CONJ${l}coord:verb\|${r})($PRP$a)($DET${l}type:A\|${r})($VERB${l}mode:N\|${r}|$ADV$a|$CARD$a)/$1/g;
(@temp) = ($listTags =~ /(?:$VERB$a|$CONJ${l}coord:verb\|${r})(?:$PRP$a)($DET${l}type:A\|${r})($VERB${l}mode:N\|${r}|$ADV$a|$CARD$a)/g);
$Rel =  "SpecL";
DepHead($Rel,"",@temp);
(@temp) = ($listTags =~ /($VERB$a|$CONJ${l}coord:verb\|${r})($PRP$a)(?:$DET${l}type:A\|${r})($VERB${l}mode:N\|${r}|$ADV$a|$CARD$a)/g);
$Rel =  "CircR";
HeadRelDep($Rel,"",@temp);
$listTags =~ s/($VERB$a|$CONJ${l}coord:verb\|${r})($PRP$a)($DET${l}type:A\|${r})($VERB${l}mode:N\|${r}|$ADV$a|$CARD$a)/$1/g;

# CircR: VERB|CONJ<coord:verb> PRP NOUNCOORD|PRO<type:D|P|I|X>
# Recursivity: 1
(@temp) = ($listTags =~ /($VERB$a|$CONJ${l}coord:verb\|${r})($PRP$a)($NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r})/g);
$Rel =  "CircR";
HeadRelDep($Rel,"",@temp);
$listTags =~ s/($VERB$a|$CONJ${l}coord:verb\|${r})($PRP$a)($NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r})/$1/g;
(@temp) = ($listTags =~ /($VERB$a|$CONJ${l}coord:verb\|${r})($PRP$a)($NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r})/g);
$Rel =  "CircR";
HeadRelDep($Rel,"",@temp);
$listTags =~ s/($VERB$a|$CONJ${l}coord:verb\|${r})($PRP$a)($NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r})/$1/g;

# PunctR: VERB Fc [PRP] [NOUNCOORD|PRO<type:D|P|I|X>] [Fc]?
# NEXT
# PunctR: VERB [Fc] [PRP] [NOUNCOORD|PRO<type:D|P|I|X>] Fc
# NEXT
# TermR: [VERB] [Fc] PRP NOUNCOORD|PRO<type:D|P|I|X> [Fc]?
# NEXT
# CircR: VERB [Fc] PRP [NOUNCOORD|PRO<type:D|P|I|X>] [Fc]?
# Recursivity:2
(@temp) = ($listTags =~ /($VERB$a)($Fc$a)(?:$PRP$a)(?:$NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r})(?:$Fc$a)?/g);
$Rel =  "PunctR";
HeadDep($Rel,"",@temp);
(@temp) = ($listTags =~ /($VERB$a)(?:$Fc$a)(?:$PRP$a)(?:$NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r})($Fc$a)/g);
$Rel =  "PunctR";
HeadDep($Rel,"",@temp);
(@temp) = ($listTags =~ /(?:$VERB$a)(?:$Fc$a)($PRP$a)($NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r})(?:$Fc$a)?/g);
$Rel =  "TermR";
HeadDep($Rel,"",@temp);
(@temp) = ($listTags =~ /($VERB$a)(?:$Fc$a)($PRP$a)(?:$NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r})(?:$Fc$a)?/g);
$Rel =  "CircR";
HeadRelDep($Rel,"",@temp);
$listTags =~ s/($VERB$a)($Fc$a)($PRP$a)($NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r})($Fc$a)?/$1/g;
(@temp) = ($listTags =~ /($VERB$a)($Fc$a)(?:$PRP$a)(?:$NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r})(?:$Fc$a)?/g);
$Rel =  "PunctR";
HeadDep($Rel,"",@temp);
(@temp) = ($listTags =~ /($VERB$a)(?:$Fc$a)(?:$PRP$a)(?:$NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r})($Fc$a)/g);
$Rel =  "PunctR";
HeadDep($Rel,"",@temp);
(@temp) = ($listTags =~ /(?:$VERB$a)(?:$Fc$a)($PRP$a)($NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r})(?:$Fc$a)?/g);
$Rel =  "TermR";
HeadDep($Rel,"",@temp);
(@temp) = ($listTags =~ /($VERB$a)(?:$Fc$a)($PRP$a)(?:$NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r})(?:$Fc$a)?/g);
$Rel =  "CircR";
HeadRelDep($Rel,"",@temp);
$listTags =~ s/($VERB$a)($Fc$a)($PRP$a)($NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r})($Fc$a)?/$1/g;
(@temp) = ($listTags =~ /($VERB$a)($Fc$a)(?:$PRP$a)(?:$NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r})(?:$Fc$a)?/g);
$Rel =  "PunctR";
HeadDep($Rel,"",@temp);
(@temp) = ($listTags =~ /($VERB$a)(?:$Fc$a)(?:$PRP$a)(?:$NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r})($Fc$a)/g);
$Rel =  "PunctR";
HeadDep($Rel,"",@temp);
(@temp) = ($listTags =~ /(?:$VERB$a)(?:$Fc$a)($PRP$a)($NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r})(?:$Fc$a)?/g);
$Rel =  "TermR";
HeadDep($Rel,"",@temp);
(@temp) = ($listTags =~ /($VERB$a)(?:$Fc$a)($PRP$a)(?:$NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r})(?:$Fc$a)?/g);
$Rel =  "CircR";
HeadRelDep($Rel,"",@temp);
$listTags =~ s/($VERB$a)($Fc$a)($PRP$a)($NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r})($Fc$a)?/$1/g;

# PunctL: [PRP<pos:0>] [NOUNCOORD|PRO<type:D|P|I|X>] Fc  VERB|CONJ<coord:verb>
# NEXT
# CircL: PRP<pos:0> NOUNCOORD|PRO<type:D|P|I|X> [Fc]?  VERB|CONJ<coord:verb>
(@temp) = ($listTags =~ /(?:$PRP${l}pos:0\|${r})(?:$NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r})($Fc$a)($VERB$a|$CONJ${l}coord:verb\|${r})/g);
$Rel =  "PunctL";
DepHead($Rel,"",@temp);
(@temp) = ($listTags =~ /($PRP${l}pos:0\|${r})($NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r})(?:$Fc$a)?($VERB$a|$CONJ${l}coord:verb\|${r})/g);
$Rel =  "CircL";
RelDepHead($Rel,"",@temp);
$listTags =~ s/($PRP${l}pos:0\|${r})($NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r})($Fc$a)?($VERB$a|$CONJ${l}coord:verb\|${r})/$4/g;

# PunctL: Fc [PRP] [NOUNCOORD|PRO<type:D|P|I|X> ] [Fc]?  VERB|CONJ<coord:verb>
# NEXT
# PunctL: [Fc]? [PRP] [NOUNCOORD|PRO<type:D|P|I|X> ] Fc  VERB|CONJ<coord:verb>
# NEXT
# CircL: [Fc]? PRP NOUNCOORD|PRO<type:D|P|I|X>  [Fc]?  VERB|CONJ<coord:verb>
# Recursivity:1
(@temp) = ($listTags =~ /($Fc$a)(?:$PRP$a)([NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r})(])(?:$Fc$a)?($VERB$a|$CONJ${l}coord:verb\|${r})/g);
$Rel =  "PunctL";
DepHead($Rel,"",@temp);
(@temp) = ($listTags =~ /(?:$Fc$a)?(?:$PRP$a)([NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r})(])($Fc$a)($VERB$a|$CONJ${l}coord:verb\|${r})/g);
$Rel =  "PunctL";
DepHead($Rel,"",@temp);
(@temp) = ($listTags =~ /(?:$Fc$a)?($PRP$a)($NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r})(?:$Fc$a)?($VERB$a|$CONJ${l}coord:verb\|${r})/g);
$Rel =  "CircL";
RelDepHead($Rel,"",@temp);
$listTags =~ s/($Fc$a)?($PRP$a)($NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r})($Fc$a)?($VERB$a|$CONJ${l}coord:verb\|${r})/$5/g;
(@temp) = ($listTags =~ /($Fc$a)(?:$PRP$a)([NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r})(])(?:$Fc$a)?($VERB$a|$CONJ${l}coord:verb\|${r})/g);
$Rel =  "PunctL";
DepHead($Rel,"",@temp);
(@temp) = ($listTags =~ /(?:$Fc$a)?(?:$PRP$a)([NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r})(])($Fc$a)($VERB$a|$CONJ${l}coord:verb\|${r})/g);
$Rel =  "PunctL";
DepHead($Rel,"",@temp);
(@temp) = ($listTags =~ /(?:$Fc$a)?($PRP$a)($NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r})(?:$Fc$a)?($VERB$a|$CONJ${l}coord:verb\|${r})/g);
$Rel =  "CircL";
RelDepHead($Rel,"",@temp);
$listTags =~ s/($Fc$a)?($PRP$a)($NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r})($Fc$a)?($VERB$a|$CONJ${l}coord:verb\|${r})/$5/g;

# AtrR: VERB<lemma:$SubcatAtr>  VERB<mode:[PNG]>
(@temp) = ($listTags =~ /($VERB${l}lemma:$SubcatAtr\|${r})($VERB${l}mode:[PNG]\|${r})/g);
$Rel =  "AtrR";
HeadDep($Rel,"",@temp);
$listTags =~ s/($VERB${l}lemma:$SubcatAtr\|${r})($VERB${l}mode:[PNG]\|${r})/$1/g;

# Circ2R: VERB VERB<mode:[GP]>
(@temp) = ($listTags =~ /($VERB$a)($VERB${l}mode:[GP]\|${r})/g);
$Rel =  "Circ2R";
HeadDep($Rel,"",@temp);
$listTags =~ s/($VERB$a)($VERB${l}mode:[GP]\|${r})/$1/g;

# DobjR: VERB VERB<mode:N>
(@temp) = ($listTags =~ /($VERB$a)($VERB${l}mode:N\|${r})/g);
$Rel =  "DobjR";
HeadDep($Rel,"",@temp);
$listTags =~ s/($VERB$a)($VERB${l}mode:N\|${r})/$1/g;

# AdjnR:  VERB<mode:[^PNG]> DATE
(@temp) = ($listTags =~ /($VERB${l}mode:[^PNG]\|${r})($DATE$a)/g);
$Rel =  "AdjnR";
HeadDep($Rel,"",@temp);
$listTags =~ s/($VERB${l}mode:[^PNG]\|${r})($DATE$a)/$1/g;

# PunctL: Fc [DATE] VERB<mode:[^PNG]>
# NEXT
# AdjnL:  [Fc]? DATE VERB<mode:[^PNG]>
(@temp) = ($listTags =~ /($Fc$a)(?:$DATE$a)($VERB${l}mode:[^PNG]\|${r})/g);
$Rel =  "PunctL";
DepHead($Rel,"",@temp);
(@temp) = ($listTags =~ /(?:$Fc$a)?($DATE$a)($VERB${l}mode:[^PNG]\|${r})/g);
$Rel =  "AdjnL";
DepHead($Rel,"",@temp);
$listTags =~ s/($Fc$a)?($DATE$a)($VERB${l}mode:[^PNG]\|${r})/$3/g;

# CprepR: NOUNCOORD PRP NOUNCOORD
(@temp) = ($listTags =~ /($NOUNCOORD)($PRP$a)($NOUNCOORD)/g);
$Rel =  "CprepR";
HeadRelDep($Rel,"",@temp);
$listTags =~ s/($NOUNCOORD)($PRP$a)($NOUNCOORD)/$1/g;

# Single: [VERB<lemma:$SubcatClaus>]  PRO<type:R>  [NOUNCOORD|PRO<type:D|P|I|X>]?  [VERB<mode:[^PNG]>]
# Corr: tag:CONJ, type:S
(@temp) = ($listTags =~ /(?:$VERB${l}lemma:$SubcatClaus\|${r})($PRO${l}type:R\|${r})(?:$NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r})?(?:$VERB${l}mode:[^PNG]\|${r})/g);
$Rel =  "Single";
Head($Rel,"",@temp);
$listTags =~ s/($VERB${l}lemma:$SubcatClaus\|${r})($PRO${l}type:R\|${r})($NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r})?($VERB${l}mode:[^PNG]\|${r})/$1$2$3$4/g;
Corr("Head","tag:CONJ,type:S",@temp);

# SpecL: [VERB] CONJ<type:S>  VERB<mode:[^PNG]>
# NEXT
# DobjR: VERB  [CONJ<type:S>] VERB<mode:[^PNG]>
(@temp) = ($listTags =~ /(?:$VERB$a)($CONJ${l}type:S\|${r})($VERB${l}mode:[^PNG]\|${r})/g);
$Rel =  "SpecL";
DepHead($Rel,"",@temp);
(@temp) = ($listTags =~ /($VERB$a)(?:$CONJ${l}type:S\|${r})($VERB${l}mode:[^PNG]\|${r})/g);
$Rel =  "DobjR";
HeadDep($Rel,"",@temp);
$listTags =~ s/($VERB$a)($CONJ${l}type:S\|${r})($VERB${l}mode:[^PNG]\|${r})/$1/g;

# SpecL: [VERB]  CONJ<type:S>  [NOUNCOORD|PRO<type:D|P|I|X>] VERB<mode:[^PNG]>
# NEXT
# SubjL:  [VERB]  [CONJ<type:S>]  NOUNCOORD|PRO<type:D|P|I|X> VERB<mode:[^PNG]
# Add: adsubj:yes
# NEXT
# DobjR: VERB   [CONJ<type:S>] [NOUNCOORD|PRO<type:D|P|I|X>] VERB<mode:[^PNG]>
(@temp) = ($listTags =~ /(?:$VERB$a)($CONJ${l}type:S\|${r})(?:$NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r})($VERB${l}mode:[^PNG]\|${r})/g);
$Rel =  "SpecL";
DepHead($Rel,"",@temp);
(@temp) = ($listTags =~ /(?:$VERB$a)(?:$CONJ${l}type:S\|${r})($NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r})($VERB$a${l}mode:[^PNG])/g);
$Rel =  "SubjL";
DepHead($Rel,"",@temp);
Add("DepHead","adsubj:yes",@temp);
(@temp) = ($listTags =~ /($VERB$a)(?:$CONJ${l}type:S\|${r})(?:$NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r})($VERB${l}mode:[^PNG]\|${r})/g);
$Rel =  "DobjR";
HeadDep($Rel,"",@temp);
$listTags =~ s/($VERB$a)($CONJ${l}type:S\|${r})($NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r})($VERB${l}mode:[^PNG]\|${r})/$1/g;

# SpecL: [VERB] [PRP] CONJ<lemma:que> VERB<mode:[^PNG]>
# NEXT
# CircR: VERB PRP [CONJ<lemma:que>] VERB<mode:[^PNG]>
(@temp) = ($listTags =~ /(?:$VERB$a)(?:$PRP$a)($CONJ${l}lemma:que\|${r})($VERB${l}mode:[^PNG]\|${r})/g);
$Rel =  "SpecL";
DepHead($Rel,"",@temp);
(@temp) = ($listTags =~ /($VERB$a)($PRP$a)(?:$CONJ${l}lemma:que\|${r})($VERB${l}mode:[^PNG]\|${r})/g);
$Rel =  "CircR";
HeadRelDep($Rel,"",@temp);
$listTags =~ s/($VERB$a)($PRP$a)($CONJ${l}lemma:que\|${r})($VERB${l}mode:[^PNG]\|${r})/$1/g;

# PunctL: [NOUNCOORD|PRO<type:D|P|I|X>] Fc|Fpa|Fca VERB [Fc|Fpt|Fct]
# NEXT
# PunctR: [NOUNCOORD|PRO<type:D|P|I|X>] [Fc|Fpa|Fca] VERB Fc|Fpt|Fct
# NEXT
# AdjnR: NOUNCOORD|PRO<type:D|P|I|X> [Fc|Fpa|Fca] VERB [Fc|Fpt|Fct]
(@temp) = ($listTags =~ /(?:$NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r})($Fc$a|$Fpa$a|$Fca$a)($VERB$a)(?:$Fc$a|$Fpt$a|$Fct$a)/g);
$Rel =  "PunctL";
DepHead($Rel,"",@temp);
(@temp) = ($listTags =~ /(?:$NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r})(?:$Fc$a|$Fpa$a|$Fca$a)($VERB$a)($Fc$a|$Fpt$a|$Fct$a)/g);
$Rel =  "PunctR";
HeadDep($Rel,"",@temp);
(@temp) = ($listTags =~ /($NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r})(?:$Fc$a|$Fpa$a|$Fca$a)($VERB$a)(?:$Fc$a|$Fpt$a|$Fct$a)/g);
$Rel =  "AdjnR";
HeadDep($Rel,"",@temp);
$listTags =~ s/($NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r})($Fc$a|$Fpa$a|$Fca$a)($VERB$a)($Fc$a|$Fpt$a|$Fct$a)/$1/g;

# PunctL: [NOUNCOORD|PRO<type:D|P|I|X>] Fc|Fpa|Fca [PRP] NOUNCOORD|PRO<type:D|P|I|X>|CARD [Fc|Fpt|Fct]
# NEXT
# PunctR: [NOUNCOORD|PRO<type:D|P|I|X>] [Fc|Fpa|Fca] [PRP] NOUNCOORD|PRO<type:D|P|I|X>|CARD Fc|Fpt|Fct
# NEXT
# CprepR: NOUNCOORD|PRO<type:D|P|I|X> [Fc|Fpa|Fca] PRP NOUNCOORD|PRO<type:D|P|I|X>|CARD [Fc|Fpt|Fct]
(@temp) = ($listTags =~ /(?:$NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r})($Fc$a|$Fpa$a|$Fca$a)(?:$PRP$a)($NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r}|$CARD$a)(?:$Fc$a|$Fpt$a|$Fct$a)/g);
$Rel =  "PunctL";
DepHead($Rel,"",@temp);
(@temp) = ($listTags =~ /(?:$NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r})(?:$Fc$a|$Fpa$a|$Fca$a)(?:$PRP$a)($NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r}|$CARD$a)($Fc$a|$Fpt$a|$Fct$a)/g);
$Rel =  "PunctR";
HeadDep($Rel,"",@temp);
(@temp) = ($listTags =~ /($NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r})(?:$Fc$a|$Fpa$a|$Fca$a)($PRP$a)($NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r}|$CARD$a)(?:$Fc$a|$Fpt$a|$Fct$a)/g);
$Rel =  "CprepR";
HeadRelDep($Rel,"",@temp);
$listTags =~ s/($NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r})($Fc$a|$Fpa$a|$Fca$a)($PRP$a)($NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r}|$CARD$a)($Fc$a|$Fpt$a|$Fct$a)/$1/g;

# AdjnL: [Fc] VERB<mode:P> [Fc] VERB
# NEXT
# PunctL: Fc [VERB<mode:P>] [Fc] VERB
# NEXT
# PunctL: [Fc] [VERB<mode:P>] Fc VERB
(@temp) = ($listTags =~ /(?:$Fc$a)($VERB${l}mode:P\|${r})(?:$Fc$a)($VERB$a)/g);
$Rel =  "AdjnL";
DepHead($Rel,"",@temp);
(@temp) = ($listTags =~ /($Fc$a)(?:$VERB${l}mode:P\|${r})(?:$Fc$a)($VERB$a)/g);
$Rel =  "PunctL";
DepHead($Rel,"",@temp);
(@temp) = ($listTags =~ /(?:$Fc$a)(?:$VERB${l}mode:P\|${r})($Fc$a)($VERB$a)/g);
$Rel =  "PunctL";
DepHead($Rel,"",@temp);
$listTags =~ s/($Fc$a)($VERB${l}mode:P\|${r})($Fc$a)($VERB$a)/$4/g;

# CoordL: NP [Fc] [NP] CONJ<(type:C)|(lemma:$CCord)> [NP]
# NEXT
# PunctL: [NP] Fc [NP] CONJ<(type:C)|(lemma:$CCord)> [NP]
# Recursivity: 10
(@temp) = ($listTags =~ /($NP)(?:$Fc$a)(?:$NP)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})(?:$NP)/g);
$Rel =  "CoordL";
DepHead($Rel,"",@temp);
(@temp) = ($listTags =~ /(?:$NP)($Fc$a)(?:$NP)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})(?:$NP)/g);
$Rel =  "PunctL";
DepHead($Rel,"",@temp);
$listTags =~ s/($NP)($Fc$a)($NP)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})($NP)/$3$4$5/g;
(@temp) = ($listTags =~ /($NP)(?:$Fc$a)(?:$NP)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})(?:$NP)/g);
$Rel =  "CoordL";
DepHead($Rel,"",@temp);
(@temp) = ($listTags =~ /(?:$NP)($Fc$a)(?:$NP)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})(?:$NP)/g);
$Rel =  "PunctL";
DepHead($Rel,"",@temp);
$listTags =~ s/($NP)($Fc$a)($NP)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})($NP)/$3$4$5/g;
(@temp) = ($listTags =~ /($NP)(?:$Fc$a)(?:$NP)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})(?:$NP)/g);
$Rel =  "CoordL";
DepHead($Rel,"",@temp);
(@temp) = ($listTags =~ /(?:$NP)($Fc$a)(?:$NP)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})(?:$NP)/g);
$Rel =  "PunctL";
DepHead($Rel,"",@temp);
$listTags =~ s/($NP)($Fc$a)($NP)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})($NP)/$3$4$5/g;
(@temp) = ($listTags =~ /($NP)(?:$Fc$a)(?:$NP)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})(?:$NP)/g);
$Rel =  "CoordL";
DepHead($Rel,"",@temp);
(@temp) = ($listTags =~ /(?:$NP)($Fc$a)(?:$NP)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})(?:$NP)/g);
$Rel =  "PunctL";
DepHead($Rel,"",@temp);
$listTags =~ s/($NP)($Fc$a)($NP)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})($NP)/$3$4$5/g;
(@temp) = ($listTags =~ /($NP)(?:$Fc$a)(?:$NP)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})(?:$NP)/g);
$Rel =  "CoordL";
DepHead($Rel,"",@temp);
(@temp) = ($listTags =~ /(?:$NP)($Fc$a)(?:$NP)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})(?:$NP)/g);
$Rel =  "PunctL";
DepHead($Rel,"",@temp);
$listTags =~ s/($NP)($Fc$a)($NP)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})($NP)/$3$4$5/g;
(@temp) = ($listTags =~ /($NP)(?:$Fc$a)(?:$NP)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})(?:$NP)/g);
$Rel =  "CoordL";
DepHead($Rel,"",@temp);
(@temp) = ($listTags =~ /(?:$NP)($Fc$a)(?:$NP)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})(?:$NP)/g);
$Rel =  "PunctL";
DepHead($Rel,"",@temp);
$listTags =~ s/($NP)($Fc$a)($NP)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})($NP)/$3$4$5/g;
(@temp) = ($listTags =~ /($NP)(?:$Fc$a)(?:$NP)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})(?:$NP)/g);
$Rel =  "CoordL";
DepHead($Rel,"",@temp);
(@temp) = ($listTags =~ /(?:$NP)($Fc$a)(?:$NP)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})(?:$NP)/g);
$Rel =  "PunctL";
DepHead($Rel,"",@temp);
$listTags =~ s/($NP)($Fc$a)($NP)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})($NP)/$3$4$5/g;
(@temp) = ($listTags =~ /($NP)(?:$Fc$a)(?:$NP)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})(?:$NP)/g);
$Rel =  "CoordL";
DepHead($Rel,"",@temp);
(@temp) = ($listTags =~ /(?:$NP)($Fc$a)(?:$NP)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})(?:$NP)/g);
$Rel =  "PunctL";
DepHead($Rel,"",@temp);
$listTags =~ s/($NP)($Fc$a)($NP)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})($NP)/$3$4$5/g;
(@temp) = ($listTags =~ /($NP)(?:$Fc$a)(?:$NP)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})(?:$NP)/g);
$Rel =  "CoordL";
DepHead($Rel,"",@temp);
(@temp) = ($listTags =~ /(?:$NP)($Fc$a)(?:$NP)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})(?:$NP)/g);
$Rel =  "PunctL";
DepHead($Rel,"",@temp);
$listTags =~ s/($NP)($Fc$a)($NP)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})($NP)/$3$4$5/g;
(@temp) = ($listTags =~ /($NP)(?:$Fc$a)(?:$NP)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})(?:$NP)/g);
$Rel =  "CoordL";
DepHead($Rel,"",@temp);
(@temp) = ($listTags =~ /(?:$NP)($Fc$a)(?:$NP)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})(?:$NP)/g);
$Rel =  "PunctL";
DepHead($Rel,"",@temp);
$listTags =~ s/($NP)($Fc$a)($NP)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})($NP)/$3$4$5/g;
(@temp) = ($listTags =~ /($NP)(?:$Fc$a)(?:$NP)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})(?:$NP)/g);
$Rel =  "CoordL";
DepHead($Rel,"",@temp);
(@temp) = ($listTags =~ /(?:$NP)($Fc$a)(?:$NP)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})(?:$NP)/g);
$Rel =  "PunctL";
DepHead($Rel,"",@temp);
$listTags =~ s/($NP)($Fc$a)($NP)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})($NP)/$3$4$5/g;

# CoordL: [Fc]? NP CONJ<(type:C)|(lemma:$CCord)> [NP]
# NEXT
# CoordR: [Fc]? [NP] CONJ<(type:C)|(lemma:$CCord)> NP
# Add: coord:noun
(@temp) = ($listTags =~ /(?:$Fc$a)?($NP)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})(?:$NP)/g);
$Rel =  "CoordL";
DepHead($Rel,"",@temp);
(@temp) = ($listTags =~ /(?:$Fc$a)?(?:$NP)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})($NP)/g);
$Rel =  "CoordR";
HeadDep($Rel,"",@temp);
$listTags =~ s/($Fc$a)?($NP)($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})($NP)/$1$3/g;
Add("HeadDep","coord:noun",@temp);

# PunctL: Fc CONJ<coord:noun>
(@temp) = ($listTags =~ /($Fc$a)($CONJ${l}coord:noun\|${r})/g);
$Rel =  "PunctL";
DepHead($Rel,"",@temp);
$listTags =~ s/($Fc$a)($CONJ${l}coord:noun\|${r})/$2/g;

# CoordL: VERB<nomin:no> [Fc] [VERB<nomin:no>] CONJ<(type:C)|(lemma:$CCord)> [VERB<nomin:no>]
# NEXT
# PunctL: [VERB<nomin:no>] Fc [VERB<nomin:no>] CONJ<(type:C)|(lemma:$CCord)> [VERB<nomin:no>]
# Recursivity: 5
(@temp) = ($listTags =~ /($VERB${l}nomin:no\|${r})(?:$Fc$a)(?:$VERB${l}nomin:no\|${r})($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})(?:$VERB${l}nomin:no\|${r})/g);
$Rel =  "CoordL";
DepHead($Rel,"",@temp);
(@temp) = ($listTags =~ /(?:$VERB${l}nomin:no\|${r})($Fc$a)(?:$VERB${l}nomin:no\|${r})($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})(?:$VERB${l}nomin:no\|${r})/g);
$Rel =  "PunctL";
DepHead($Rel,"",@temp);
$listTags =~ s/($VERB${l}nomin:no\|${r})($Fc$a)($VERB${l}nomin:no\|${r})($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})($VERB${l}nomin:no\|${r})/$3$4$5/g;
(@temp) = ($listTags =~ /($VERB${l}nomin:no\|${r})(?:$Fc$a)(?:$VERB${l}nomin:no\|${r})($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})(?:$VERB${l}nomin:no\|${r})/g);
$Rel =  "CoordL";
DepHead($Rel,"",@temp);
(@temp) = ($listTags =~ /(?:$VERB${l}nomin:no\|${r})($Fc$a)(?:$VERB${l}nomin:no\|${r})($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})(?:$VERB${l}nomin:no\|${r})/g);
$Rel =  "PunctL";
DepHead($Rel,"",@temp);
$listTags =~ s/($VERB${l}nomin:no\|${r})($Fc$a)($VERB${l}nomin:no\|${r})($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})($VERB${l}nomin:no\|${r})/$3$4$5/g;
(@temp) = ($listTags =~ /($VERB${l}nomin:no\|${r})(?:$Fc$a)(?:$VERB${l}nomin:no\|${r})($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})(?:$VERB${l}nomin:no\|${r})/g);
$Rel =  "CoordL";
DepHead($Rel,"",@temp);
(@temp) = ($listTags =~ /(?:$VERB${l}nomin:no\|${r})($Fc$a)(?:$VERB${l}nomin:no\|${r})($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})(?:$VERB${l}nomin:no\|${r})/g);
$Rel =  "PunctL";
DepHead($Rel,"",@temp);
$listTags =~ s/($VERB${l}nomin:no\|${r})($Fc$a)($VERB${l}nomin:no\|${r})($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})($VERB${l}nomin:no\|${r})/$3$4$5/g;
(@temp) = ($listTags =~ /($VERB${l}nomin:no\|${r})(?:$Fc$a)(?:$VERB${l}nomin:no\|${r})($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})(?:$VERB${l}nomin:no\|${r})/g);
$Rel =  "CoordL";
DepHead($Rel,"",@temp);
(@temp) = ($listTags =~ /(?:$VERB${l}nomin:no\|${r})($Fc$a)(?:$VERB${l}nomin:no\|${r})($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})(?:$VERB${l}nomin:no\|${r})/g);
$Rel =  "PunctL";
DepHead($Rel,"",@temp);
$listTags =~ s/($VERB${l}nomin:no\|${r})($Fc$a)($VERB${l}nomin:no\|${r})($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})($VERB${l}nomin:no\|${r})/$3$4$5/g;
(@temp) = ($listTags =~ /($VERB${l}nomin:no\|${r})(?:$Fc$a)(?:$VERB${l}nomin:no\|${r})($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})(?:$VERB${l}nomin:no\|${r})/g);
$Rel =  "CoordL";
DepHead($Rel,"",@temp);
(@temp) = ($listTags =~ /(?:$VERB${l}nomin:no\|${r})($Fc$a)(?:$VERB${l}nomin:no\|${r})($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})(?:$VERB${l}nomin:no\|${r})/g);
$Rel =  "PunctL";
DepHead($Rel,"",@temp);
$listTags =~ s/($VERB${l}nomin:no\|${r})($Fc$a)($VERB${l}nomin:no\|${r})($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})($VERB${l}nomin:no\|${r})/$3$4$5/g;
(@temp) = ($listTags =~ /($VERB${l}nomin:no\|${r})(?:$Fc$a)(?:$VERB${l}nomin:no\|${r})($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})(?:$VERB${l}nomin:no\|${r})/g);
$Rel =  "CoordL";
DepHead($Rel,"",@temp);
(@temp) = ($listTags =~ /(?:$VERB${l}nomin:no\|${r})($Fc$a)(?:$VERB${l}nomin:no\|${r})($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})(?:$VERB${l}nomin:no\|${r})/g);
$Rel =  "PunctL";
DepHead($Rel,"",@temp);
$listTags =~ s/($VERB${l}nomin:no\|${r})($Fc$a)($VERB${l}nomin:no\|${r})($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})($VERB${l}nomin:no\|${r})/$3$4$5/g;

# CoordL: [Fc]? VERB<nomin:no> CONJ<(type:C)|(lemma:$CCord)> [VERB<nomin:no>]
# NEXT
# CoordR: [Fc]? [VERB<nomin:no>] CONJ<(type:C)|(lemma:$CCord)> VERB<nomin:no>
# Add: coord:verb
# Inherit: mode, tense
(@temp) = ($listTags =~ /(?:$Fc$a)?($VERB${l}nomin:no\|${r})($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})(?:$VERB${l}nomin:no\|${r})/g);
$Rel =  "CoordL";
DepHead($Rel,"",@temp);
(@temp) = ($listTags =~ /(?:$Fc$a)?(?:$VERB${l}nomin:no\|${r})($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})($VERB${l}nomin:no\|${r})/g);
$Rel =  "CoordR";
HeadDep($Rel,"",@temp);
$listTags =~ s/($Fc$a)?($VERB${l}nomin:no\|${r})($CONJ${l}type:C\|${r}|$CONJ${l}lemma:$CCord\|${r})($VERB${l}nomin:no\|${r})/$1$3/g;
Inherit("HeadDep","mode,tense",@temp);
Add("HeadDep","coord:verb",@temp);

# PunctL: Fc CONJ<coord:verb>
(@temp) = ($listTags =~ /($Fc$a)($CONJ${l}coord:verb\|${r})/g);
$Rel =  "PunctL";
DepHead($Rel,"",@temp);
$listTags =~ s/($Fc$a)($CONJ${l}coord:verb\|${r})/$2/g;

# SubjL: NOUN<type:P> VERB<mode:[^PG]>|CONJ<coord:verb&mode:[^PG]>
# Add: adsubj:yes
(@temp) = ($listTags =~ /($NOUN${l}type:P\|${r})($VERB${l}mode:[^PG]\|${r}|$CONJ${l}coord:verb\|${b}mode:[^PG]\|${r})/g);
$Rel =  "SubjL";
DepHead($Rel,"",@temp);
$listTags =~ s/($NOUN${l}type:P\|${r})($VERB${l}mode:[^PG]\|${r}|$CONJ${l}coord:verb\|${b}mode:[^PG]\|${r})/$2/g;
Add("DepHead","adsubj:yes",@temp);

# SubjL: NOMINAL|PRO<type:D|P|I|X> VERB<mode:[^PG]>|CONJ<coord:verb&mode:[^PG]>
# Add: adsubj:yes
(@temp) = ($listTags =~ /($NOMINAL|$PRO${l}type:(?:D|P|I|X)\|${r})($VERB${l}mode:[^PG]\|${r}|$CONJ${l}coord:verb\|${b}mode:[^PG]\|${r})/g);
$Rel =  "SubjL";
DepHead($Rel,"",@temp);
$listTags =~ s/($NOMINAL|$PRO${l}type:(?:D|P|I|X)\|${r})($VERB${l}mode:[^PG]\|${r}|$CONJ${l}coord:verb\|${b}mode:[^PG]\|${r})/$2/g;
Add("DepHead","adsubj:yes",@temp);

# DobjPrepR: VERB<lemma:$SubcatTr> PRP<lemma:a> NOMINAL|PRO<type:D|P|I|X>
(@temp) = ($listTags =~ /($VERB${l}lemma:$SubcatTr\|${r})($PRP${l}lemma:a\|${r})($NOMINAL|$PRO${l}type:(?:D|P|I|X)\|${r})/g);
$Rel =  "DobjPrepR";
HeadRelDep($Rel,"",@temp);
$listTags =~ s/($VERB${l}lemma:$SubcatTr\|${r})($PRP${l}lemma:a\|${r})($NOMINAL|$PRO${l}type:(?:D|P|I|X)\|${r})/$1/g;

# AtrR: VERB<lemma:ser> NOMINAL|PRO<type:D|P|I|X>
(@temp) = ($listTags =~ /($VERB${l}lemma:ser\|${r})($NOMINAL|$PRO${l}type:(?:D|P|I|X)\|${r})/g);
$Rel =  "AtrR";
HeadDep($Rel,"",@temp);
$listTags =~ s/($VERB${l}lemma:ser\|${r})($NOMINAL|$PRO${l}type:(?:D|P|I|X)\|${r})/$1/g;

# DobjR: VERB NOMINAL|PRO<type:D|P|I|X>
(@temp) = ($listTags =~ /($VERB$a)($NOMINAL|$PRO${l}type:(?:D|P|I|X)\|${r})/g);
$Rel =  "DobjR";
HeadDep($Rel,"",@temp);
$listTags =~ s/($VERB$a)($NOMINAL|$PRO${l}type:(?:D|P|I|X)\|${r})/$1/g;

# IobjR: VERB<lemma:($SubcatIND)|(SubcatBitr)>  [NOUNCOORD|PRO<type:D|P|I|X>]? PRP<lemma:a> NOMINAL|PRO<type:D|P|I|X>|VERB<mode:N>
(@temp) = ($listTags =~ /($VERB${l}lemma:$SubcatIND\|${r}|$VERB${l}SubcatBitr\|${r})(?:$NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r})?($PRP${l}lemma:a\|${r})($NOMINAL|$PRO${l}type:(?:D|P|I|X)\|${r}|$VERB${l}mode:N\|${r})/g);
$Rel =  "IobjR";
HeadRelDep($Rel,"",@temp);
$listTags =~ s/($VERB${l}lemma:$SubcatIND\|${r}|$VERB${l}SubcatBitr\|${r})($NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r})?($PRP${l}lemma:a\|${r})($NOMINAL|$PRO${l}type:(?:D|P|I|X)\|${r}|$VERB${l}mode:N\|${r})/$1$2/g;

# CregR: VERB<lemma:$SubcatA>  [NOMINAL|PRO<type:D|P|I|X>]? PRP<lemma:a> NOMINAL|PRO<type:D|P|I|X>|VERB<mode:N>
(@temp) = ($listTags =~ /($VERB${l}lemma:$SubcatA\|${r})(?:$NOMINAL|$PRO${l}type:(?:D|P|I|X)\|${r})?($PRP${l}lemma:a\|${r})($NOMINAL|$PRO${l}type:(?:D|P|I|X)\|${r}|$VERB${l}mode:N\|${r})/g);
$Rel =  "CregR";
HeadRelDep($Rel,"",@temp);
$listTags =~ s/($VERB${l}lemma:$SubcatA\|${r})($NOMINAL|$PRO${l}type:(?:D|P|I|X)\|${r})?($PRP${l}lemma:a\|${r})($NOMINAL|$PRO${l}type:(?:D|P|I|X)\|${r}|$VERB${l}mode:N\|${r})/$1$2/g;

# CregR: VERB<lemma:$SubcatEM>  [NOMINAL|PRO<type:D|P|I|X>]? PRP<lemma:en> NOMINAL|PRO<type:D|P|I|X>|VERB<mode:N>
(@temp) = ($listTags =~ /($VERB${l}lemma:$SubcatEM\|${r})(?:$NOMINAL|$PRO${l}type:(?:D|P|I|X)\|${r})?($PRP${l}lemma:en\|${r})($NOMINAL|$PRO${l}type:(?:D|P|I|X)\|${r}|$VERB${l}mode:N\|${r})/g);
$Rel =  "CregR";
HeadRelDep($Rel,"",@temp);
$listTags =~ s/($VERB${l}lemma:$SubcatEM\|${r})($NOMINAL|$PRO${l}type:(?:D|P|I|X)\|${r})?($PRP${l}lemma:en\|${r})($NOMINAL|$PRO${l}type:(?:D|P|I|X)\|${r}|$VERB${l}mode:N\|${r})/$1$2/g;

# CregR: VERB<lemma:$SubcatDE>  [NOMINAL|PRO<type:D|P|I|X>]? PRP<lemma:de> NOMINAL|PRO<type:D|P|I|X>|VERB<mode:N>
(@temp) = ($listTags =~ /($VERB${l}lemma:$SubcatDE\|${r})(?:$NOMINAL|$PRO${l}type:(?:D|P|I|X)\|${r})?($PRP${l}lemma:de\|${r})($NOMINAL|$PRO${l}type:(?:D|P|I|X)\|${r}|$VERB${l}mode:N\|${r})/g);
$Rel =  "CregR";
HeadRelDep($Rel,"",@temp);
$listTags =~ s/($VERB${l}lemma:$SubcatDE\|${r})($NOMINAL|$PRO${l}type:(?:D|P|I|X)\|${r})?($PRP${l}lemma:de\|${r})($NOMINAL|$PRO${l}type:(?:D|P|I|X)\|${r}|$VERB${l}mode:N\|${r})/$1$2/g;

# CregR: VERB<lemma:$SubcatCOM>  [NOMINAL|PRO<type:D|P|I|X>]? PRP<lemma:con> NOMINAL|PRO<type:D|P|I|X>|VERB<mode:N>
(@temp) = ($listTags =~ /($VERB${l}lemma:$SubcatCOM\|${r})(?:$NOMINAL|$PRO${l}type:(?:D|P|I|X)\|${r})?($PRP${l}lemma:con\|${r})($NOMINAL|$PRO${l}type:(?:D|P|I|X)\|${r}|$VERB${l}mode:N\|${r})/g);
$Rel =  "CregR";
HeadRelDep($Rel,"",@temp);
$listTags =~ s/($VERB${l}lemma:$SubcatCOM\|${r})($NOMINAL|$PRO${l}type:(?:D|P|I|X)\|${r})?($PRP${l}lemma:con\|${r})($NOMINAL|$PRO${l}type:(?:D|P|I|X)\|${r}|$VERB${l}mode:N\|${r})/$1$2/g;

# CregR: VERB<lemma:$SubcatPOR>  [NOMINAL|PRO<type:D|P|I|X>]? PRP<lemma:por> NOMINAL|PRO<type:D|P|I|X>|VERB<mode:N>
(@temp) = ($listTags =~ /($VERB${l}lemma:$SubcatPOR\|${r})(?:$NOMINAL|$PRO${l}type:(?:D|P|I|X)\|${r})?($PRP${l}lemma:por\|${r})($NOMINAL|$PRO${l}type:(?:D|P|I|X)\|${r}|$VERB${l}mode:N\|${r})/g);
$Rel =  "CregR";
HeadRelDep($Rel,"",@temp);
$listTags =~ s/($VERB${l}lemma:$SubcatPOR\|${r})($NOMINAL|$PRO${l}type:(?:D|P|I|X)\|${r})?($PRP${l}lemma:por\|${r})($NOMINAL|$PRO${l}type:(?:D|P|I|X)\|${r}|$VERB${l}mode:N\|${r})/$1$2/g;

# CregR: VERB<lemma:$SubcatPARA>  [NOMINAL|PRO<type:D|P|I|X>]? PRP<lemma:para|cara> NOMINAL|PRO<type:D|P|I|X>|VERB<mode:N>
(@temp) = ($listTags =~ /($VERB${l}lemma:$SubcatPARA\|${r})(?:$NOMINAL|$PRO${l}type:(?:D|P|I|X)\|${r})?($PRP${l}lemma:(?:para|cara)\|${r})($NOMINAL|$PRO${l}type:(?:D|P|I|X)\|${r}|$VERB${l}mode:N\|${r})/g);
$Rel =  "CregR";
HeadRelDep($Rel,"",@temp);
$listTags =~ s/($VERB${l}lemma:$SubcatPARA\|${r})($NOMINAL|$PRO${l}type:(?:D|P|I|X)\|${r})?($PRP${l}lemma:(?:para|cara)\|${r})($NOMINAL|$PRO${l}type:(?:D|P|I|X)\|${r}|$VERB${l}mode:N\|${r})/$1$2/g;

# CregR: VERB<lemma:$SubcatSOBRE>  [NOMINAL|PRO<type:D|P|I|X>]? PRP<lemma:sobre> NOMINAL|PRO<type:D|P|I|X>|VERB<mode:N>
(@temp) = ($listTags =~ /($VERB${l}lemma:$SubcatSOBRE\|${r})(?:$NOMINAL|$PRO${l}type:(?:D|P|I|X)\|${r})?($PRP${l}lemma:sobre\|${r})($NOMINAL|$PRO${l}type:(?:D|P|I|X)\|${r}|$VERB${l}mode:N\|${r})/g);
$Rel =  "CregR";
HeadRelDep($Rel,"",@temp);
$listTags =~ s/($VERB${l}lemma:$SubcatSOBRE\|${r})($NOMINAL|$PRO${l}type:(?:D|P|I|X)\|${r})?($PRP${l}lemma:sobre\|${r})($NOMINAL|$PRO${l}type:(?:D|P|I|X)\|${r}|$VERB${l}mode:N\|${r})/$1$2/g;

# PunctL: [NOUNCOORD|PRO<type:D|P|I|X>] Fc [PRO<type:R|W>] VERB<adsubj:yes>|CONJ<adsubj:yes&coord:verb>    [Fc]?
# NEXT
# PunctR: [NOUNCOORD|PRO<type:D|P|I|X>] [Fc] [PRO<type:R|W>] VERB<adsubj:yes>|CONJ<adsubj:yes&coord:verb>   Fc
# NEXT
# DobjL: [NOUNCOORD|PRO<type:D|P|I|X>] [Fc]? PRO<type:R|W> VERB<adsubj:yes>|CONJ<adsubj:yes&coord:verb>    [Fc]?
# NEXT
# AdjnR: NOUNCOORD|PRO<type:D|P|I|X> [Fc]? [PRO<type:R|W>] VERB<adsubj:yes>|CONJ<adsubj:yes&coord:verb>    [Fc]?
(@temp) = ($listTags =~ /(?:$NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r})($Fc$a)(?:$PRO${l}type:(?:R|W)\|${r})($VERB${l}adsubj:yes\|${r}|$CONJ${l}adsubj:yes\|${b}coord:verb\|${r})(?:$Fc$a)?/g);
$Rel =  "PunctL";
DepHead($Rel,"",@temp);
(@temp) = ($listTags =~ /(?:$NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r})(?:$Fc$a)(?:$PRO${l}type:(?:R|W)\|${r})($VERB${l}adsubj:yes\|${r}|$CONJ${l}adsubj:yes\|${b}coord:verb\|${r})($Fc$a)/g);
$Rel =  "PunctR";
HeadDep($Rel,"",@temp);
(@temp) = ($listTags =~ /(?:$NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r})(?:$Fc$a)?($PRO${l}type:(?:R|W)\|${r})($VERB${l}adsubj:yes\|${r}|$CONJ${l}adsubj:yes\|${b}coord:verb\|${r})(?:$Fc$a)?/g);
$Rel =  "DobjL";
DepHead($Rel,"",@temp);
(@temp) = ($listTags =~ /($NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r})(?:$Fc$a)?(?:$PRO${l}type:(?:R|W)\|${r})($VERB${l}adsubj:yes\|${r}|$CONJ${l}adsubj:yes\|${b}coord:verb\|${r})(?:$Fc$a)?/g);
$Rel =  "AdjnR";
HeadDep($Rel,"",@temp);
$listTags =~ s/($NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r})($Fc$a)?($PRO${l}type:(?:R|W)\|${r})($VERB${l}adsubj:yes\|${r}|$CONJ${l}adsubj:yes\|${b}coord:verb\|${r})($Fc$a)?/$1/g;

# PunctL: [NOUNCOORD|PRO<type:D|P|I|X>] Fc [PRO<type:R|W>] VERB|CONJ<coord:verb>   [Fc]?
# NEXT
# PunctR: [NOUNCOORD|PRO<type:D|P|I|X>] [Fc]? [PRO<type:R|W>] VERB|CONJ<coord:verb> Fc
# NEXT
# SubjL: [NOUNCOORD|PRO<type:D|P|I|X>] [Fc]? PRO<type:R|W> VERB|CONJ<coord:verb>   [Fc]?
# NEXT
# AdjnR: NOUNCOORD|PRO<type:D|P|I|X> [Fc]? [PRO<type:R|W>] VERB|CONJ<coord:verb>  [Fc]?
(@temp) = ($listTags =~ /(?:$NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r})($Fc$a)(?:$PRO${l}type:(?:R|W)\|${r})($VERB$a|$CONJ${l}coord:verb\|${r})(?:$Fc$a)?/g);
$Rel =  "PunctL";
DepHead($Rel,"",@temp);
(@temp) = ($listTags =~ /(?:$NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r})(?:$Fc$a)?(?:$PRO${l}type:(?:R|W)\|${r})($VERB$a|$CONJ${l}coord:verb\|${r})($Fc$a)/g);
$Rel =  "PunctR";
HeadDep($Rel,"",@temp);
(@temp) = ($listTags =~ /(?:$NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r})(?:$Fc$a)?($PRO${l}type:(?:R|W)\|${r})($VERB$a|$CONJ${l}coord:verb\|${r})(?:$Fc$a)?/g);
$Rel =  "SubjL";
DepHead($Rel,"",@temp);
(@temp) = ($listTags =~ /($NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r})(?:$Fc$a)?(?:$PRO${l}type:(?:R|W)\|${r})($VERB$a|$CONJ${l}coord:verb\|${r})(?:$Fc$a)?/g);
$Rel =  "AdjnR";
HeadDep($Rel,"",@temp);
$listTags =~ s/($NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r})($Fc$a)?($PRO${l}type:(?:R|W)\|${r})($VERB$a|$CONJ${l}coord:verb\|${r})($Fc$a)?/$1/g;

# PunctL: [NOUNCOORD|PRO<type:D|P|I|X>] Fc [PRP] [PRO<type:R|W>] VERB|CONJ<coord:verb>   [Fc]?
# NEXT
# PunctR: [NOUNCOORD|PRO<type:D|P|I|X>] [Fc]?  [PRP] [PRO<type:R|W>] VERB|CONJ<coord:verb> Fc
# NEXT
# CircL: [NOUNCOORD|PRO<type:D|P|I|X>] [Fc]? PRP PRO<type:R|W> VERB|CONJ<coord:verb>  [Fc]?
# NEXT
# AdjnR: NOUNCOORD|PRO<type:D|P|I|X> [Fc]? [PRP] [PRO<type:R|W>] VERB|CONJ<coord:verb>  [Fc]?
(@temp) = ($listTags =~ /(?:$NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r})($Fc$a)(?:$PRP$a)(?:$PRO${l}type:(?:R|W)\|${r})($VERB$a|$CONJ${l}coord:verb\|${r})(?:$Fc$a)?/g);
$Rel =  "PunctL";
DepHead($Rel,"",@temp);
(@temp) = ($listTags =~ /(?:$NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r})(?:$Fc$a)?(?:$PRP$a)(?:$PRO${l}type:(?:R|W)\|${r})($VERB$a|$CONJ${l}coord:verb\|${r})($Fc$a)/g);
$Rel =  "PunctR";
HeadDep($Rel,"",@temp);
(@temp) = ($listTags =~ /(?:$NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r})(?:$Fc$a)?($PRP$a)($PRO${l}type:(?:R|W)\|${r})($VERB$a|$CONJ${l}coord:verb\|${r})(?:$Fc$a)?/g);
$Rel =  "CircL";
RelDepHead($Rel,"",@temp);
(@temp) = ($listTags =~ /($NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r})(?:$Fc$a)?(?:$PRP$a)(?:$PRO${l}type:(?:R|W)\|${r})($VERB$a|$CONJ${l}coord:verb\|${r})(?:$Fc$a)?/g);
$Rel =  "AdjnR";
HeadDep($Rel,"",@temp);
$listTags =~ s/($NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r})($Fc$a)?($PRP$a)($PRO${l}type:(?:R|W)\|${r})($VERB$a|$CONJ${l}coord:verb\|${r})($Fc$a)?/$1/g;

# PunctL: [NOUNCOORD|PRO<type:D|P|I|X>] Fc VERB<mode:[GP]>|CONJ<coord:verb>
# NEXT
# AdjnR: NOUNCOORD|PRO<type:D|P|I|X> [Fc]? VERB<mode:[GP]>|CONJ<coord:verb>
(@temp) = ($listTags =~ /(?:$NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r})($Fc$a)($VERB${l}mode:[GP]\|${r}|$CONJ${l}coord:verb\|${r})/g);
$Rel =  "PunctL";
DepHead($Rel,"",@temp);
(@temp) = ($listTags =~ /($NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r})(?:$Fc$a)?($VERB${l}mode:[GP]\|${r}|$CONJ${l}coord:verb\|${r})/g);
$Rel =  "AdjnR";
HeadDep($Rel,"",@temp);
$listTags =~ s/($NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r})($Fc$a)?($VERB${l}mode:[GP]\|${r}|$CONJ${l}coord:verb\|${r})/$1/g;

# AdjnR: VERB CONJ<type:S> [VERB]
# NEXT
# AdjnR: VERB [CONJ<type:S>] VERB
(@temp) = ($listTags =~ /($VERB$a)($CONJ${l}type:S\|${r})(?:$VERB$a)/g);
$Rel =  "AdjnR";
HeadDep($Rel,"",@temp);
(@temp) = ($listTags =~ /($VERB$a)(?:$CONJ${l}type:S\|${r})($VERB$a)/g);
$Rel =  "AdjnR";
HeadDep($Rel,"",@temp);
$listTags =~ s/($VERB$a)($CONJ${l}type:S\|${r})($VERB$a)/$1/g;

# TermR: PRP NOUNCOORD|PRO<type:D|P|I|X>|VERB
# NoUniq
(@temp) = ($listTags =~ /($PRP$a)($NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r}|$VERB$a)/g);
$Rel =  "TermR";
HeadDep($Rel,"",@temp);
$listTags =~ s/($PRP$a)($NOUNCOORD|$PRO${l}type:(?:D|P|I|X)\|${r}|$VERB$a)/$1$2/g;


# Single: VERB
# Add: nomin:no
(@temp) = ($listTags =~ /($VERB$a)/g);
$Rel =  "Single";
Head($Rel,"",@temp);
$listTags =~ s/($VERB$a)/$1/g;
Add("Head","nomin:no",@temp);

# Single: CONJ<lemma:pero|porque|mas|mais>
# Add: type:S
(@temp) = ($listTags =~ /($CONJ${l}lemma:(?:pero|porque|mas|mais)\|${r})/g);
$Rel =  "Single";
Head($Rel,"",@temp);
$listTags =~ s/($CONJ${l}lemma:(?:pero|porque|mas|mais)\|${r})/$1/g;
Add("Head","type:S",@temp);


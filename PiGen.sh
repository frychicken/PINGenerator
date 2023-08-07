#!/bin/bash

echo "Type in PiGen.sh the_number_you_want"
echo "This program will generate all possible PIN combinations of the amount of number you typed in"
echo "example: PiGen.sh 4 ---> this program will generate all possible combinations of 4 digits number"
echo "if 'Character was unexpected at this time' is returned, you did not input any number"
echo 

input=$1
if [ -z "$input" ]; then
    first=0
fi

i=0
x=0
b=$((input-1))
abc=0

while [ $x -ne $b ]; do
    x=$((x+1))
    echo "0" >> ~/Desktop/temp3.txt
done

while [ $i -ne $input ]; do
    i=$((i+1))
    echo "9" >> ~/Desktop/temp.txt
done

vara=""
while IFS= read -r A; do
    vara+="$A "
    echo "$vara"
done < ~/Desktop/temp3.txt > ~/Desktop/temp4.txt

var=""
while IFS= read -r A; do
    var+="$A "
    echo "$var"
done < ~/Desktop/temp.txt > ~/Desktop/temp1.txt

sleep "$vara" 

echo "You are about to generate $var numbers in: $var seconds"

f="1$vara"
g=0
st=0
varaaa="$vara"
varii="$vara"
while [ "$f" -ne 1 ]; do
    f=$((f/10))
    g=$((g+1))
done

vari="$vara"
bcd=$((1$vari/10-1))
def=$((1$vari/100-1))

if [ "$first" -ne "$var" ]; then
    abc="$vari"
    first=$((first+1))
    str="$abc$first"
fi

strLen=0
len=0

strLen_Loop() {
    if [ ! -z "${1:$len}" ]; then
        len=$((len+1))
        strLen_Loop "$1" "$2"
    else
        eval $2="$len"
    fi
}

strLen_Loop "$str" strLen

de=$((strLen-input))

while [ "$de" -ne 0 ]; do
    str="${str#?}"
    de=$((de-1))
done

while [ "$strLen" -ne "$input" ]; do
    str="${str#?}"
    strLen=$((strLen-1))
done

while [ "$f" -ne 1 ]; do
    f=$((f/10))
    g=$((g+1))
done

while [ "$vari" -ne 1 ]; do
    vari=$((vari-1))
    f="$f$vari"
done

while [ "$vari" -ne 0 ]; do
    f="$f$vari"
    vari=$((vari-1))
done

while [ "$st" -ne "$g" ]; do
    st=$((st+1))
    de="${f:st-1:1}"
    str="$str$de"
done

while [ "$de" -ne "$input" ]; do
    echo "$str" >> ~/Desktop/wordlist3.txt
    echo "$str / $var"
    str="${str#?}"
    de=$((de+1))
done

echo "Done!"

#!/bin/bash

#SITE="https://ltb-project.org/documentation"
#wget -r -np -k ${SITE}
#find . -name '*?do=*' -exec rm {} \;
#mv ltb-project.org/documentation .
#rm -rf ltb-project.org

for i in $( find documentation -type f ) ; do
    pandoc -s --self-contained --reference-links -f html -t rst $i > $i.rst
done

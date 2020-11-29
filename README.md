# gnu style chello package
## guide
```
export PACKAGE_NAME=chello
mkdir $PACKAGE_NAME
mkdir $PACKAGE_NAME/src
touch $PACKAGE_NAME/src/$PACKAGE_NAME.c
cd $PACKAGE_NAME
touch NEWS README AUTHORS ChangeLog
printf "#include <stdio.h> \n int main(void){ printf(\"hello world\"); return 0;}" >> src/$PACKAGE_NAME.c
echo SUBDIRS=src >> Makefile.am
echo bin_PROGRAMS=$PACKAGE_NAME >> src/Makefile.am
echo $PACKAGE_NAME\_SOURCES=$PACKAGE_NAME.c >> src/Makefile.am
echo AM_CFLAGS="-O2 -g" >> src/Makefile.am
autoscan
sed -e "s/FULL-PACKAGE-NAME/$PACKAGE_NAME/" -e "s/VERSION/1.0/" -e "s/BUG-REPORT-ADDRESS/example@example.com/" configure.scan > configure.ac
sed -i "5aAM_INIT_AUTOMAKE" configure.ac
aclocal
autoheader
automake -ac
autoconf
./configure && make
```

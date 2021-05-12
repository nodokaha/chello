mkdir $PACKAGE_NAME
mkdir $PACKAGE_NAME/src
mkdir $PACKAGE_NAME/info
touch $PACKAGE_NAME/src/$PACKAGE_NAME.c
touch $PACKAGE_NAME/info/Makefile.am
touch $PACKAGE_NAME/info/$PACKAGE_NAME.texi
cd $PACKAGE_NAME
touch NEWS README AUTHORS ChangeLog
printf "#include <stdio.h> \n int main(void){ printf(\"hello world\"); return 0;}" > src/$PACKAGE_NAME.c
echo SUBDIRS=src info >> Makefile.am
echo bin_PROGRAMS=$PACKAGE_NAME >> src/Makefile.am
echo $PACKAGE_NAME\_SOURCES=$PACKAGE_NAME.c >> src/Makefile.am
echo AM_CFLAGS="$CFLAGS" >> src/Makefile.am
echo info_TEXINFOS=$PACKAGE_NAME.texi >> info/Makefile.am
echo \\input texinfo >> info/$PACKAGE_NAME.texi
echo @setfilename $PACKAGE_NAME.info >> info//$PACKAGE_NAME.texi
echo @settitle $PACKAGE_NAME Manual >> info/$PACKAGE_NAME.texi
echo by scp-eee @copyright\{\} >> info/$PACKAGE_NAME.texi
echo Hello user, This is sample info >> info/$PACKAGE_NAME.texi
echo @bye >> info/$PACKAGE_NAME.texi
autoscan
sed -e "s/FULL-PACKAGE-NAME/$PACKAGE_NAME/" -e "s/VERSION/1.0/" -e "s/BUG-REPORT-ADDRESS/$EMAIL/" configure.scan > configure.ac
sed -i "5aAM_INIT_AUTOMAKE" configure.ac
aclocal
autoheader
automake -ac
autoconf
./configure && make

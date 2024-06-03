cd main; make clean; make
cd ../others; make clean; make
cd ..
PDFconcat -o pubList.pdf main/pubList.pdf others/pubList.pdf

cd main_JPN; make clean; make
cd ../others_JPN; make clean; make
cd ..
PDFconcat -o pubList_JPN.pdf main_JPN/pubList.pdf others_JPN/pubList.pdf

#! /bin/bash
# Update : 
# A simple handy script to compresse pdf using ghostscript
# Update  : V0.1.1 25/10/2015 : Adding subtitile, audio Bite rate 128,
# Comment : V0.1.2 25/10/2015 : Adding debug
#
compresspdf() {
    gs -sDEVICE=pdfwrite -dDetectDuplicateImages=true -dColorImageResolution=150 -dDownsampleColorImages=true  -dJPEGQ=95 -dNOPAUSE -dQUIET -dBATCH -dPDFSETTINGS=/${3:-"ebook"} -dCompatibilityLevel=1.4 -sOutputFile=$2 $1  > /dev/null   2>&1
}

SRC=$1
find -E $SRC -type f -regex ".*\.(pdf|PDF)$" -exec rename  -e 's/( |,|~|\)|\()/_/g' {} \;
find -E $SRC -type f -regex ".*\.GHS.pdf$" -exec rename  -e 's/__/_/g' {} \;
for FILE in  `find -E $SRC -type f -regex ".*\.pdf$" ! \( -name "*.GHS.pdf" \)  `
	do
                DEST_ORIG=`echo $FILE | sed 's%/[^/]*$%/%'`
        	filename=$(basename $FILE)
        	extension=${filename##*.}
        	filename=${filename%.*}
		osascript -e "display notification \"$FILE\""
		echo "$DEST_ORIG$filename.GHS.pdf"
		osascript -e 'display notification "Start compressing"'
	    if [ -e "$DEST_ORIG$filename.GHS.pdf" ]
                then
	        mv $FILE /Users/$USER/.Trash/
	        echo "$DEST_ORIG$filename.GHS.pdf" "already exist"
	        continue
	    fi
                Start_Compression=$(gdate +"%H:%M:%S")
		compresspdf  "$FILE"   "$DEST_ORIG$filename.GHS.pdf"
                End_Compression=$(gdate +"%H:%M:%S")
                StartDate=$(gdate -u -d "$Start_Compression" +"%s")
                FinalDate=$(gdate -u -d "$End_Compression" +"%s")
                Compression_Time=$(gdate -u -d "0 $FinalDate sec - $StartDate sec" +"%H:%M:%S")
		osascript -e 'display notification "End compressing '"$filename.$DEST_EXT"'  in  '"$Compression_Time"' "'
                Size_SRC=`du -h "$FILE"`
		Size_HB=`du -h "$DEST_ORIG$filename.GHS.pdf"`
		echo -e "Original size : $Size_SRC \nAfter compres : $Size_HB "
		mv $FILE /Users/$USER/.Trash/
	done

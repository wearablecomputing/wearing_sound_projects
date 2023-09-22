# Copies of webp format are created for legacy browsers (like older Safari versions)
for d in `find . -name "Images" -type d` ; do ( \
    echo "$d"
    cd "$d" && \
    cd thumbnail;
    magick mogrify -format jpg *.webp
    cd ../medium;
    magick mogrify -format jpg *.webp
    cd ../large;
    magick mogrify -format jpg *.webp
    ) \
; done

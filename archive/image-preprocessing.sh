# All images in the projects are converted to .webp format and downsized
# This script builds on ImageMagick

# Create Subdirectories
for d in `find . -name "Images" -type d` ; do ( \
cd "$d" && \
mkdir original; \
mkdir full-size; \
mkdir thumbnail; \
mkdir large; \
mkdir medium;) \
; done

# Find all the images and convert to webp
# -execdir works like -exec with the exception that utility will be executed from the directory that holds the current file.
# -iname instead of -name to be case-insensitive
# find . -iname '*.heic' -execdir mogrify -path "./full-size" -format webp {} +
find . -iname '*.heic' -execdir mogrify -format webp {} +
find . -iname '*.jpg' -exec mogrify -format webp {} +
find . -iname '*.jpeg' -exec mogrify -format webp {} +
find . -iname '*.png' -exec mogrify -format webp {} +
find . -iname '*.tif' -exec mogrify -format webp {} +
find . -iname '*.tiff' -exec mogrify -format webp {} +

# create lower-res versions
echo "Starting to resize to thumbnails ..."
find . -iname '*.webp' -execdir mogrify -path "./thumbnail" -resize x350 {} +
echo "Finished resizing to thumbnails ..."
echo "Starting to resize medium ..."
find . -iname '*.webp' -execdir mogrify -path "./medium" -resize x1000 {} +
echo "Finished resizing medium ..."
echo "Starting to resize large ..."
find . -iname '*.webp' -execdir mogrify -path "./large" -resize x1500 {} +
echo "Finished resizing large ..."

# # move full-size webp in subfolder
for d in ./*/*/Images ; do (cd "$d" && mv *.webp ./full-size); done

# move all originals into subfolder (that is excluded from Git LFS)
for d in ./*/*/Images ; do ( \
cd "$d" && \
mv *.jpg ./original; \
mv *.jpeg ./original; \
mv *.JPG ./original; \
mv *.HEIC ./original; \
mv *.png ./original; \
mv *.tif ./original; \
mv *.tiff ./original;) \
; done

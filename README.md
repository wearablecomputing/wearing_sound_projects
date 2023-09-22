# wearing_sound_projects

https://wearablecomputing.github.io/wearing_sound_projects/

## Local Development

`bundle exec jekyll serve` or `jekyll serve`.

## Media Preprocessing

### Images

_IMPORTANT_ Check that the directory structure of the project is correct (compare with template).
If the directory structure is right (all images need to be in a `/Images` subdirectory of the project) the images can (and need to) be preprocessed by executing
`sh archive/image-preprocessing.sh` at the project root.
The script uses ImageMagick to convert all images to `webp` format and create versions at different resolutions.

One image from the `medium` folder of each project needs to be renamed to `title_img.webp`. This is the image that will then be displayed in the project overview.

### Audio

Run `sh archive/audio-preprocessing.sh` at the project root. Include other file formats (`.aiff`, `.flac`) in the script if needed.

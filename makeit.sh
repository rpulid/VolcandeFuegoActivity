#/bin/bash
a=1
for i in $1/*.jpg; do
    new=$(printf "%05d.jpg" "$a")
    cp -- "$i" "$new"
    let a=a+1
done
#ffmpeg -framerate 15 -start_number 00001 -i %05d.jpg -i ./Ludovico-Einaudi_Nuvole-Bianche.mp3 -c:v libx264 -c:a copy -shortest out.mp4
#ffmpeg -framerate 15 -start_number 00001 -i %05d.jpg -i ./Ludovico-Einaudi_Nuvole-Bianche.mp3 -c:v libx264 -c:a copy -shortest out.mp4
#ffmpeg -framerate 15 -start_number 00001 -i %05d.jpg -i ./Ludovico-Einaudi_Nuvole-Bianche.mp3 -c:v libx264 -c:a copy out.mp4

cat ./$i/*.jpg | ffmpeg -framerate $3 -f image2pipe -vcodec mjpeg -i - -i Ludovico-Einaudi_Nuvole-Bianche.mp3 -strict -2 ./$2_out.mp4
ffmpeg -i ./$2_out.mp4 -c:v libvpx -crf 10 -b:v 1M -c:a libvorbis .$2.webm
rm -rf ./$2_out.mp4
#ffmpeg -framerate 25 -start_number 00001 -i %05d.jpg -c:v libx264 -r 30 -pix_fmt yuv420p ./$2.mp4
rm -rf *.jpg
#mogrify -resize 800x800 *.jpg
#convert *.jpg -delay 30 -morph 5 %05d.jpg
#ffmpeg -framerate 25 -i %05d.jpg -c:v libx264 -profile:v high -crf 20 -pix_fmt yuv420p output.mp4

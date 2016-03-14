# linux/ubuntu
wget https://github.com/adobe-fonts/source-code-pro/archive/2.010R-ro/1.030R-it.zip
unzip 1.030R-it.zip
mkdir -p ~/.fonts
mv source-code-pro-2.010R-ro-1.030R-it/OTF/*.otf ~/.fonts
rm -r 1.030R-it.zip source-code-pro-2.010R-ro-1.030R-it
fc-cache -f -v

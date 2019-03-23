
<a href="http://bitly.com/2grT54q"><img src="https://cdn.codementor.io/badges/i_am_a_codementor_dark.svg" alt="I am a codementor" style="max-width:100%"/></a><a href="http://bitly.com/2grT54q"><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/d/dc/Ghostscript.svg/1200px-Ghostscript.svg.png" height="50"> [![Donate](https://www.paypalobjects.com/en_US/i/btn/btn_donateCC_LG.gif)](https://www.paypal.me/HAAW)

# CompressPDF
simple handy shell script to compress pdf using ghostscript lib
## Description 
simple handy shell script to compress pdf using ghostscript : 
 - Reduce BigPDF Files 
 - optimize the PDF size

I was able to reduce my 16G library to 11G without losing quality ont the Pdf images

## Requierement

### MacOS
```
brew install ghostscript
```
### Linux
```
yum install ghostscript
```
### Compile it from source 

Please refer to the offical [docuementation](http://ghostscript.com/doc/7.07/Install.htm)

## Installation
```
git clone git

cp compresspdf.sh   /usr/local/bin/compresspdf.sh
chmod +x /usr/local/bin/compresspdf.sh
```
## Usage
```
compresspdf.sh   'PDF_DIRECTORY/'
```
Please notice that parsed PDF name will be changed to GHS.pdf : 

for example :  alice.pdf -> alice.GHS.pdf

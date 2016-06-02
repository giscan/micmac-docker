# Docker for Micmac
Micmac in a docker container
Micmac is a photogrammetry software developped by IGN (French National Geographic Institute) under CeCILL-B licence

Official website : http://logiciels.ign.fr/?Micmac

Mercurial repository : https://geoportail.forge.ign.fr/hg/culture3d/



**What is docker ?**

Docker is an ability to run virtual machine easyly. You could build a container like this one for Micmac under every system. You just have to install docker on your system



**Why a docker container for Micmac ?**

I use Archlinux and building is a bit complicated. There is a user repository named AUR (Archlinux User Repository) with micmac but the build failed. Like many aur package's I tried to debug it but don't know if in fact in the future I could use micmac or not (depending on the results I could obtain with Micmac) ! That's why I created this docker container



**How to run micmac-docker container ?**

First you have to build the container by typing in a terminal :

`docker build -t giscan/micmac git://github.com/giscan/micmac-docker`

Then you could launch CLI binaries from docker with 

`docker run -it giscan/micmac mm3d`

Watch your container : 

`docker images`


**How can I delete this thing ?**

Just remove it with docker : 

`docker rmi -f giscan/micmac`


**Mercurial repository of Micmac is updated, how could I update micmac ?**

`docker run -it giscan/micmac update_micmac.sh`



Feel free to fork. Have fun !


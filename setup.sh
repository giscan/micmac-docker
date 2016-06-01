cd 
echo "*******************************************************"
echo "*********       INSTALLING LIBRAIRIES         *********"
echo "*******************************************************"
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install x11proto-core-dev make cmake libx11-dev mercurial subversion imagemagick gcc g++ exiv2 libimage-exiftool-perl libgeo-proj4-perl mesa-common-dev libgl1-mesa-dev libglapi-mesa libglu1-mesa qt5-default doxygen opencl-headers
echo "*******************************************************"
echo "**********       LIBRAIRIES INSTALLED        **********"
echo "*******************************************************"
echo " "
echo " "
echo " "
echo "*******************************************************"
echo "**********        DOWNLOADING MICMAC         **********"
echo "**********  (This may take several minutes)  **********"
echo "**********         user : culture3d          **********"
echo "**********       password : culture3d        **********"
echo "*******************************************************"
cd /opt
hg clone https://culture3d:culture3d@geoportail.forge.ign.fr/hg/culture3d micmac
echo "*******************************************************"
echo "************       MICMAC DOWNLOADED       ************"
echo "*******************************************************"
echo " "
echo " "
echo " "
echo "*******************************************************"
echo "********          COMPILING SOFTWARE          *********"
echo "*******************************************************"
cd micmac
mkdir build
cd build
cmake -DBUILD_PATH_BIN="/usr/bin" \
	-DDEPLOY=1
	-DWITH_QT5=1 \
	-DBUILD_POISSON=1 \
	-DBUILD_RNX2RTKP=1 \
	-DWITH_OPENCL=ON  \
	-DWITH_OPEN_MP=ON \
	-DWITH_ETALONPOLY=ON \
	-DWITH_DOXYGEN=ON \
	-DBUILD_POISSON=ON  ../
NBRP=$(cat /proc/cpuinfo | grep processor | wc -l)
make -j$NBRP
make install
echo "*******************************************************"
echo "************       SOFTWARE COMPILED       ************"
echo "*******************************************************"
echo "*******************************************************"
echo "\nexport PATH=$PATH:~/culture3d/bin" >> ~/.bashrc
echo "*******************************************************"
echo "********    MicMac should now be set up     **********"
echo "********    in your personal repository     **********"
echo "********  Please report any inconvenience   **********"
echo "******** http://forum-micmac.forumprod.com  **********"
echo "******** Edit by Sylvain POULAIN for Docker **********"
echo "********    <sylvain.poulain@giscan.com>    **********"
echo "*******************************************************"

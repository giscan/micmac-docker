echo "*******************************************************"
echo "*********           UPDATE MICMAC             *********"
echo "*******************************************************"
cd
cd /opt/
echo "*******************************************************"
echo "**********   DOWNLOADING THE LAST CHANGES    **********"
echo "**********  (This may take several minutes)  **********"
echo "**********         user : culture3d          **********"
echo "**********       password : culture3d        **********"
echo "*******************************************************"
hg pull https://culture3d:culture3d@geoportail.forge.ign.fr/hg/culture3d micmac
hg update
cd build/
echo "*******************************************************"
echo "********           BUILDING  MICMAC           *********"
echo "*******************************************************"
cmake -DBUILD_PATH_BIN="/usr/bin" \
	-DDEPLOY=1 \
	-DWITH_QT5=1 \
	-DBUILD_POISSON=1 \
	-DBUILD_RNX2RTKP=1 \
	-DWITH_OPENCL=ON  \
	-DWITH_OPEN_MP=ON \
	-DWITH_ETALONPOLY=ON \
	-DWITH_DOXYGEN=ON \
	../
NBRP=$(cat /proc/cpuinfo | grep processor | wc -l)
make -j$NBRP
make install 
echo "*******************************************************"
echo "********             MICMAC UPDATED           *********"
echo "******** Edit by Sylvain POULAIN for Docker **********"
echo "********    <sylvain.poulain@giscan.com>    **********"
echo "*******************************************************"

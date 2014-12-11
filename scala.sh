#! /bin/bash

# do not execute with sudo

echo "Enter scala version or hit enter for 2.10.4"
read version
if [ "$version" == "" ] 
then
  version="2.10.4"
fi
dl="scala-$version.tgz"
url="http://www.scala-lang.org/files/archive/$dl"

echo "Setting up scala $version from $url"
#sudo mkdir /opt/scala
#cd /opt/scala
wget "$url"
sudo tar xzf "$dl"
sudo rm "$dl"
#sudo ln -s "/opt/scala/scala-$version" /opt/scala/latest
sudo cp -r "scala-$version" /var/lib/jvm/

sudo update-alternatives --install /usr/bin/scala scala "/usr/lib/jvm/scala-$version/bin/scala" 1

sudo update-alternatives --install /usr/bin/scalac scalac "/usr/lib/jvm/scala-$version/bin/scalac" 1

sudo update-alternatives --install /usr/bin/fsc fsc "/usr/lib/jvm/scala-$version/bin/fsc" 1

sudo update-alternatives --install /usr/bin/scalap scalap "/usr/lib/jvm/scala-$version/bin/scalap" 1

sudo update-alternatives --install /usr/bin/scaladoc scaladoc "/usr/lib/jvm/scala-$version/bin/scaladoc" 1

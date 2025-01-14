yum install -y libffi-devel
wget https://www.python.org/ftp/python/3.9.16/Python-3.9.16.tgz
tar xzf Python-3.9.16.tgz
cd Python-3.9.16
./configure --enable-optimizations
make install
cd ..
ln -sf /Python-3.9.16/python /vpy3/bin/python3
FROM frrouting/frr
COPY frr.conf /etc/frr/daemons
COPY . /opt/badass

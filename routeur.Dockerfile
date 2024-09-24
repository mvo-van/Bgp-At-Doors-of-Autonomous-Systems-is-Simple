FROM frrouting/frr
COPY frr.conf /etc/frr/daemons
COPY ./p1 /opt/badass/p1
COPY ./p2 /opt/badass/p2

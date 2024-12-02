FROM frrouting/frr
COPY ./p1/frr.conf /etc/frr/daemons
COPY ./p1 /opt/badass/p1
COPY ./p2 /opt/badass/p2
COPY ./p3 /opt/badass/p3

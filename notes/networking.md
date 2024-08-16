
# Networking 

This page is dedicated to all my notes / research dedicated to learning the foundational concepts of computer networking. My intention with this page is to serve as a reference while working on my hypervisor and implementing new tools / technologies to make my setup more complex in what it can do.


# Autonegotiation 

Autonegotiation is a feature that allows a port on a router / server / switch / server to negotiate with the device on the other end of a link to determine the best duplex setting and speed. A driver then configures the interface to the values negotiated for the link. There are two parameters I mentioned before for negotiation. Those two being the speed and the duplex setting. 

Speeds are negotiated in Megabits per second ( Mbps ). in multiples of 10 ( 10 , 100 , 1000 , 10000).

Duplex determines how data flows on the device , half duplex means that only one side can trasmit data while the other cannot. Full duplex means that both sides can transmit & receive data at the same time.

There is a common misconception about autonegotiation, that being the misconception that autonegotiation configures the other host on the opposite side of the link. Autonegotiation only works if BOTH sides of the link are implementing autonegotiation. If both sides aren't using autonegotiate , then autonegotiate cannot determine the speed / duplex of the switch. 

If both sides are using autonegotiate , then one device advertises the speed / duplex to the other device on the link. The configuration is done on the hosts that have the feature enabled.

There is a common issue with autonegotiation being "parallel detection" which is enabled once autonegotiation fails to find autonegotiation running on the other side of the link.

Parallel detection works by sending a signal to the 10Base-T , 100Base-TX , 100Base-T4 drivers on the switch. If any of the drivers detect the signal , the interface is set to the speed mentioned on the signal. Keep in mind, parallel detection only changes the speed on the interface and **NOT** the duplex. You should keep this in mind as the way duplex is set differs based on the ethernet standard used.


## 10Base-T

Originally designed without full-duplex support. Some do , but most do not.

## 100Base-T

Has always had fully supported full-duplex however, by default however the standard will use half-duplex until set manually.  

## 1000Base-T 

This standard has more support for autonegotiation. In general links using this standard should be left to autonegotiate.

## 10 Gigabit 

Links using this standard are more dependent on fiber transcievers or specialized copper connectors which dictates how 10G connects. 

on a 6500 switch they usually require XENPAKS which only run at 10G.

---




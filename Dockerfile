FROM ubuntu:focal

RUN sed -i 's/# deb-src/deb-src/' /etc/apt/sources.list
RUN apt update -y
RUN DEBIAN_FRONTEND=noninteractive apt install -y devscripts git-buildpackage software-properties-common
RUN apt build-dep -y shim
RUN git clone https://github.com/alfred-liu-atrust/shim-review.git
RUN git clone https://github.com/alfred-liu-atrust/shim.git
WORKDIR /shim
RUN gbp buildpackage -us -uc -b
WORKDIR /
RUN hexdump -Cv /shim-review/shimx64.efi > orig
RUN hexdump -Cv /shim/shimx64.efi > build
RUN diff -u orig build

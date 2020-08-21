FROM odanoburu/gf-rgl:latest

RUN git clone -b cade-demo --single-branch https://github.com/odanoburu/gf-contrib.git

RUN cd gf-contrib/cade-2011 && make

WORKDIR /gf-contrib/cade-2011 

CMD ["/root/.cabal/bin/gf", "Prop.pgf"]

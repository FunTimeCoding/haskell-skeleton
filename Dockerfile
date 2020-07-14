FROM debian
MAINTAINER Alexander Reitzel
ADD script/docker/provision.sh /root/provision.sh
RUN chmod +x /root/provision.sh
RUN /root/provision.sh
ADD . /haskell-skeleton
ENTRYPOINT ["/haskell-skeleton/bin/hs"]

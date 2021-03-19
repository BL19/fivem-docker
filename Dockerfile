ARG FIVEM_VER=3679-b45702ad5c4f7da870c55bdd10900ba64f53a097

FROM alpine:latest

ARG FIVEM_VER

WORKDIR /fx

LABEL maintainer="BL19 <bl19@bl19.cf>" \
      org.label-schema.vendor="BL19" \
      org.label-schema.name="FiveM" \
      org.label-schema.url="https://fivem.net" \
      org.label-schema.description="FiveM is a modification for Grand Theft Auto V enabling you to play multiplayer on customized dedicated servers." \
      org.label-schema.version=${FIVEM_NUM} \
      io.spritsail.version.fivem=${FIVEM_VER}

RUN wget -O- http://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/${FIVEM_VER}/fx.tar.xz \
        | tar xJ --strip-components=1 \
            --exclude alpine/dev --exclude alpine/proc \
            --exclude alpine/run --exclude alpine/sys
			
EXPOSE 30120

CMD [""]

ENTRYPOINT ["/bin/ash", "run.sh"]

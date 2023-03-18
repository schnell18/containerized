FROM sharelatex/sharelatex:3.0.1
LABEL MAINTAINER Justin Zhang "schnell18@gmail.com"

SHELL ["/bin/bash", "-cx"]

# get minted, svg to work
# https://github.com/overleaf/overleaf/issues/851#issuecomment-830276429
RUN apt-get update && \
    apt-get install python3-pygments inkscape -y

# # update tlmgr itself
# RUN wget "https://mirror.ctan.org/systems/texlive/tlnet/update-tlmgr-latest.sh" \
#     && sh update-tlmgr-latest.sh \
#     && tlmgr --version \
#     && tlmgr update texlive-scripts \
#     && tlmgr update --all \
#     && tlmgr install scheme-full

# update tlmgr texlive-scripts and install all packages
RUN tlmgr update texlive-scripts && \
    tlmgr update --all           && \
    tlmgr install scheme-full

# enable shell-escape by default:
RUN TEXLIVE_FOLDER=$(find /usr/local/texlive/ -type d -name '20*')      && \
    echo % enable shell-escape by default >> /$TEXLIVE_FOLDER/texmf.cnf && \
    echo shell_escape = t >> /$TEXLIVE_FOLDER/texmf.cnf

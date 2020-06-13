#!/bin/sh

##########################
# Install missing packages
##########################
tlmgr install enumitem \
              xifthen \
              ifmtarg \
              sourcesanspro \
              tcolorbox \
              environ \
              trimspaces \
              lastpage \
              || exit 1

################################################################################
# Trim down (possibly large amounts of) installed artifacts such as docs.      #
################################################################################
rm -rf /opt/texlive/texdir/texmf-dist/doc  \
       /opt/texlive/texdir/readme-html.dir \
       /opt/texlive/texdir/readme-txt.dir  \
       /opt/texlive/texdir/install-tl*
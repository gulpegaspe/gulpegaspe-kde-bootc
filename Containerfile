FROM quay.io/fedora/fedora-bootc:latest
MAINTAINER Ivan Gasperoni

# INSTALL REPOS
RUN dnf -y install dnf-plugins-core
RUN dnf config-manager addrepo --from-repofile=https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo

# INSTALL PACKAGES
RUN dnf -y install @kde-desktop-environment
RUN dnf -y install brave-browser \
    distrobox \
    docker \
    kde-l10n-it \
    langpacks-it \
    virt-manager
#RUN grep -vE '^#' /usr/local/share/kde-bootc/packages-added | xargs dnf -y install --allowerasing

# REMOVE PACKAGES
#RUN grep -vE '^#' /usr/local/share/kde-bootc/packages-removed | xargs dnf -y remove
RUN dnf -y autoremove
RUN dnf clean all

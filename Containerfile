FROM quay.io/fedora/fedora-bootc:latest
MAINTAINER Ivan Gasperoni

# INSTALL REPOS
RUN dnf -y install dnf5-plugins
RUN dnf config-manager addrepo --from-repofile=https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo

# INSTALL PACKAGES
#RUN dnf -y install @kde-desktop-environment
RUN dnf -y install plasma-workspace \
    plasma-login-manager \
    plasma-nm \
    plasma-nm-openvpn \
    dolphin \
    kate \
    spectacle \
    kcalc \
    krita \
    gwenview \
    okular \
    konsole \
    plasma-print-manager \
    plasma-firewall \
    krdp \
    keepsecret

# runc id needed by docker
RUN dnf -y install brave-browser \
    distrobox \
    docker \
    runc \
    kde-l10n-it \
    langpacks-it \
    virt-manager \
    flatpak-kcm \
    firefox \
    flatpak \
    spice-vdagent

# CLEAN PACKAGES
RUN dnf -y autoremove
RUN dnf clean all

# LOGS CLEAN
RUN find /var/log -type f ! -empty -delete

# VALIDATION
RUN bootc container lint

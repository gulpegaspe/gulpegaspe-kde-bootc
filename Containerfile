FROM quay.io/fedora/fedora-bootc:latest
LABEL maintainer="Ivan Gasperoni"

RUN dnf -y install dnf5-plugins && \
    dnf config-manager addrepo --from-repofile=https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo && \
    dnf -y install \
        plasma-workspace \
        plasma-login-manager \
        plasma-nm \
        plasma-nm-openvpn \
        dolphin \
        kate \
        specctacle \
        kcalc \
        krita \
        gwenview \
        okular \
        konsole \
        plasma-print-manager \
        plasma-firewall \
        krdp \
        keepsecret \
        langpacks-en \
        brave-browser \
        distrobox \
        docker \
        runc \
        virt-manager \
        flatpak-kcm \
        firefox \
        flatpak \
        borgbackup \
        langpacks-it && \
    flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo && \
    flatpak update -y && \
    flatpak install -y io.github.flattool.Warehouse && \
    dnf -y autoremove && \
    dnf clean all && \
    find /var/log -type f ! -empty -delete && \
    bootc container lint

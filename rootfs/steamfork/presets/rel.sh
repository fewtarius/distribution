#!/bin/bash
rm -rf /tmp/builder-releasetag
rm -rf /tmp/build_temp_ver

export DISTRO_NAME="SteamFork"
export IMAGE_HOSTNAME="steamfork"
export OS_CODENAME="Rel"
export OS_FS_PREFIX="sf"

export HOME_URL="https://www.steamfork.org"
export DOCUMENTATION_URL="https://wiki.steamfork.org"
export SUPPORT_URL="${HOME_URL}"
export BUG_REPORT_URL="https://github.com/SteamFork#community"
echo -e ${RELEASE_TAG} > /tmp/builder-releasetag
echo -e "$(echo ${DISTRO_NAME} | tr '[:upper:]' '[:lower:]')_$(echo ${OS_CODENAME} | tr '[:upper:]' '[:lower:]')_${RELEASE_TAG}" > /tmp/build_temp_ver
export BUILDVER=$(cat /tmp/build_temp_ver)
export IMAGEFILE="${BUILDVER}"
export ENABLED_SERVICES=( sddm
                        bluetooth
                        systemd-timesyncd
			systemd-resolved
                        NetworkManager
			firewalld
			inputplumber
			steam-powerbuttond
                        steamos-offload.target
			fstrim.timer
                        var-lib-pacman.mount
                        etc.mount
                        nix.mount
                        opt.mount
                        root.mount
                        srv.mount
                        usr-lib-debug.mount
                        usr-local.mount
                        var-cache-pacman.mount
                        var-lib-docker.mount
                        var-lib-flatpak.mount
                        var-lib-systemd-coredump.mount
                        var-log.mount
                        var-tmp.mount )
export DISABLED_SERVICES=(jupiter-controller-update.service
			  wpa_supplicant.service
		  	  iwd.service)
export PLYMOUTH_THEME="steamos"
export FINAL_DISTRIB_IMAGE=${BUILDVER}
export KERNELCHOICE="linux"
export BASE_BOOTSTRAP_PKGS="base base-devel linux-firmware amd-ucode intel-ucode sddm-wayland dkms jq btrfs-progs core-${STEAMOS_VERSION}/grub efibootmgr openssh plymouth"
export STEAMOS_PKGS="accounts-qml-module
                    accountsservice
                    acl
                    adobe-source-code-pro-fonts
                    adwaita-cursors
                    adwaita-icon-theme
                    aha
                    alsa-card-profiles
                    alsa-lib
                    alsa-plugins
                    alsa-topology-conf
                    alsa-ucm-conf
                    alsa-utils
                    amd-ucode
                    anthy
                    aom
                    appstream
                    appstream-qt
                    arch-install-scripts
                    archlinux-appstream-data
                    archlinux-keyring
                    argon2
                    ark
                    aspell
                    aspell-en
                    assimp
                    at-spi2-core
		    atomupd-daemon
                    atkmm
                    attr
                    audit
                    avahi
                    base
                    bash
                    bash-completion
                    binutils
                    bluedevil
                    bluez
                    bluez-libs
                    bluez-utils
                    bolt
                    boost-libs
                    breakpad
                    breeze
                    breeze-icons
                    brotli
                    btop
                    btrfs-progs
                    bubblewrap
                    bzip2
                    ca-certificates
                    ca-certificates-mozilla
                    ca-certificates-utils
                    cairo
                    cairomm
                    cantarell-fonts
                    caps
                    casync
                    catatonit
                    cdparanoia
                    cfitsio
                    cifs-utils
                    clinfo
                    confuse
                    conmon
                    containers-common
                    convertlit
                    coreutils
                    cpupower
                    criu
                    crun
                    cryptsetup
                    curl
                    dav1d
                    db
                    db5.3
                    dbus
                    dbus-python
                    dconf
                    default-cursors
                    desktop-file-utils
                    desync
                    device-mapper
                    diffutils
                    ding-libs
                    discount
                    discover
                    distrobox
                    djvulibre
                    dmidecode
                    dnssec-anchors
                    dolphin
                    dos2unix
                    dosfstools
                    double-conversion
                    drkonqi
                    drm_info
                    duktape
                    e2fsprogs
                    ebook-tools
                    editorconfig-core-c
                    efibootmgr
                    efivar
                    elfutils
                    ell
                    enchant
                    evtest
                    exfat-utils
                    exiv2
                    expat
                    f3
                    fatresize
                    fd
                    ffmpeg
                    file
                    filesystem
                    findutils
                    firewalld
                    fish
                    flac
                    flashrom
                    flatpak
                    flatpak-kcm
                    fontconfig
                    freeglut
                    freerdp
                    freetype2
                    fribidi
                    fuse-common
                    fuse-overlayfs
                    fuse2
                    fuse3
                    fwupd
                    fwupd-efi
                    galileo-mura
                    gamemode
                    steamfork/gamescope
		    steamfork/gamescope-legacy
                    gawk
                    gc
                    gcab
                    gcc-libs
                    gdb
                    gdb-common
                    gdbm
                    gdk-pixbuf2
                    geoclue
                    gettext
                    ghostscript
                    giflib
                    git
                    glew
                    glfw-x11
                    glib-networking
                    glib2
                    glibc
                    glibmm
                    glu
                    gmp
                    gnupg
                    gnutls
                    gobject-introspection-runtime
                    gperftools
                    gpgme
                    gpm
                    gptfdisk
                    gpu-trace
                    graphene
                    graphite
                    grep
                    gsettings-desktop-schemas
                    gsm
                    gssproxy
                    gst-plugins-base
                    gst-plugins-base-libs
                    gstreamer
                    gtk-update-icon-cache
                    gtk3
                    gtkmm3
                    guile
                    gwenview
                    gzip
                    harfbuzz
                    hicolor-icon-theme
                    hidapi
                    highway
                    holo-desync
                    holo-dmi-rules
                    holo-fstab-repair
                    holo-keyring
                    holo-nix-offload
                    holo-sudo
                    htop
                    hunspell
                    hwdata
                    iana-etc
                    ibus
                    ibus-anthy
                    ibus-hangul
                    ibus-pinyin
                    ibus-table
                    ibus-table-cangjie-lite
                    icu
                    ijs
                    imath
                    intel-ucode
                    iotop
                    iproute2
                    iptables
                    iputils
                    iso-codes
                    iw
                    iwd
                    jansson
                    jasper
                    jbig2dec
                    jq
                    json-c
                    json-glib
                    jupiter-dock-updater-bin
                    jupiter-firewall
                    jupiter-hw-support
                    jupiter-legacy-support
                    jupiter-resolved-nomdns
                    jupiter-steamos-log-submitter
                    kaccounts-integration
                    kactivitymanagerd
                    kate
                    kbd
                    kde-cli-tools
                    kde-gtk-config
                    kdeconnect
                    kdecoration
                    kdelibs4support
                    kdeplasma-addons
                    kdialog
                    kdsoap
                    kdsoap-ws-discovery-client
                    kemoticons
                    kexec-tools
                    keyutils
                    khotkeys
                    kinfocenter
                    kirigami2
                    kitty-terminfo
                    kjs
                    kmenuedit
                    kmod
                    konsole
                    kpipewire
                    kpmcore
                    krb5
                    kscreen
                    kscreenlocker
                    ksshaskpass
                    ksystemstats
                    kwin
                    kwrited
                    l-smash
                    lame
                    layer-shell-qt
                    lcms2
                    ldb
                    ldns
                    less
                    lib32-alsa-lib
                    lib32-alsa-plugins
                    lib32-brotli
                    lib32-bzip2
                    lib32-curl
                    lib32-dbus
                    lib32-e2fsprogs
                    lib32-expat
                    lib32-flac
                    lib32-fontconfig
                    lib32-freetype2
                    lib32-gamemode
                    lib32-gamescope
                    lib32-gcc-libs
                    lib32-glib2
                    lib32-glibc
                    lib32-harfbuzz
                    lib32-icu
                    lib32-keyutils
                    lib32-krb5
                    lib32-libasyncns
                    lib32-libcap
                    steamfork/lib32-libdrm
                    lib32-libelf
                    lib32-libffi
                    lib32-libgcrypt
                    lib32-libglvnd
                    lib32-libgpg-error
                    lib32-libidn2
                    lib32-libldap
                    lib32-libnm
                    lib32-libogg
                    lib32-libpciaccess
                    lib32-libpipewire
                    lib32-libpng
                    lib32-libpsl
                    lib32-libpulse
                    lib32-libsndfile
                    lib32-libssh2
                    lib32-libtasn1
                    lib32-libtirpc
                    lib32-libunistring
                    lib32-libunwind
                    lib32-libva
                    lib32-libvdpau
                    lib32-libvorbis
                    lib32-libx11
                    lib32-libxau
                    lib32-libxcb
                    lib32-libxcrypt
                    lib32-libxcrypt-compat
                    lib32-libxdamage
                    lib32-libxdmcp
                    lib32-libxext
                    lib32-libxfixes
                    lib32-libxi
                    lib32-libxinerama
		    lib32-libxkbcommon
                    lib32-libxml2
                    lib32-libxshmfence
                    lib32-libxss
                    lib32-libxtst
                    lib32-libxxf86vm
                    lib32-llvm-libs
                    lib32-lm_sensors
                    lib32-mangohud
                    steamfork/lib32-mesa
                    lib32-ncurses
                    lib32-nspr
                    lib32-nss
                    lib32-openal
                    lib32-openssl
                    lib32-opus
                    lib32-p11-kit
                    lib32-pam
                    lib32-pcre2
                    lib32-pipewire
                    lib32-renderdoc-minimal
		    lib32-spirv-tools
                    lib32-sqlite
                    lib32-systemd
                    lib32-util-linux
                    lib32-vulkan-icd-loader
                    steamfork/lib32-vulkan-radeon
		    steamfork/lib32-vulkan-virtio
		    steamfork/lib32-vulkan-mesa-layers
                    lib32-wayland
                    lib32-xcb-util-keysyms
                    lib32-xz
                    lib32-zlib
                    lib32-zstd
                    libaccounts-glib
                    libaccounts-qt
                    libarchive
                    libass
                    libassuan
                    libasyncns
                    libatasmart
                    libavc1394
                    libblockdev
                    libbluray
                    libbpf
                    libbs2b
                    libbsd
                    libbytesize
                    libcanberra
                    libcap
                    libcap-ng
                    libcbor
                    libcec
                    libcloudproviders
                    libcolord
                    libcups
                    libdaemon
                    libdatrie
                    libdbusmenu-qt5
                    libdecor
                    libdmtx
                    steamfork/libdrm
                    libedit
                    libelf
                    libepoxy
                    libevdev
                    libevent
                    libfakekey
                    libfdk-aac
                    libffi
                    libfontenc
                    libfreeaptx
                    libftdi
                    libgcrypt
                    libgirepository
                    libglvnd
                    libgpg-error
                    libgudev
                    libgusb
                    libhangul
                    libibus
                    libical
                    libice
                    libidn
                    libidn2
                    libiec61883
                    libimobiledevice
                    libinih
                    libinput
                    libjcat
                    libjpeg-turbo
                    libjxl
                    libkexiv2
                    libksba
                    libkscreen
                    libksysguard
                    libldac
                    libldap
                    libmalcontent
                    libmbim
                    libmd
                    libmfx
                    libmm-glib
                    libmnl
                    libmodplug
                    libmtp
                    libndp
                    libnet
                    libnetfilter_conntrack
                    libnewt
                    libnfnetlink
                    libnftnl
                    libnghttp2
                    libnl
                    libnm
                    libnotify
                    libnsl
                    libogg
                    libomxil-bellagio
                    libopenmpt
                    libp11-kit
                    libpaper
                    libpcap
                    libpciaccess
                    libpgm
                    libplist
                    libpng
                    libproxy
                    libpsl
                    libpulse
                    libqaccessibilityclient
                    libqalculate
                    libqmi
                    libqrtr-glib
                    libraw
                    libraw1394
                    librsvg
                    libsamplerate
                    libsasl
                    libseccomp
                    libsecret
                    libsigc++
                    libslirp
                    libsm
                    libsmbios
                    libsndfile
                    libsodium
                    libsoup
                    libsoup3
                    libsoxr
                    libspectre
                    libssh
                    libssh2
                    libstemmer
                    libsysprof-capture
                    libtasn1
                    libteam
                    libthai
                    libtheora
                    libtiff
                    libtirpc
                    libtommath
                    libtool
                    libtraceevent
                    libtracefs
                    libunistring
                    libunwind
                    libusb
                    libusbmuxd
                    libutempter
                    libva
                    libvdpau
                    libverto
                    libvorbis
                    libvpx
                    libwacom
                    libwbclient
                    libwebp
                    libx11
                    libxau
                    libxaw
                    libxcb
                    libxcomposite
                    libxcrypt
                    libxcrypt-compat
                    libxcursor
                    libxcvt
                    libxdamage
                    libxdmcp
                    libxext
                    libxfixes
                    libxfont2
                    libxft
                    libxi
                    libxinerama
                    libxkbcommon
                    libxkbcommon-x11
                    libxkbfile
                    libxml2
                    libxmlb
                    libxmu
                    libxpm
                    libxrandr
                    libxrender
                    libxres
                    libxshmfence
                    libxslt
                    libxss
                    libxt
                    libxtst
                    libxv
                    libxxf86vm
                    libyaml
                    libzip
                    licenses
                    lilv
                    linux-api-headers
                    llvm-libs
                    lm_sensors
                    lmdb
                    lsb-release
                    lsof
                    lua
                    luajit
                    luit
                    lv2
                    lz4
                    lzo
                    makedumpfile
                    maliit-framework
                    maliit-keyboard
                    mandoc
                    mangohud
                    md4c
                    mdadm
                    media-player-info
                    steamfork/mesa
                    mesa-utils
                    milou
                    minizip
                    mkinitcpio
                    mkinitcpio-busybox
                    mobile-broadband-provider-info
                    modemmanager
                    mpfr
                    mpg123
                    mtdev
                    nano
                    ncdu
                    ncurses
                    netavark
                    nethogs
                    nettle
                    networkmanager
                    networkmanager-openvpn
                    nfs-utils
                    nfsidmap
                    nftables
                    noise-suppression-for-voice
                    noto-fonts
                    noto-fonts-cjk
                    npth
                    nspr
                    nss
                    nss-mdns
                    ntfs-3g
                    numactl
                    nvme-cli
                    ocl-icd
                    okular
                    oniguruma
                    openal
                    opencore-amr
                    openexr
                    openjpeg2
                    openssh
                    openssl
                    openvpn
                    opus
                    orc
                    ostree
                    oxygen
                    oxygen-sounds
                    p11-kit
                    p7zip
                    p8-platform
                    pacman
                    pacman-mirrorlist
                    pam
                    pambase
                    pango
                    pangomm
                    parted
                    partitionmanager
                    paru
                    pavucontrol
                    pciutils
                    pcre
                    pcre2
                    pcsclite
                    perf
                    perl
                    perl-error
                    perl-mailtools
                    perl-timedate
                    phonon-qt5
                    phonon-qt5-gstreamer
                    pinentry
                    pipewire
                    pipewire-alsa
                    pipewire-audio
                    pipewire-jack
                    pipewire-pulse
                    pixman
                    pkcs11-helper
                    plasma-browser-integration
                    plasma-desktop
                    plasma-disks
                    plasma-firewall
                    plasma-integration
                    plasma-meta
                    plasma-nm
                    plasma-pa
                    plasma-remotecontrollers
                    plasma-systemmonitor
                    plasma-thunderbolt
                    plasma-vault
                    plasma-wayland-protocols
                    plasma-wayland-session
                    plasma-welcome
                    plasma-workspace
                    plasma-workspace-wallpapers
                    podman
                    polkit
                    polkit-kde-agent
                    polkit-qt5
                    poppler
                    poppler-data
                    poppler-qt5
                    popt
                    portaudio
                    powerbuttond
                    powerdevil
                    powertop
                    ppp
                    procps-ng
                    protobuf
                    protobuf-c
                    psmisc
                    pulseaudio-qt
                    python
                    python-aiohttp
                    python-aiosignal
                    python-anyio
                    python-async-timeout
                    python-attrs
                    python-capng
                    python-certifi
                    python-chardet
                    python-charset-normalizer
                    python-click
                    python-crcmod
                    python-dbus-next
                    python-distro
                    python-evdev
                    python-frozenlist
                    python-gobject
                    python-h11
                    python-hid
                    python-httpcore
                    python-httpx
                    python-idna
                    python-multidict
                    python-progressbar
                    python-protobuf
                    python-psutil
                    python-pyalsa
                    python-pyaml
                    python-pyelftools
                    python-pyenchant
                    python-pyinotify
                    python-semantic-version
                    python-sniffio
                    python-systemd
                    python-sysv_ipc
                    python-typing_extensions
                    python-utils
                    python-yaml
                    python-yarl
                    pyzy
                    qca-qt5
                    qrencode
                    qt5-base
                    qt5-declarative
                    qt5-feedback
                    qt5-graphicaleffects
                    qt5-location
                    qt5-multimedia
                    qt5-quickcontrols
                    qt5-quickcontrols2
                    qt5-sensors
                    qt5-speech
                    qt5-svg
                    qt5-tools
                    qt5-translations
                    qt5-wayland
                    qt5-webchannel
                    qt5-webengine
                    qt5-webview
                    qt5-x11extras
                    rauc
                    rav1e
                    re2
                    readline
                    renderdoc-minimal
                    ripgrep
                    rpcbind
                    rsync
                    rtkit
                    rxvt-unicode-terminfo
                    sbc
                    sddm-wayland
                    sdl2
                    seatd
                    sed
                    serd
                    shadow
                    shared-mime-info
                    signon-plugin-oauth2
                    signon-ui
                    signond
                    slang
                    slirp4netns
                    smartmontools
                    smbclient
                    snappy
                    socat
                    sof-firmware
                    sord
                    sound-theme-freedesktop
                    source-highlight
                    spectacle
                    speex
                    speexdsp
                    sqlite
                    squashfs-tools
                    sratom
                    srt
                    sshfs
                    steam-im-modules
                    steam-jupiter-stable
                    steam_notif_daemon
                    steamdeck-dsp
                    steamdeck-kde-presets
		    steamos-atomupd-client
                    steamos-devkit-service
                    steamos-efi
                    steamos-log-submitter
                    steamos-manager
                    steamos-networking-tools
		    steamos-reset
                    steamos-systemreport
                    steamos-tweak-mtu-probing
                    strace
                    sudo
                    svt-av1
		    swh-plugins
                    systemd
                    systemd-libs
                    systemd-sysvcompat
                    systemsettings
                    taglib
                    talloc
                    tar
                    tcl
                    tdb
                    tevent
                    tk
                    tmux
                    tpm2-tss
                    trace-cmd
                    tracker3
                    tree
                    tslib
                    ttf-dejavu
                    ttf-hack
                    ttf-twemoji-default
                    tzdata
                    udisks2
                    unrar
                    unzip
                    upower
                    usbhid-gadget-passthru
                    usbutils
                    util-linux
                    util-linux-libs
                    v4l-utils
                    vid.stab
                    vim
                    vim-runtime
                    vkmark-git
                    vmaf
                    volume_key
                    vulkan-icd-loader
                    steamfork/vulkan-radeon
		    steamfork/vulkan-virtio
                    vulkan-tools
                    steamfork/vulkan-mesa-layers
                    wayland
                    wayland-utils
                    webrtc-audio-processing
                    wget
                    which
                    wireguard-tools
                    wireless-regdb
                    wireless_tools
                    wireplumber
                    wpa_supplicant
                    x264
                    x265
                    xbindkeys
                    xbitmaps
                    xcb-proto
                    xcb-util
                    xcb-util-cursor
                    xcb-util-errors
                    xcb-util-image
                    xcb-util-keysyms
                    xcb-util-renderutil
                    xcb-util-wm
                    xdg-dbus-proxy
                    xdg-desktop-portal
                    xdg-desktop-portal-kde
                    xdg-user-dirs
                    xdg-utils
                    xdotool
                    xf86-input-libinput
                    xf86-video-amdgpu
                    xkeyboard-config
                    xorg-fonts-encodings
                    xorg-server
                    xorg-server-common
                    xorg-setxkbmap
                    xorg-xauth
                    xorg-xdpyinfo
                    xorg-xhost
                    xorg-xkbcomp
                    xorg-xmessage
                    xorg-xprop
                    xorg-xrandr
                    xorg-xrdb
                    xorg-xset
                    xorg-xsetroot
                    xorg-xwininfo
                    xorgproto
                    xterm
                    xvidcore
                    xxhash
                    xz
                    yajl
                    zeromq
                    zimg
                    zip
                    zlib
                    zsh
                    zstd
                    zxing-cpp"

### Do not add:
# attica
# baloo
# baloo-widgets
# bash-bats
# bluez-qt
# breeze-grub
# breeze-gtk
# frameworkintegration
# grub
# jupiter-fan-control
# kactivities
# kactivities-stats
# karchive
# kauth
# kbookmarks
# kcmutils
# kcodecs
# kcolorpicker
# kcompletion
# kconfig
# kconfigwidgets
# kcontacts
# kcoreaddons
# kcrash
# kdbusaddons
# kdeclarative
# kded
# kdesu
# kdnssd
# kdumpst
# kfilemetadata
# kgamma5
# kglobalaccel
# kguiaddons
# kholidays
# ki18n
# kiconthemes
# kidletime
# kimageannotator
# kio
# kio-extras
# kio-fuse
# kirigami-addons
# kitemmodels
# kitemviews
# kjobwidgets
# knewstuff
# knotifications
# knotifyconfig
# kpackage
# kparts
# kpeople
# kpeoplevcard
# kpty
# kquickcharts
# krunner
# kservice
# ktexteditor
# ktextwidgets
# kunitconversion
# kuserfeedback
# kwallet
# kwallet-pam
# kwayland
# kwayland-integration
# kwidgetsaddons
# kwindowsystem
# kxmlgui
# libkdcraw
# libva-intel-driver
# linux-firmware-neptune
# linux-firmware-neptune-whence
# linux-neptune-61
# modemmanager-qt
# networkmanager-qt
# plasma-framework
# prison
# purpose
# qqc2-desktop-style
# sddm-kcm
# signon-kwallet-extension
# solid
# sonnet
# steamos-customizations-jupiter
# steamos-kdumpst-layer
# syndication
# syntax-highlighting
# systemd-swap
# threadweaver
# vpower
# xorg-xwayland-jupiter
# zenity-light

# packagekit-qt5

export UI_BOOTSTRAP="${STEAMOS_PKGS}
                  bc
                  ectool
                  hunspell-en_us
		  inputplumber
                  kdegraphics-thumbnailers
                  kwrite
		  steamfork/lib32-vulkan-intel
		  steamfork/lib32-vulkan-swrast
		  steamfork/lib32-vulkan-nouveau
                  libcap.so
                  libdisplay-info.so
                  libliftoff.so
                  libpipewire
                  libva-utils
                  libxkbcommon.so
                  openvr
                  pipewire-v4l2
                  pkgconf
                  plymouth
                  print-manager
                  python-build
                  python-installer
                  python-setuptools
                  python-wheel
                  ryzenadj
		  steam-powerbuttond
                  steamfork-customizations
                  steamfork-device-support
		  steamfork-keyring
                  vlc
		  steamfork/vulkan-intel
		  steamfork/vulkan-swrast
		  steamfork/vulkan-nouveau
                  wlroots
                  wlr-randr
                  xorg-xwayland
                  zenity"
export POSTCOPY_BIN_EXECUTION=""

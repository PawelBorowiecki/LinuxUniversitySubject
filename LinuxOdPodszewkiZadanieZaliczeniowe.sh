#!/bin/bash

patchDirectory="/root/patches"
tempPatchDirectory="/root/tempPatches"
mkdir -p "$patchDirectory"
mkdir -p "$tempPatchDirectory"

if [[ -f /etc/slackpkg/slackpkgplus.conf ]]; then
    mv /etc/slackpkg/slackpkgplus.conf /etc/slackpkg/slackpkgplus.conf.bak
fi

echo "TEMP=$tempPatchDirectory" >> "/etc/slackpkg/slackpkg.conf"
echo "DELALL=off" >> "/etc/slackpkg/slackpkg.conf"
echo "DIALOG=off" >> "/etc/slackpkg/slackpkg.conf"
echo "BATCH=on" >> "/etc/slackpkg/slackpkg.conf"
echo "DEFAULT_ANSWER=y" >> "/etc/slackpkg/slackpkg.conf"
echo "CHECKMD5=off" >> "/etc/slackpkg/slackpkg.conf"
echo "CHECKGPG=off" >> "/etc/slackpkg/slackpkg.conf"
echo 'WGETFLAGS="--passive-ftp --no-check-certificate"' >> /etc/slackpkg/slackpkg.conf
echo "PRIORITY=( patches )" >> "/etc/slackpkg/slackpkg.conf"
echo "kernel-*" >> "/etc/slackpkg/blacklist"
echo "kernel-firmware.*" >> "/etc/slackpkg/blacklist"

slackpkg update gpg 2>/dev/null
slackpkg update 2>/dev/null
slackpkg upgrade-all 2>/dev/null

find "$tempPatchDirectory"/patches/packages/ -type f -name "*.t?z" -exec cp -f {} "$patchDirectory/" \; 2>/dev/null

sync
ldconfig

ln -sf /usr/share/zoneinfo/Europe/Warsaw /etc/localtime

if id "guest" 2>/dev/null; then
    userdel -r guest
else
    echo "Uzytkownik guest nie istnial w systemie"
fi

myUser="pawel"
myPassword="Rownoleglosc#Javie26"

if ! id "$myUser" 2>/dev/null; then
    useradd -m -s /bin/bash "$myUser"
    echo "${myUser}:${myPassword}" | chpasswd
    echo "Dodano uzytkownika: $myUser"
else
    echo "Uzytkownik $myUser juz istnieje."
fi

find /usr/share/applications/ -name "*chrome*" -o -name "*chromium*" 2>/dev/null | xargs rm -f 2>/dev/null || true
find /usr/share/pixmaps/ -name "*chrome*" -o -name "*chromium*" 2>/dev/null | xargs rm -f 2>/dev/null || true

if [[ -f /usr/bin/update-fluxbox-menu ]]; then
    update-fluxbox-menu || true
fi

sed -i '/[Cc]hrome/Id' "/etc/xlunch/entries.tsv" 2>/dev/null || true
for file in /etc/xlunch/extra.d/*.tsv /usr/share/xlunch/*.tsv; do
    if [[ -f "$file" ]]; then
        sed -i '/[Cc]hrome/Id' "$file"
    fi
done

baseUrl="https://mirrors.kernel.org/slackware/slackware64-15.0/slackware64/"
listD=$(wget -qO- --no-check-certificate "${baseUrl}/d/")
listL=$(wget -qO- --no-check-certificate "${baseUrl}/l/")
listX=$(wget -qO- --no-check-certificate "${baseUrl}/x/")

slackpkg -batch=on -default_answer=y download mozilla-firefox mozilla-nss mozilla-nspr sqlite icu4c 2>/dev/null
slackpkg -batch=on -default_answer=y install mozilla-firefox mozilla-nss mozilla-nspr sqlite icu4c 2>/dev/null

find /var/cache/packages/ -type f \( -name "*mozilla-firefox*.t?z" -o -name "*mozilla-nss*.t?z" -o -name "*mozilla-nspr*.t?z" -o -name "*sqlite*.t?z" -o -name "*icu4c*.t?z" \) -exec cp {} "$patchDirectory/" \; 2>/dev/null

wget --no-check-certificate -N -P "$patchDirectory/" "${baseUrl}/l/icu4c-69.1-x86_64-1.txz"

if [[ $(find "$patchDirectory" -maxdepth 1 -name "*mozilla-firefox*.t?z") ]]; then
    upgradepkg --install-new --reinstall "$patchDirectory"/mozilla-*.t?z "$patchDirectory"/sqlite*.t?z "$patchDirectory"/icu4c*.t?z 2>/dev/null
    ldconfig
else
    slackpkg -batch=on -default_answer=y install mozilla-firefox mozilla-nss mozilla-nspr sqlite icu4c 2>/dev/null
    ldconfig
fi

sync
sleep 5
ldconfig

slaxModulesDirectory="/run/initramfs/memory/data/slax/modules"
physicalUsbDirectory="/run/initramfs/memory/data/slax/modules"

cd /root

slackpkg -batch=on -default_answer=y install ca-certificates 2>/dev/null

wget --no-check-certificate -O xnedit-1.6.3.tar.gz "https://sourceforge.net/projects/xnedit/files/latest/download"

if [[ -f xnedit-1.6.3.tar.gz ]]; then
    tar -xf xnedit-1.6.3.tar.gz
else
    echo "Wystapil blad podczas pobierania XNedit."
    exit 1
fi

makePackage=$(echo "$listD" | grep -oE 'make-4.3-x86_64-3.txz' | head -n 1)
gccPackage=$(echo "$listD" | grep -oE 'gcc-[0-9a-zA-Z_\.\-]+x86_64-[0-9]+\.txz' | head -n 1)
binutilsPackage=$(echo "$listD" | grep -oE 'binutils-[0-9a-zA-Z_\.\-]+x86_64-[0-9]+\.txz' | head -n 1)
kernelHeadersPackage=$(echo "$listD" | grep -oE 'kernel-headers-[0-9a-zA-Z_\.\-]+(x86|x86_64|noarch)-[0-9]+\.txz' | head -n 1)
pkgconfigPackage=$(echo "$listD" | grep -oE 'pkg-config-[0-9a-zA-Z_\.\-]+x86_64-[0-9]+\.txz' | head -n 1)
guilePackage=$(echo "$listD" | grep -oE 'guile-[0-9a-zA-Z_\.\-]+x86_64-[0-9]+\.txz' | head -n 1)
flexPackage=$(echo "$listD" | grep -oE 'flex-[0-9a-zA-Z_\.\-]+x86_64-[0-9]+\.txz' | head -n 1)
glibcPackage=$(echo "$listL" | grep -oE 'glibc-[0-9a-zA-Z_\.\-]+x86_64-[0-9]+\.txz' | head -n 1)
gcPackage=$(echo "$listL" | grep -oE 'gc-[0-9a-zA-Z_\.\-]+x86_64-[0-9]+\.txz' | head -n 1)
freetypePackage=$(echo "$listL" | grep -oE 'freetype-[0-9a-zA-Z_\.\-]+x86_64-[0-9]+\.txz' | head -n 1)
libX11Package=$(echo "$listX" | grep -oE 'libX11-[0-9a-zA-Z_\.\-]+x86_64-[0-9]+\.txz' | head -n 1)
motifPackage=$(echo "$listX" | grep -oE 'motif-[0-9a-zA-Z_\.\-]+x86_64-[0-9]+\.txz' | head -n 1)
libXftPackage=$(echo "$listX" | grep -oE 'libXft-[0-9a-zA-Z_\.\-]+x86_64-[0-9]+\.txz' | head -n 1)
fontconfigPackage=$(echo "$listX" | grep -oE 'fontconfig-[0-9a-zA-Z_\.\-]+x86_64-[0-9]+\.txz' | head -n 1)
libXtPackage=$(echo "$listX" | grep -oE 'libXt-1.2.1-x86_64-2.txz' | head -n 1)
libICEPackage=$(echo "$listX" | grep -oE 'libICE-[0-9a-zA-Z_\.\-]+x86_64-[0-9]+\.txz' | head -n 1)
libSMPackage=$(echo "$listX" | grep -oE 'libSM-[0-9a-zA-Z_\.\-]+x86_64-[0-9]+\.txz' | head -n 1)
libXauPackage=$(echo "$listX" | grep -oE 'libXau-[0-9a-zA-Z_\.\-]+x86_64-[0-9]+\.txz' | head -n 1)
libXrenderPackage=$(echo "$listX" | grep -oE 'libXrender-[0-9a-zA-Z_\.\-]+x86_64-[0-9]+\.txz' | head -n 1)
libXpmPackage=$(echo "$listX" | grep -oE 'libXpm-[0-9a-zA-Z_\.\-]+x86_64-[0-9]+\.txz' | head -n 1)
libXmuPackage=$(echo "$listX" | grep -oE 'libXmu-[0-9a-zA-Z_\.\-]+x86_64-[0-9]+\.txz' | head -n 1)
xorgcfPackage=$(echo "$listX" | grep -oE 'xorg-cf-files-[0-9a-zA-Z_\.\-]+x86_64-[0-9]+\.txz' | head -n 1)
xorgprotoPackage=$(echo "$listX" | grep -oE 'xorgproto-[0-9a-zA-Z_\.\-]+x86_64-[0-9]+\.txz' | head -n 1)

rm -f /tmp/*.txz

wget --no-check-certificate -P /tmp/ "${baseUrl}/d/${makePackage}"
wget --no-check-certificate -P /tmp/ "${baseUrl}/d/${gccPackage}"
wget --no-check-certificate -P /tmp/ "${baseUrl}/d/${binutilsPackage}"
wget --no-check-certificate -P /tmp/ "${baseUrl}/d/${kernelHeadersPackage}"
wget --no-check-certificate -P /tmp/ "${baseUrl}/d/${pkgconfigPackage}"
wget --no-check-certificate -P /tmp/ "${baseUrl}/d/${guilePackage}"
wget --no-check-certificate -P /tmp/ "${baseUrl}/d/${flexPackage}"
wget --no-check-certificate -P /tmp/ "${baseUrl}/l/${glibcPackage}"
wget --no-check-certificate -P /tmp/ "${baseUrl}/l/${gcPackage}"
wget --no-check-certificate -P /tmp/ "${baseUrl}/l/${freetypePackage}"
wget --no-check-certificate -P /tmp/ "${baseUrl}/x/${motifPackage}"
wget --no-check-certificate -P /tmp/ "${baseUrl}/x/${libX11Package}"
wget --no-check-certificate -P /tmp/ "${baseUrl}/x/${libXtPackage}"
wget --no-check-certificate -P /tmp/ "${baseUrl}/x/${libICEPackage}"
wget --no-check-certificate -P /tmp/ "${baseUrl}/x/${libSMPackage}"
wget --no-check-certificate -P /tmp/ "${baseUrl}/x/${libXauPackage}"
wget --no-check-certificate -P /tmp/ "${baseUrl}/x/${libXrenderPackage}"
wget --no-check-certificate -P /tmp/ "${baseUrl}/x/${libXftPackage}"
wget --no-check-certificate -P /tmp/ "${baseUrl}/x/${fontconfigPackage}"
wget --no-check-certificate -P /tmp/ "${baseUrl}/x/${libXpmPackage}"
wget --no-check-certificate -P /tmp/ "${baseUrl}/x/${libXmuPackage}"
wget --no-check-certificate -P /tmp/ "${baseUrl}/x/${xorgcfPackage}"
wget --no-check-certificate -P /tmp/ "${baseUrl}/x/${xorgprotoPackage}"

filesQuantity=$(find /tmp/ -maxdepth 1 -name "*.txz" | wc -l)
if [[ "$filesQuantity" -lt 23 ]]; then
    echo "Blad! Nie udalo sie pobrac wszystkich pakietow! (Pobrano: $filesQuantity/23)"
    exit 1
fi

upgradepkg --install-new /tmp/*.txz 2>/dev/null

mkdir -p /usr/include/X11
mkdir -p /usr/include/Xm
mkdir -p /usr/include/sys

cd /

for package in /tmp/*.txz; do
    if [[ "$package" == */glibc-[0-9]* ]]; then
        tar -xf "$package" --wildcards 'usr/include/*' 2>/dev/null
    else
        tar -xf "$package" --wildcards 'usr/include/*' 2>/dev/null
        tar -xf "$package" --wildcards 'usr/lib64/*' 2>/dev/null
        tar -xf "$package" --wildcards 'lib64/*' 2>/dev/null
        tar -xf "$package" --wildcards 'usr/bin/*' 2>/dev/null
        tar -xf "$package" --wildcards 'bin/*' 2>/dev/null
    fi
done

ldconfig

cd /root/xnedit-1.6.3 || exit 1

make -e CFLAGS="-O2 -I/usr/include -I/usr/include/X11 -I/usr/include/freetype2" CCFLAGS="-O2 -I/usr/include -I/usr/include/X11 -I/usr/include/freetype2" LIBS="-L./lib_fix -lXm -lXt -lX11 -lXft -lfontconfig -lICE -lSM -lXau -lXrender -lXpm -lXmu -lguile-3.0 -lfreetype -lpthread -lm" linux

if [[ -f source/xnedit ]]; then
    echo "Kompilacja XNedit zakonczona pomyslnie."
else
    echo "Kompilacja sie nie powiodla."
    exit 1
fi

buildDirectory="/tmp/90-xnedit.sb"
mkdir -p "$buildDirectory/usr/local/bin"

foundXnedit=$(find /root/xnedit-1.6.3 -type f -name "xnedit" | head -n 1)

if [[ -n "$foundXnedit" && -f "$foundXnedit" ]]; then
    cp "$foundXnedit" "$buildDirectory/usr/local/bin/xnedit"
    chmod +x "$buildDirectory/usr/local/bin/xnedit"
else
    echo "Blad! Plik xnedit nie istnieje po kompilacji!"
    exit 1
fi

dir2sb "$buildDirectory" /root/90-xnedit.sb

if [[ -f /root/90-xnedit.sb ]]; then
    mkdir -p "$physicalUsbDirectory"
    cp /root/90-xnedit.sb "$physicalUsbDirectory/90-xnedit.sb" 2>/dev/null
    
    if [[ -f "$physicalUsbDirectory/90-xnedit.sb" ]]; then
        echo "Modul 90-xnedit.sb zostal trwale zapisany na pendrive."
    else
        echo "Blad! Nie udalo sie zapisac pliku na pendrive."
        exit 1
    fi
else
    echo "Blad! Narzedzie dir2sb nie utworzylo pliku."
    exit 1
fi

cd "$physicalUsbDirectory"
    
slax activate /root/90-xnedit.sb 2>/dev/null
    
cd /root

rm -rf /root/xnedit-1.6.3
rm -f /root/xnedit-1.6.3.tar.gz
rm -rf "$buildDirectory"
rm -f /tmp/*.txz 2>/dev/null

removepkg make gcc binutils pkg-config flex 2>/dev/null

rm -rf "$tempPatchDirectory"/* 2>/dev/null

if [[ -f /etc/slackpkg/slackpkgplus.conf.bak ]]; then
    mv /etc/slackpkg/slackpkgplus.conf.bak /etc/slackpkg/slackpkgplus.conf
fi
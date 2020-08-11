This repo is for review of requests for signing shim.  To create a request for review:

- clone this repo
- edit the template below
- add the shim.efi to be signed
- add build logs
- commit all of that
- tag it with a tag of the form "myorg-shim-arch-YYYYMMDD"
- push that to github
- file an issue at https://github.com/rhboot/shim-review/issues with a link to your tag

Note that we really only have experience with using grub2 on Linux, so asking
us to endorse anything else for signing is going to require some convincing on
your part.

Here's the template:

-------------------------------------------------------------------------------
What organization or people are asking to have this signed:
-------------------------------------------------------------------------------
Atrust Computer Corp.
http://www.atrustcorp.com/index.php

-------------------------------------------------------------------------------
What product or service is this for:
-------------------------------------------------------------------------------
P2T USB
(http://www.atrustcorp.com/product/index/path/141_143/id/130/language/en_us.html#ad-image-0)

-------------------------------------------------------------------------------
What's the justification that this really does need to be signed for the whole world to be able to boot it:
-------------------------------------------------------------------------------
Atrust would like P2T USB to be bootable on any device without disabling SecureBoot.

-------------------------------------------------------------------------------
Who is the primary contact for security updates, etc.
-------------------------------------------------------------------------------
- Name: Jason Chang
- Position: engineer
- Email address: jason.chang@atrustcorp.com
- PGP key: n/a

-------------------------------------------------------------------------------
Who is the secondary contact for security updates, etc.
-------------------------------------------------------------------------------
- Name: Alfred Liu
- Position: technical manager
- Email address: alfred.liu@atrustcorp.com
- PGP key: n/a

-------------------------------------------------------------------------------
What upstream shim tag is this starting from:
-------------------------------------------------------------------------------
15 + commits up to a4a1fbe with added patches 
(snapshot form ubuntu shim: https://code.launchpad.net/~ubuntu-core-dev/shim/+git/shim/+ref/master)

-------------------------------------------------------------------------------
URL for a repo that contains the exact code which was built to get this binary:
-------------------------------------------------------------------------------
https://github.com/alfred-liu-atrust/shim

-------------------------------------------------------------------------------
What patches are being applied and why:
-------------------------------------------------------------------------------
  * d/p/Fix-OBJ_create-to-tolerate-a-NULL-sn-and-ln.patch: Fix NULL
    pointer dereference when calling OBJ_create() that leads to an
    exception error on arm64. (LP: #1811901)
  * debian/patches/MokManager-avoid-unaligned.patch: Fix compilation with GCC9:
    avoid -Werror=address-of-packed-member errors in MokManager.
  * debian/patches/tpm-correctness-1.patch,
    debian/patches/tpm-correctness-2.patch: fix issues in TPM calls to ensure
    the measurements are consistent with what is entered in the TPM event log.
  * debian/patches/tpm-correctness-3.patch: Don't log duplicate identical
    TPM events.
  * debian/patches/MokManager-hidpi-support.patch: Do a little bit more to
    try to get a more usable screen resolution for MokManager when running on
    HiDPI screens; by trying to detect such cases and switching to mode 0.
  * d/patches/fix-path-checks.patch: Cherry-pick upstream fix for regression
    in loading fwupd, or anything else specified as an argument (LP: #1864223)

-------------------------------------------------------------------------------
What OS and toolchain must we use to reproduce this build?  Include where to find it, etc.  We're going to try to reproduce your build as close as possible to verify that it's really a build of the source tree you tell us it is, so these need to be fairly thorough. At the very least include the specific versions of gcc, binutils, and gnu-efi which were used, and where to find those binaries.
-------------------------------------------------------------------------------
Ubuntu 20.04
binutils 2.34-6ubuntu1
gcc-9 9.3.0-10ubuntu2
gnu-efi 3.0.9-1
libc6-dev 2.31-0ubuntu9

To build:

Use included Dockerfile;

-------------------------------------------------------------------------------
Which files in this repo are the logs for your build?   This should include logs for creating the buildroots, applying patches, doing the build, creating the archives, etc.
-------------------------------------------------------------------------------
buildlog_shim_15+1552672080.a4a1fbe-0ubuntu2_amd64_BUILDING.txt

-------------------------------------------------------------------------------
Put info about what bootloader you're using, including which patches it includes to enforce Secure Boot here:
-------------------------------------------------------------------------------
based on grub2 2.04-1ubuntu26.2
https://github.com/alfred-liu-atrust/grub-2.04/tree/focal

-------------------------------------------------------------------------------
Put info about what kernel you're using, including which patches it includes to enforce Secure Boot here:
-------------------------------------------------------------------------------
linux 5.4.0


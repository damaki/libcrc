This directory contains a dummy crate that has a GNATprove dependency for
running SPARK proofs on libcrc.

To prove libcrc with GNATprove, run the following command in this directory:
```sh
alr exec -- gnatprove -P ../libcrc.gpr -j0
```

Alire will handle the setup of GNATprove, if necessary.
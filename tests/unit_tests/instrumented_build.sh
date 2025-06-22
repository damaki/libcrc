#!/bin/bash

# Stop on first failure
set -e

# Echo commands as they are executed
set -x

project_files=("unit_tests.gpr")

abs_project_files=$(realpath ${project_files[@]})

for proj_file in $abs_project_files
do
    alr exec -- gnatcov instrument \
        -P "$proj_file" \
        --level=stmt+mcdc \
        --dump-trigger=atexit \
        --projects libcrc.gpr
done

alr build -- --src-subdirs=gnatcov-instr --implicit-with=gnatcov_rts_full
#!/bin/bash

# Stop on first failure
set -e

# Echo commands as they are executed
set -x

srctraces_dir=srctraces/
unit_tests_exe=$(realpath "bin/run_unit_tests")

# Delete any old srctrace files
if [ -d $srctraces_dir ]
then
    rm -r $srctraces_dir
fi

# Change the CWD so that the .srctrace files are output here
mkdir -p $srctraces_dir
cd $srctraces_dir

# Run the unit tests
$unit_tests_exe

cd ..

# Generate a listing file of all srctraces
find . -type f -name "*.srctrace" > srctraces_list.txt

# Generate the coverage reports
alr gnatcov coverage --annotate=html+ --output-dir=coverage_html --level=stmt+mcdc --projects libcrc.gpr @srctraces_list.txt
alr gnatcov coverage --annotate=xcov+ --output-dir=coverage_xcov --level=stmt+mcdc --projects libcrc.gpr @srctraces_list.txt
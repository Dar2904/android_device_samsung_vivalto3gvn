#!/usr/bin/python
#
# Copyright (C) 2009 Google Inc. All rights reserved.
# [License details remain unchanged]

# Usage: rule_bison.py INPUT_FILE OUTPUT_DIR [BISON_EXE]
# INPUT_FILE should be either CSSGrammar.y or XPathGrammar.y
# OUTPUT_DIR is where the generated .cpp and .h files will be placed

import errno
import os
import os.path
import subprocess
import sys

# Validate arguments
assert len(sys.argv) == 3 or len(sys.argv) == 4

inputFile = sys.argv[1]
outputDir = sys.argv[2]
bisonExe = 'bison'
if len(sys.argv) > 3:
    bisonExe = sys.argv[3]

inputName = os.path.basename(inputFile)
assert inputName == 'CSSGrammar.y' or inputName == 'XPathGrammar.y'
prefix = {'CSSGrammar.y': 'cssyy', 'XPathGrammar.y': 'xpathyy'}[inputName]

(inputRoot, inputExt) = os.path.splitext(inputName)

# Possible names of the generated header file (varies by Bison version)
outputHTries = [
    os.path.join(outputDir, inputRoot + '.cpp.h'),
    os.path.join(outputDir, inputRoot + '.hpp'),
    os.path.join(outputDir, inputRoot + '.h'),
]

# Remove existing header files if they exist
for outputHTry in outputHTries:
    try:
        os.unlink(outputHTry)
    except OSError as e:
        if e.errno != errno.ENOENT:
            raise

outputCpp = os.path.join(outputDir, inputRoot + '.cpp')

# Run Bison to generate the parser files
returnCode = subprocess.call([bisonExe, '-d', '-p', prefix, inputFile, '-o', outputCpp])
assert returnCode == 0

# Locate the generated header file
outputHTmp = None
for outputHTry in outputHTries:
    try:
        os.stat(outputHTry)
        outputHTmp = outputHTry
        break
    except OSError as e:
        if e.errno != errno.ENOENT:
            raise

assert outputHTmp is not None

# Read the content of the generated header
with open(outputHTmp, 'r') as f:
    outputHContents = f.read()

# Rewrite the header file with include guards
outputH = os.path.join(outputDir, inputRoot + '.h')
outputHFile = open(outputH, 'w')
print >>outputHFile, '#ifndef %sH' % inputRoot
print >>outputHFile, '#define %sH' % inputRoot
print >>outputHFile, outputHContents
print >>outputHFile, '#endif'
outputHFile.close()

# Also create a .hpp copy for compatibility
outputHPP = os.path.join(outputDir, inputRoot + '.hpp')
outputHPPFile = open(outputHPP, 'w')
print >>outputHPPFile, '#ifndef %sHPP' % inputRoot
print >>outputHPPFile, '#define %sHPP' % inputRoot
print >>outputHPPFile, outputHContents
print >>outputHPPFile, '#endif'
outputHPPFile.close()

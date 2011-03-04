# ToolName development environment script
# 
# Source this file into your interactive shell using for development:
# 
#     . Developer.sh
# 
# Or, with an equivalent command:
# 
#     source Developer.sh
# 
# You can now use installed commands on the stage, as well as the commands used
# for building ToolName
#
# Author: Jaeho Shin <netj@ropas.snu.ac.kr>
# Generated: 2010-11-15

# Remember where root of the source tree was
export TOOLNAME_SRCROOT=$PWD

# PATH for testing and building
export PATH="$TOOLNAME_SRCROOT/.stage/bin:$TOOLNAME_SRCROOT/buildkit:$PATH"

# convenience command for invoking make from anywhere
m() { (cd "$TOOLNAME_SRCROOT" && make "$@"); }

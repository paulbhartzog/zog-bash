# begin .bashrc

# ================================================================ #
# [Author]      Paul B. Hartzog <PaulBHartzog@PaulBHartzog.org>
# [Year]        2016
# [File]        .bashrc
# [Usage]       $HOME/.bashrc for bash-3.0 (or later)
# [Source]      https://github.com/paulbhartzog/zog-bash
# [Created]     Tue Oct 11 EDT 2016
# [Modified]    Thu Oct 13 EDT 2016
# [Version]     1.0.0
# [License]     MIT License https://opensource.org/licenses/MIT
#
# Feel free to modify this to suit your needs.
#
# ================================================================ #

# alias res(et) to clear terminal and reload ~/.bash_profile
# ~/.bash_profile sources .bashrc automagically
alias res="clear; source $HOME/.bash_profile"

# alias ls to show colors (on mac ls is BSD version of ls, so -G)
alias ls="ls -G"

# alias rm for safety
alias rm="rm -i"

# end .bashrc

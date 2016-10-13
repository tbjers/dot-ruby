#!/usr/bin/env bash
#
# tbjers/dot-ruby ellipsis package

pkg.install() {
  case $(os.platform) in
    osx)
      ;;
    linux)
      if [[ -d $HOME/.rbenv ]]; then
        git.clone https://github.com/rbenv/rbenv.git $HOME/.rbenv
        git.clone https://github.com/rbenv/ruby-build.git $HOME/.rbenv/plugins/ruby-build
      else
        cd $HOME/.rbenv
        git pull
        cd $PKG_PATH
      fi
      ;;
  esac
}

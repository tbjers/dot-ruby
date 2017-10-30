#!/usr/bin/env bash
#
# tbjers/dot-ruby ellipsis package

pkg.install() {
  case $(os.platform) in
    osx)
      if utils.cmd_exists brew; then
        if utils.cmd_exists rbenv; then
          brew unlink ruby-build
        fi
        brew install rbenv ruby-build
      else
        echo "Cannot install rbenv because Homebrew is not installed."
      fi
      ;;
    linux)
      if [[ ! -d $HOME/.rbenv ]]; then
        git clone https://github.com/rbenv/rbenv.git $HOME/.rbenv
        git clone https://github.com/rbenv/ruby-build.git $HOME/.rbenv/plugins/ruby-build
      else
        cd $HOME/.rbenv
        git pull
        cd $PKG_PATH
      fi
      if utils.cmd_exists apt-get; then
        sudo apt-get install -y libssl-dev libreadline-dev zlib1g-dev
      fi
      ;;
  esac
}

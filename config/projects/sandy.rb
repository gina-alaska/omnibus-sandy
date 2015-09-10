#
# Copyright 2015 YOUR NAME
#
# All Rights Reserved.
#

name "sandy"
maintainer "UAF-GINA"
homepage "http://gina.alaska.edu"

# Defaults to C:/sandy on Windows
# and /opt/sandy on all other platforms
install_dir "#{default_root}/#{name}"

build_version do
  source :git, from_dependency: 'sandy'
  output_format :semver
end
build_iteration 1

override :postgresql, version: '9.3.5'
override :ruby, version: "2.2.0"
override :rubygems, version: "2.4.5"
override :bundler, version: '1.10.5'

# Creates required build directories
dependency "preparation"

# sandy dependencies/components
# dependency "somedep"
dependency 'ruby'
dependency 'bundler'
dependency 'postgresql'
dependency 'sandy'

# Version manifest file
dependency "version-manifest"

exclude "**/.git"
exclude "**/bundler/git"

#
# Copyright 2015 YOUR NAME
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# These options are required for all software definitions
name "sandy"
default_version "master"

dependency 'ruby'
dependency 'bundler'
dependency 'postgresql'

# Sources may be URLs, git locations, or path locations
source git: "https://github.com/gina-alaska/sandy-rails"

build do
  # Setup a default environment from Omnibus - you should use this Omnibus
  # helper everywhere. It will become the default in the future.
  env = with_standard_compiler_flags(with_embedded_path)

  bundle "install --jobs #{workers} --retry 3 --without development --path=vendor/bundle", env: env

  bundle 'exec rake assets:precompile', env: env.merge('RAILS_ENV' => 'production')
  sync project_dir, "#{install_dir}/embedded/service/sandy"
  delete "#{install_dir}/embedded/service/log"
  delete "#{install_dir}/embedded/service/tmp"
end

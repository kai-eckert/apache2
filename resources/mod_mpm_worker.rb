#
# Cookbook:: apache2
# Resource:: apache2_mod_mpm_worker
#
# Copyright:: 2008-2017, Chef Software, Inc.
# Copyright:: 2018, Webb Agile Solutions Ltd.
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
property :startservers, Integer,
         default: 4,
         description: 'initial number of server processes to start'

property :minsparethreads, Integer,
         default: 64,
         description: 'minimum number of worker threads which are kept spare'

property :maxsparethreads, Integer,
         default: 192,
         description: 'maximum number of worker threads which are kept spare'

property :threadsperchild, Integer,
         default: 64,
         description: 'constant number of worker threads in each server process'

property :maxrequestworkers, Integer,
         default: 1024,
         description: 'maximum number of threads'

property :maxconnectionsperchild, Integer,
         default: 0,
         description: 'maximum number of requests a server process serves'

property :threadlimit, Integer,
         default: 192,
         description: 'ThreadsPerChild can be changed to this maximum value during a graceful restart. ThreadLimit can only be changed by stopping and starting Apache.'

property :serverlimit, Integer,
         default: 16,
         description: ''

action :create do
  template ::File.join(apache_dir, 'mods-available', 'mpm_worker.conf') do
    source 'mods/mpm_worker.conf.erb'
    cookbook 'apache2'
    variables(
      startservers: new_resource.startservers,
      minsparethreads: new_resource.minsparethreads,
      maxsparethreads: new_resource.maxsparethreads,
      threadsperchild: new_resource.threadsperchild,
      maxrequestworkers: new_resource.maxrequestworkers,
      maxconnectionsperchild: new_resource.maxconnectionsperchild,
      threadlimit: new_resource.threadlimit,
      serverlimit: new_resource.serverlimit
    )
  end
end

action_class do
  include Apache2::Cookbook::Helpers
end

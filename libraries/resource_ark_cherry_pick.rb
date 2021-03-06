#
# Cookbook Name:: ark
# Resource:: ArkCherryPick
#
# Author:: Bryan W. Berry <bryan.berry@gmail.com>
# Copyright 2012, Bryan W. Berry
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

require 'chef/resource'
require File.expand_path('resource_ark.rb',      File.dirname(__FILE__))

class Chef
  class Resource
    class ArkCherryPick < Chef::Resource::ArkBase

      def initialize(name, run_context=nil)
        super
        @pick = name
        @resource_name = :ark_cherry_pick
        @provider = Chef::Provider::ArkCherryPick
      end

      undef append_env_path
      undef has_binaries
      
      def pick(arg=nil)
        set_or_return(
                      :pick,
                      arg,
                      :kind_of => String)
      end
      
    end
  end
end


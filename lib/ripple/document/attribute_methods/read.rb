# Copyright 2010 Sean Cribbs, Sonian Inc., and Basho Technologies, Inc.
#
#    Licensed under the Apache License, Version 2.0 (the "License");
#    you may not use this file except in compliance with the License.
#    You may obtain a copy of the License at
#
#        http://www.apache.org/licenses/LICENSE-2.0
#
#    Unless required by applicable law or agreed to in writing, software
#    distributed under the License is distributed on an "AS IS" BASIS,
#    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#    See the License for the specific language governing permissions and
#    limitations under the License.
require 'ripple'

module Ripple
  module Document
    module AttributeMethods
      module Read
        extend ActiveSupport::Concern

        included do
          attribute_method_suffix ""
        end

        private
        def attribute(attr_name)
          if @attributes.include?(attr_name)
            value = @attributes[attr_name]
            value.duplicable? ? value.clone : value
          else
            nil
          end
        end
      end
    end
  end
end

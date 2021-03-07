#
# ronin-exploits - A Ruby library for ronin-rb that provides exploitation and
# payload crafting functionality.
#
# Copyright (c) 2007-2013 Hal Brodigan (postmodern.mod3 at gmail.com)
#
# This file is part of ronin-exploits.
#
# ronin-exploits is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# ronin-exploits is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with ronin-exploits.  If not, see <https://www.gnu.org/licenses/>
#

require 'ronin/payloads/payload'
require 'ronin/payloads/helpers/rpc'

module Ronin
  module Payloads
    #
    # A generic payload for interacting with deployed Ronin RPC payloads.
    #
    #     require 'ronin/payloads/rpc'
    #     
    #     rpc = Ronin::Payloads::RPC.new
    #     rpc.transport = :http
    #     rpc.host = 'victim.com'
    #     rpc.port = 1337
    #     
    #     rpc.build!
    #     rpc.deploy!
    #     
    #     rpc.process.getuid
    #     # => 1000
    #
    # 
    class RPC < Payload

      #
      # Creates a new RPC payload.
      #
      # @param [Hash] attributes
      #   Attributes for the payload.
      #
      def initialize(attributes={})
        super(attributes)

        helper :rpc
      end

    end
  end
end

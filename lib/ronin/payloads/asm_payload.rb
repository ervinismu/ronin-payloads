#
# Ronin Exploits - A Ruby library for Ronin that provides exploitation and
# payload crafting functionality.
#
# Copyright (c) 2007-2012 Hal Brodigan (postmodern.mod3 at gmail.com)
#
# This file is part of Ronin Exploits.
#
# Ronin is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# Ronin is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with Ronin.  If not, see <http://www.gnu.org/licenses/>
#

require 'ronin/payloads/binary_payload'
require 'ronin/asm/program'

module Ronin
  module Payloads
    #
    # A {Payload} class that represents payloads written in Assembly (ASM).
    #
    class ASMPayload < BinaryPayload

      protected

      #
      # Creates an ASM Program.
      #
      # @yield []
      #   The given block represents the instructions of the ASM Program.
      #
      # @param [Hash] options
      #   Options for {Code::ASM::Program#initialize} and
      #   {Code::ASM::Program#assemble}.
      #
      # @option options [Symbol, String] :arch (self.arch.name)
      #   The architecture for the ASM Program.
      #
      # @option options [Symbol, String] :os (self.os.name)
      #   The Operating System for the ASM Program.
      #
      # @return [String]
      #   The assembled program.
      #
      # @raise [Script::BuildFailed]
      #   An Arch must be targeted for the Assembly payload.
      #
      # @see Code::ASM::Program#initialize
      # @see Code::ASM::Program#assemble
      #
      def assemble(options={},&block)
        unless self.arch
          build_failed! "Must target an Arch for Assembly payload"
        end

        program_options = {:arch => self.arch.name.to_sym}

        if self.os
          program_options[:os] = self.os.name.to_sym
        end

        return Code::ASM::Program.new(program_options,&block).assemble(options)
      end

    end
  end
end

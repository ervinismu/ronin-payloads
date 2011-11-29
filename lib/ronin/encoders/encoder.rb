#
# Ronin Exploits - A Ruby library for Ronin that provides exploitation and
# payload crafting functionality.
#
# Copyright (c) 2007-2011 Hal Brodigan (postmodern.mod3 at gmail.com)
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

require 'ronin/model/targets_arch'
require 'ronin/model/targets_os'
require 'ronin/script'

module Ronin
  module Encoders
    class Encoder

      include Script
      include Model::TargetsArch
      include Model::TargetsOS

      # Primary key of the payload
      property :id, Serial

      #
      # Default method which will encode data.
      #
      # @param [String] data
      #   The data to be encoded.
      #
      # @return [String]
      #   The encoded data.
      #
      # @since 1.0.0
      #
      def encode(data)
        data
      end

      #
      # Runs the encoder.
      #
      # @see #encode
      #
      # @since 1.0.0
      #
      def run(data)
        print_info "Encoding #{data.inspect}"

        result = encode(data)

        print_info "Encoded #{result.inspect}"
        return result
      end

      #
      # Converts the encoder to a String.
      #
      # @return [String]
      #   The name of the payload encoder.
      #
      # @since 1.0.0
      #
      def to_s
        self.name.to_s
      end

      #
      # Inspects the contents of the payload encoder.
      #
      # @return [String]
      #   The inspected encoder.
      #
      # @since 1.0.0
      #
      def inspect
        str = "#{self.class}: #{self}"
        str << " #{self.params.inspect}" unless self.params.empty?

        return "#<#{str}>"
      end

    end
  end
end
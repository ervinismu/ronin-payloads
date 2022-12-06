# frozen_string_literal: true
#
# ronin-payloads - A Ruby micro-framework for writing and running exploit
# payloads.
#
# Copyright (c) 2007-2022 Hal Brodigan (postmodern.mod3 at gmail.com)
#
# ronin-payloads is free software: you can redistribute it and/or modify
# it under the terms of the GNU Lesser General Public License as published
# by the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# ronin-payloads is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public License
# along with ronin-payloads.  If not, see <https://www.gnu.org/licenses/>.
#

require 'ronin/core/cli/ruby_shell'

module Ronin
  module Payloads
    class CLI
      #
      # The interactive Ruby shell for {Ronin::Payloads} or a payload class.
      #
      class RubyShell < Core::CLI::RubyShell

        #
        # Initializes the `ronin-payloads` Ruby shell.
        #
        # @param [String] name
        #   The name of the IRB shell.
        #
        # @param [Object] context
        #   Custom context to launch IRB from within.
        #
        # @param [Hash{Symbol => Object}] kwargs
        #   Additional keyword arguments for
        #   `Ronin::Core::CLI::RubyShell#initialize`.
        #
        def initialize(name: 'ronin-payloads', context: Ronin::Payloads, **kwargs)
          super(name: name, context: context, **kwargs)
        end

      end
    end
  end
end

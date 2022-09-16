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

require 'ronin/payloads/encoders/registry'
require 'ronin/payloads/encoders/html_encoder'
require 'ronin/payloads/encoders/javascript_encoder'
require 'ronin/payloads/encoders/shell_encoder'
require 'ronin/payloads/encoders/powershell_encoder'
require 'ronin/payloads/encoders/sql_encoder'
require 'ronin/core/params/exceptions'

module Ronin
  module Payloads
    class CLI
      module EncoderMethods
        #
        # Returns the encoder type for the encoder class.
        #
        # @param [Class<Encoders::Encoder>] encoder_class
        #   The encoder class.
        #
        # @return [String, nil]
        #
        def encoder_type(encoder_class)
          if    encoder_class < Encoders::HTMLEncoder       then 'html'
          elsif encoder_class < Encoders::JavaScriptEncoder then 'javascript'
          elsif encoder_class < Encoders::ShellEncoder      then 'shell'
          elsif encoder_class < Encoders::PowerShellEncoder then 'powershell'
          elsif encoder_class < Encoders::SQLEncoder        then 'sql'
          end
        end

        #
        # Loads the encoder.
        #
        # @param [String] name
        #   The encoder name to load.
        #
        # @param [String, nil] fie
        #   The optional explicit file to load the encoder from.
        #
        # @return [Class<Encoders::Encoder>]
        #   The loaded encoder class.
        #
        def load_encoder(name,file=nil)
          begin
            if file then Encoders.load_class_from_file(name,file)
            else         Encoders.load_class(name)
            end
          rescue Encoders::ClassNotFound => error
            print_error error.message
            exit(1)
          rescue => error
            print_exception(error)
            print_error "an unhandled exception occurred while loading encoder #{name}"
            exit(1)
          end
        end

        #
        # Initializes an encoder.
        #
        # @param [Class<Encoders::Encoder>] encoder_class
        #   The encoder class.
        #
        # @param [Hash{Symbol => Object}] kwargs
        #   Additional keyword arguments for {Encoders::Encoder#initialize}.
        #
        def initialize_encoder(encoder_class,**kwargs)
          begin
            encoder_class.new(**kwargs)
          rescue Core::Params::ParamError => error
            print_error error.message
            exit(1)
          rescue => error
            print_exception(error)
            print_error "an unhandled exception occurred while initializing encoder #{encoder_class.id}"
            exit(-1)
          end
        end

      end
    end
  end
end

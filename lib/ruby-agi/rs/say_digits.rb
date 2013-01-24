#
#  File: say_digits.rb
#
#  ruby-agi: Ruby Language API for Asterisk
#
#  Copyright (C) <2006>  Mohammad Khan <info@beeplove.com>
#
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
#

require 'ruby-agi/rs/return_status'

# Say a given digit string, returning early if any of the given DTMF digits are received on the channel.
#
# Command Reference:  SAY DIGITS <number> <escape digits>
#
# failure: 200 result=-1
# success: 200 result=0
# digit pressed: 200 result=<digit>
# <digit> is the ascii code for the digit pressed. 
#


class ReturnStatus
end

class SayDigits < ReturnStatus

	def initialize(command, response)
		super(command, response)
	end

	def success?
		if @is_success.nil?
			if result == '0'
				@is_success = true
			else
				@is_success = false
			end 
		end

		return @is_success
	end

	def failure?
		if @is_failure.nil?
			if result == '-1'
				@is_failure = true
			else
				@is_failure = false
			end 
		end

		return @is_failure
	end

	def digit
		if @digit.nil?
			@digit = result.to_i.chr
		end

		return @digit
	end

	def error?
		return command_error?
	end

	def response
		return message
	end

end

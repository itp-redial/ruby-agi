#
#  File: answer.rb
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

# 
# class to handle return status of Command#answer
# Answers channel if not already in answer state. 
#
# Command Reference: ANSWER
#
# failure: 200 result=-1 
# success: 200 result=0 
#

class ReturnStatus
end

class Answer < ReturnStatus

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
		return (not success?)
	end

	def error?
		return command_error?
	end

	def response
		return message
	end

end

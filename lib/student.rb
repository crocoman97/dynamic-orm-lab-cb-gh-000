require_relative "../config/environment.rb"
require 'active_support/inflector'
require 'interactive_record.rb'
require 'pry'

class Student < InteractiveRecord
  self.column_names.each{ |col|
    attr_accessor col.to_sym unless col.nil?
  }
end

require_relative "../config/environment.rb"
require 'active_support/inflector'
require 'pry'

class InteractiveRecord
  
  def self.table_name
    self.to_s.downcase.pluralize
  end
  
  def self.column_names
    DB[:conn].results_as_hash
    table_info = DB[:conn].execute("PRAGMA table_info('#{table_name}')")
    columns=[]
    table_info.each { |col|
      columns << col["name"]
    }
    columns.compact
  end
  
  def initialize(option= {})
    option.each { |k,v|
      self.send("#{k}=",v)
    }
  end

end

# learn --fail-fast








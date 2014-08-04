module Opstat
module Parsers
  class OracleTablespacesSizes
    include Opstat::Logging

  #TODO - somehow check plugins version
    def save_data(data)
      report = {}
      report[:tablespaces] = []
      data.split("\n")[3..-3].each do |line|
	  tablespace = line.split(/\s+/).delete_if{|t| t.empty?}
          report[:tablespace] << {
	    :host_id => host_id,
            :plugin_id => plugin_id,
            :timestamp => time,
            :name => tablespace[0],
            :total => tablespace[1].to_i,
            :used => tablespace[2].to_i,
            :free => tablespace[3].to_i
	  }
      end
      return report
    end
  end
end
end

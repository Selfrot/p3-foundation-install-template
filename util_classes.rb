class Utilities
	# Setting Paths
	TMPFILE = File.join(File.dirname(__FILE__), '/tmp.txt')

	def self.initialize
		# Check if the temp and log files exists, if not; create them.
		unless File.exist?(Utilities::TMPFILE) do |file|
			File.open(file, 'w+') { |tempentry| tempentry.write('') }
		end
		end
	end

	class Writes

		def self.tmp_entry entry
			File.open(Utilities::TMPFILE, 'w+') { |logentry| logentry.write(entry) }
		end

	end

	class Reads

		def self.read_tmp match
			tmp_contents = File.open(Utilities::TMPFILE, 'r')
			(!!(tmp_contents.read =~ /#{match}/) == true) ? true : false
		end

	end
end

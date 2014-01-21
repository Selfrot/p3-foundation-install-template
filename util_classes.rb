class Utilities
	# Setting Paths
	LOGFILE = File.join(File.dirname(__FILE__), '/log.txt')
	TMPFILE = File.join(File.dirname(__FILE__), '/tmp.txt')

	def self.initialize
		# Check if the temp and log files exists, if not; create them.
		unless File.exist?(Utilities::TMPFILE) do |file|
			File.open(file, 'w+') { |tempentry| tempentry.write('') }
		end
		end

		unless File.exist?(Utilities::LOGFILE) do |file|
			File.open(file, 'w+') { |logentry| logentry.write('') }
		end
		end
	end

	class Writes

		def self.log_entry entry
			File.open(Utilities::LOGFILE, 'a') { |logentry| logentry.write(entry) }
		end

		def self.tmp_entry entry
			File.open(Utilities::TMPFILE, 'w+') { |logentry| logentry.write(entry) }
		end

	end

	class Reads

		def self.read_log match
			log_contents = File.open(Utilities::LOGFILE, 'r')
			(!!(log_contents.read =~ /#{match}/) == true) ? true : false
		end

		def self.read_tmp match
			tmp_contents = File.open(Utilities::TMPFILE, 'r')
			(!!(tmp_contents.read =~ /#{match}/) == true) ? true : false
		end

	end
end

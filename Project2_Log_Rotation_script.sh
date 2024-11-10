
#!/bin/bash

#####################################################################

Author :Athrav Nananware
Version :01

#Objective:
#Develop a robust and automated log rotation script designed to efficiently manage and archive log files, preventing them from growing excessively large and potentially affecting system performance. The script will ensure that log files are archived when they exceed a predefined size limit, ensuring that new log entries can continue to be written to fresh log files without interruption.



##################################################################



log_file="path/to/the/logfile/log"

max_size=1000000   #Set to 1MB

# Check id the logfile exists

if [ -f"$log_file"]; then
	# Get the size of the Particular log file
	log_size=$(wc -c <"$log_file")

	#Check if the log file size exceeds the maximum allowed size
	if ["$log_size" -gt "$max_size" ]; then 
		# Archive the log file and create a new one
		mv "$log_file" "$log_file.old"
		touch "$log_fie"
		echo "Log file size exceeded $max_size bytes.Archived and new log file created." >> /path/to/your/log_archive.log
	fi
else
    echo "Log file does not exist: $log_file" >> /path/to/your/log_archive.log
fi

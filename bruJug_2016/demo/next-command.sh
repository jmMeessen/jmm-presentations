#! /bin/bash

# See https://github.com/jmMeessen/next-command for more details

# TODO: reset work file to a specified command number
# TODO: Allow comments in command file

# if the variable is not set, bail out
if [ -z ${command_list+x} ]; then
  echo "The \"command_list\" variable is not set. Use \"export command_list=my_filename\" for example."
  exit 1
fi

# Do we have a file to process ? That has at least one line ?
if [ ! -f ${command_list} ]; then
   echo "Could not find command list \"${command_list}\"."
   exit 1
fi
command_total=$(wc -l < ${command_list})
if [ ${command_total} = "0" ]; then
  echo "Empty command list."
  exit 1
fi


# Setup the various filenames we are going to need
work_command_file="${command_list}.wrk"
temp_work_command_file="${work_command_file}.tmp"


# If it is the first time we run, initialize the work file that we will shorten at each call
if [ ! -f ${work_command_file} ]; then
  cp ${command_list} ${work_command_file}
fi

commands_in_file=$(wc -l < ${work_command_file})
if [ ${commands_in_file} = "0" ]; then
   echo "No commands left to load !"
   exit
fi


# load the first line of the command list in the clipboard
# and remove trailing return (so that the line does not get executed when pasted)
# NOTE: the "pbcopy" command works only on OSX. Several altermative solutions can be found for Linux.
command=`head -n 1 ${work_command_file}`
echo -n ${command} | pbcopy

# remove the stored line
tail -n +2 ${work_command_file} > ${temp_work_command_file}
mv ${temp_work_command_file} ${work_command_file}

# Compute and display the index of the command that was just loaded
commands_left=$(wc -l < ${work_command_file})
if [ ${commands_left} = "0" ]; then
  next_command="Last one"
else
  next_command=$(expr ${command_total} - ${commands_left})
fi
echo "Loaded command: ${next_command}"


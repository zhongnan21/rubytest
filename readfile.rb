printf("Number: %5.2f \nString: %s\n", 13.234, "Hi")
# use gets function to read input from console
line = gets
print line

# ARGF express input file
ARGF.each {|line| puts line if line =~ /Perl1/}
# ARGF.grep(/Ruby/)










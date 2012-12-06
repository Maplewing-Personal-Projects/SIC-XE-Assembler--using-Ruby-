$LOAD_PATH << File.dirname(__FILE__)
require 'PARSER_SET'
require 'AsmProcessor'

Error.new( :no_argument ).exit_program if ARGV[0].nil?
AsmProcessor.new(ARGV[0]).first_pass

require 'PARSER_SET'
require 'Error'

class AsmStructure
  
  attr_reader :label, :operator, :operand

  def initialize( dataline, line_num )
    @label, @operator, @operand = dataline.scan(SICXE_REGEXP)[0]

    Error.new( :label_name_error_op, line_num, @label ).exit_program if OPTAB.has_key?(@label)
    Error.new( :label_name_error_dir, line_num, @label ).exit_program if DIRTAB.include?(@label)
    
    if not @operand.nil?
      @operand.gsub!(/\s/, "")
      @operand = @operand.split(',')
      @operand.each{ |oper|
        oper_name = oper.gsub( /(\@|\#)/, "" )
        Error.new( :operand_name_error_op, line_num, oper_name ).exit_program if OPTAB.has_key?(oper_name)
        Error.new( :operand_name_error_dir, line_num, oper_name ).exit_program if DIRTAB.include?(oper_name)
      }
    end
  end
end

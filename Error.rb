class Error
  def initialize( type, line = nil, code = nil )
    @type = type
    @line = line
    @code = code
  end
  
  def exit_program
    case @type
      when :invalid_line then puts "SIC/XE Assembler Error: Invalid Line #{@line}. Please check your code."
      when :file_not_found then puts "SIC/XE Assembler Error: File Not Found. Please check your file name and path."
      when :no_argument then puts "SIC/XE Assembler Error: No Argument. The format is 'ruby main.rb xxx.asm'."
      when :label_name_error_op then puts "SIC/XE Assembler Error: Line #{@line} : Label Name '#{@code}' is an Operator Name. Please check your code."
      when :label_name_error_dir then puts "SIC/XE Assembler Error: Line #{@line} : Label Name '#{@code}' is an Directive Name. Please check your code."
      when :operand_name_error_op then puts "SIC/XE Assembler Error: Line #{@line} : Operand Name '#{@code}' is an Operator Name. Please check your code."
      when :operand_name_error_dir then puts "SIC/XE Assembler Error: Line #{@line} : Operand Name '#{@code}' is an Directive Name. Please check your code."
      when :label_name_redefined then puts "SIC/XE Assembler Error: Line #{@line} : Label Name '#{@code}' is Redefined. Please check your code."
    end
    exit
  end
end
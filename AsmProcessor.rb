require 'PARSER_SET'
require 'AsmStructure'
require 'Error'
require 'pp'

class AsmProcessor
  def initialize ( filename )
    Error.new( :file_not_found ).exit_program if not File.exist?( filename )
    @input_filename = filename
    @input_data = File.read(filename).split("\n")
    @code = []
    @input_data.each_with_index{ |line,line_num|
      if !line.match( SICXE_COMMENT )
        if line.match( SICXE_REGEXP )
          @code << { :line_number => line_num+1, :asmcode => AsmStructure.new(line, line_num+1) }
        else
          Error.new( :invalid_line, line_num+1 ).exit_program
        end
      end
    }
  end
  
  def first_pass
    @start_location = 0
    @location_count = 0
    @symbol_table = {}
    @code.map!{ |code_info|
      Error.new( :label_name_redefined, code_info[:line_number], code_info[:asmcode].label ) if @symbol_table.has_key?( code_info[:asmcode].label )
      @symbol_table[code_info[:asmcode].label] = @location_count if not code_info[:asmcode].label.nil?
      case code_info[:asmcode].operator.upcase
        when "START"
          @start_location = code_info[:asmcode].operand[0].to_i
          @location_count = @start_location
          @program_name = code_info[:asmcode].label if not code_info[:asmcode].label.nil?
          @symbol_table[code_info[:asmcode].label] = @location_count if not code_info[:asmcode].label.nil?
        when "END"
          @code_length = @location_count - @start_location
        when "RESW"
          @location_count += code_info[:asmcode].operand[0].to_i * 3
        when "RESB"
          @location_count += code_info[:asmcode].operand[0].to_i
        when "WORD"
          @location_count += 3
        when "BYTE"
          @location_count += code_info[:asmcode].operand[0].scan(STRING_CONSTANT)[0][0].length if code_info[:asmcode].operand[0].match(STRING_CONSTANT)
          @location_count += code_info[:asmcode].operand[0].scan(X_CONSTANT)[0][0].length/2 if code_info[:asmcode].operand[0].match(X_CONSTANT)
        when "BASE"
          ;
        when "NOBASE"
          ;
        else
          if code_info[:asmcode].operator.start_with?("+")
            @location_count += 4
          else
            @location_count += OPTAB[code_info[:asmcode].operator.upcase][:format]
          end
      end
      { :line_number => code_info[:line_number], :asmcode => code_info[:asmcode], :nextcode_count => @location_count }
    }
  end
end

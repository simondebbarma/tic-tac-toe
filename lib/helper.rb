module Helper
  def validate_name(name)
    if name == ''
      false
    else
      name != ' '
    end
  end

  def convert_input(input)
    input.to_i - 1
  end
  
end

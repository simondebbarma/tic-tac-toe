module ValidatorHelper
  def validate_name(name)
    if name == ''
      false
    else
      name != ' ' || name != '  '
    end
  end

  def convert_input(input)
    input.to_i - 1
  end

  def validate_choice(input)
    choice = input.downcase
    if choice == ''
      puts 'invalid choice'
      false
    elsif choice == ' '
      puts 'invalid choice'
      false

    elsif choice == 'yes'
      true
    else
      choice == 'no'
    end
  end
end

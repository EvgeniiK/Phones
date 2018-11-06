class PhoneNumber < ApplicationRecord
  def number
    "#{first_part.to_s.rjust(3, '0')}-#{second_part.to_s.rjust(3, '0')}-#{third_part.to_s.rjust(4, '0')}"
  end

  def self.generate
    n = PhoneNumber.last || PhoneNumber.new(third_part: 000, second_part: 000, first_part: 0000)
    if n.third_part < 9999
      PhoneNumber.create(third_part: n.third_part + 1, second_part: n.second_part, first_part: n.first_part)
    elsif n.second_part < 999
      PhoneNumber.create(third_part: 000, second_part: n.second_part + 1, first_part: n.first_part)
    elsif n.first_part < 999
      PhoneNumber.create(third_part: 000, second_part: 000, first_part: n.first_part + 1)
    else
      PhoneNumber.find_free_number
    end.number
  end

  def self.generate_specific(first, second, third)
    if first.to_i <= 999 && second.to_i <= 999 && third.to_i <= 9999 && first.to_i >= 0 && second.to_i >= 0 && third.to_i >= 0
      if PhoneNumber.where(first_part: first, second_part: second, third_part: third).last
        PhoneNumber.generate
      else
        n = PhoneNumber.create(first_part: first, second_part: second, third_part: third)
        n.number
      end
    else
      PhoneNumber.generate
    end
  end

  # search though all db
  def self.find_free_number
    PhoneNumber.first
  end
end

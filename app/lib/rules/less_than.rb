module Rules
  class LessThan
    def self.run(a, b)
      raise ArgumentError unless a.present? && b.present?

      a = convert_to_int(a)
      b = convert_to_int(b)
      a < b
    end

    def self.convert_to_int(val)
      val = val.to_i if val.is_a?(String)
      val
    end
  end
end

class SuchStreamingBot

  class << self

    def matches? text
      !!(text =~ /hello world/)
    end

  end

end

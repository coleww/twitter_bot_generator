class SuchTestBot

  class << self

    def generate
      greetings.sample
    end

  protected

    def greetings
      @greetings ||= load_txt_file 'greetings.txt'
    end

  private

    def load_txt_file file_name
      home_sweet_home = File.expand_path File.dirname(File.dirname(__FILE__))
      ultimate_pathway = File.join home_sweet_home, 'lib', file_name
      (File.readlines ultimate_pathway).map &:strip
    end

  end

end

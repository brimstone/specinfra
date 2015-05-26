class Specinfra::Command::Linux::Base::Port < Specinfra::Command::Base::Port
  class << self
    def check_is_listening(port, options = {})
      pattern = ":#{port} "
      pattern = " #{options[:local_address]}#{pattern}" if options[:local_address]
      pattern = "^#{options[:protocol]} .*#{pattern}" if options[:protocol]
      "ss -tunl | grep -- #{escape(pattern)}"
    end
  end
end
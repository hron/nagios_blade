require "nagios_blade/version"

require 'nokogiri'
require 'open-uri'
require 'nagios-plugin'

module NagiosBlade
  class Plugin < Nagios::Plugin
    def run
      @opts.banner = "Usage: nagios_blade [options] BLADE_URL"
      @opts.parse!

      @blade_url = ARGV[0]
      unless @blade_url
        puts @opts.help
        exit(255)
      end
      @critical &&= @critical.to_f
      @warning &&= @warning.to_f

      status_html = Nokogiri::HTML(open(blade_full_url))
      average_hashrate = status_html.css('center table tr:first-child td:last-child')[0].text.to_i
      message = "Speed: %.2d Gh/s" % (average_hashrate / 1000)

      if average_hashrate < @critical
        critical(message)
      elsif average_hashrate < @warning
        warning(message)
      else
        ok(message)
      end
    end


    private

    def blade_full_url
      "http://#{@blade_url}:8000"
    end
  end
end

require 'inifile'

module Firefox
  module Profile
    def self.path(profile = nil, inifile = nil)
      # TODO: Add path for other OS
      base_path = File.expand_path('~/.mozilla/firefox')

      unless inifile
        inifile = File.join(base_path, 'profiles.ini')
      end

      ini  = IniFile.new(inifile)

      sections = ini.sections.grep(/Profile/)
      subpath = nil

      if profile
        sections.each do |section|
          h = ini[section]

          if h["Name"] == profile
           subpath = h['Path']
           break
          end
        end
      # default profile
      else
        # if only has 1 profile, no Default parameter in section
        if sections.length == 1
          subpath = ini[sections.first]['Path']
        elsif sections.length > 1
          sections.each do |section|
            h = ini[section]

            if h.include?('Default') && h['Default'] == "1"
             subpath = h['Path']
             break
            end
          end
        end
      end

      subpath = (subpath.nil? ? '' : subpath)

      File.join(base_path, subpath)
    end
  end
end


module SantanderChile
  module ApiClient
    module Template
      class ERBContext
        def initialize(hash)
          hash.each_pair do |key, value|
            instance_variable_set("@" + key.to_s, value)
          end
        end

        def get_binding
          binding
        end
      end

      path_templates = File.dirname(__FILE__)
      TEMPLATES = {}

      ["requests"].each do |category|
        Dir.foreach(path_templates + "/#{category}/") do |filename|
          next if !filename.include? "_template.json.erb"
          filename.slice! "_template.json.erb"
          TEMPLATES["#{category}/#{filename}"] = "#{path_templates}/#{category}/#{filename}_template.json.erb"
        end
      end

      def with_template(path, **objs)
        template_file = File.read(TEMPLATES[path])
        context = ERBContext.new(objs)
        ERB.new(template_file).result(context.get_binding)
      end
    end
  end
end

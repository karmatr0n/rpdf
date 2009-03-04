require 'rubygems'
require 'pdf/writer'
module ActionView
  module TemplateHandlers
    class RPDF < TemplateHandler
      include Compilable
      def compile(template)
        "@template_format = :pdf;" +
        "controller.response.content_type ||= Mime::PDF;" +
        "pdf = PDF::Writer.new;" +
        template.source +
        ";pdf.render;"
      end
    end
  end
end


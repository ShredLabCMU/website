class YouTube < Liquid::Tag
  Syntax = /^\s*([^\s]+)(\s+(\d+)\s+(\d+)\s*)?/

  def initialize(tagName, markup, tokens)
    super

    if markup =~ Syntax then
      @id = $1

      if $2.nil? then
          @width = 900
          @height = 700
      else
          @width = $3.to_i
          @height = $4.to_i
      end
    else
      raise "No YouTube ID provided in the \"youtube\" tag"
    end
  end

  def render(context)
    # "<iframe width=\"#{@width}\" height=\"#{@height}\" src=\"http://www.youtube.com/embed/#{@id}\" frameborder=\"0\"allowfullscreen></iframe>"
    "<div class=\"video-wrapper\"><iframe src=\"https://www.youtube.com/embed/#{@id}\" frameborder=\"0\" allowfullscreen></iframe></div>"
  end

  Liquid::Template.register_tag "youtube", self
end

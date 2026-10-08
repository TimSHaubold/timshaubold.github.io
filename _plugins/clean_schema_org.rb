# frozen_string_literal: true

require "json"

# al_folio_core 1.0.15 pushes `social.url` into the schema.org "sameAs" list for
# socials it does not know (cv_pdf here), which yields `null` entries. Drop them
# so the JSON-LD that search engines read only lists real profile URLs.
Jekyll::Hooks.register [:pages, :documents], :post_render do |doc|
  next unless doc.output_ext == ".html" && doc.output.to_s.include?("application/ld+json")

  doc.output = doc.output.gsub(%r{(<script type="application/ld\+json">)(.*?)(</script>)}m) do
    match = Regexp.last_match
    begin
      data = JSON.parse(match[2])
    rescue JSON::ParserError
      next match[0]
    end

    if data["sameAs"].is_a?(Array)
      data["sameAs"] = data["sameAs"].compact
      data.delete("sameAs") if data["sameAs"].empty?
    end
    "#{match[1]}#{JSON.generate(data)}#{match[3]}"
  end
end

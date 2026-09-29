# frozen_string_literal: true

# The social icons on the about page come from jekyll-socials, which renders the
# email entry as a plain `mailto:` link. al_email_protect ships a rewriter for
# exactly this case, but al_folio_core 1.0.15 does not pipe the social block
# through it. Rewrite the finished HTML here instead of overriding the theme's
# layout: layouts are owned by the gem (see test/style_contract.js).
Jekyll::Hooks.register [:pages, :documents], :post_render do |doc|
  next unless defined?(AlEmailProtect) && AlEmailProtect.enabled?(doc.site)
  next unless doc.output_ext == ".html" && doc.output.to_s.include?("mailto:")

  # al_email_protect 1.0.1 folds any other attribute of the anchor into its
  # class, so take the title out first and put it back afterwards.
  html = doc.output
    .gsub(/(<a\b[^>]*href=["']mailto:[^"']*["'][^>]*?)\s+title=(["'])Email\2/, '\1')
    .gsub(/(<a\b[^>]*?)\s+title=(["'])Email\2([^>]*href=["']mailto:)/, '\1\3')
  html = AlEmailProtect.rewrite_html(html)
  doc.output = html.gsub('class="al-email-protect "', 'class="al-email-protect" title="Email"')
end

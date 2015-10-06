# Decoding attachments
# ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
# Decodes a MIME attachment into text form.
# The text will be displayed directly in Sup.
# (See mime-view hook to open attachments in an external viewer)

# Read HTML only emails

unless sibling_types.member? 'text/plain'
  case content_type
  when 'text/html'
    `pandoc --from html --to markdown #{filename}`
  end
end

def style_string(styles_hash = {})
  styles_hash
    .delete_if { |k, v| v == nil}
    .map { |key, value|
      new_key = key.to_s.gsub '_', '-'
      "#{new_key}: #{value};"
    }
    .join
end
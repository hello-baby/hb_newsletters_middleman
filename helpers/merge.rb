def merge (defaults, overrides)
  defs  = defaults.delete_if { |k, v| v.nil? }
  overs = overrides.delete_if { |k, v| v.nil? }

  defs.merge(overs) do |key, oldval, newval|
    case key
      when :style_obj, :attrs
        oldval.merge newval
      else newval
    end
  end
end
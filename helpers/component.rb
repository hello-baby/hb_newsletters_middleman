# Renders a partial from within the `app/views/components/` folder.
# All options passed (except for :locals` and `:collection`)
# will appear within the partial as an `options` hash.
# E. g. this call:
#     component :foo, bar: 'baz'
# will result in this:
#     render partial: 'components/foo', locals: {bar: 'baz'}
# This method accepts an arbitrary number of hashes, e. g.:
#     component :foo, options_hash, more: 'options'
def component(partial_name, *options, &content_block)
  # Defining a hash to invoke `render` with
  resulting_options = {}

  # Collecting all passed options into one hash
  passed_options = {}
  options.each do |hash|
    raise ArgumentError, 'Argument is not a hash' unless hash.is_a? Hash
    passed_options.merge! hash
  end

  # Extracting predefined options from passed options into resulting options
  predefined_option_names = [:collection, :locals]
  predefined_option_names.each do |option|
    resulting_options[option] = passed_options.delete(option) if passed_options.has_key? option
  end

  options_options = passed_options.delete(:options) || {}

  # Moving remaining options into `resulting_options[:locals][:opts]`
  resulting_options[:locals] ||= {}
  resulting_options[:locals][:options] = options_options.merge passed_options

  # Move a block into `resulting_options[:locals][:options][:yield]`
  if block_given?
    resulting_options[:locals][:options][:yield] = capture(&content_block)
  end

  # Invoking the standard partial mixin with the new path and resulting_options
  partial partial_name, resulting_options
end
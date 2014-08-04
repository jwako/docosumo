# Use this setup block to configure all options available in SimpleForm.
SimpleForm.setup do |config|
  config.input_class = 'form-control'
	config.wrappers :form_control, tag: 'div', class: 'col-md-12', error_class: 'has-error' do |b|
    b.use :html5
    b.use :placeholder
    b.use :input
    b.use :hint, wrap_with: { tag: 'p', class: 'help-block' }
  end

  config.default_wrapper = :form_control
end

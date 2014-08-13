# Use this setup block to configure all options available in SimpleForm.
SimpleForm.setup do |config|
  config.input_class = 'form-control'
	config.wrappers :form_control, tag: 'div', class: 'row' do |b|
		b.wrapper tag: 'div', class: 'col-md-12', error_class: 'has-error' do |ba|
	    ba.use :html5
	    ba.use :placeholder
	    ba.use :input
	    ba.use :hint, wrap_with: { tag: 'p', class: 'help-block' }
	  end
  end

  config.wrappers :checkbox, tag: :div, class: "row" do |b|
  	b.wrapper tag: :div, class: "col-md-12", error_class: "has-error" do |ba|
	    ba.wrapper tag: :div, class: "checkbox" do |bb|
		    bb.use :html5
	      bb.use :label_input
		    bb.use :hint,  wrap_with: { tag: :p, class: "help-block" }
		    bb.use :error, wrap_with: { tag: :span, class: "help-block text-danger" }
	    end
	  end
  end

  config.default_wrapper = :form_control
end

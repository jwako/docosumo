module X::IndicatorSourcesHelper

	def source_active?(flag)
		case flag
		when true
			return ""
		when false
			return "active"
		else
			return ""
		end
	end
end

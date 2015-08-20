class ApiConstraints
  
  def initialize(options)
    @default = options[:default]
  end

  def matches?(req)
    @default 
  end

end

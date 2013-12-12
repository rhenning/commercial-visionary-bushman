module HelperModule
  def log_message
    HelperClass.new.log_message
  end
end

class Chef::Recipe
  include HelperModule
end

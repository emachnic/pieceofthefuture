module ApplicationHelper
  def active_if?(name)
    'active' if (params[:id] == name) || (controller.action_name == name)
  end
  
  def if_active_controller?(name)
    'active' if controller.controller_name == name
  end
end

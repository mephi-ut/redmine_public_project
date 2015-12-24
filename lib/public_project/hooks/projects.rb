class PublicProjectProjectsHooks < Redmine::Hook::ViewListener
 
  # context:
  # * :form - the form builder
  # * :project - the current project
  def view_projects_form(context={})
    content_tag(:p, context[:form].check_box(:is_public_project))
  end
end

require_dependency 'user'

module PublicProjectUserPatch

  def self.included(base)
    base.send(:include, InstanceMethods)
    base.class_eval do
      unloadable

      alias_method_chain :allowed_to?, :public_project
    end
  end

  module InstanceMethods
    def allowed_to_with_public_project?(action, context, options={}, &block)
      return true if allowed_to_without_public_project?(action, context, options, &block)
      if action.is_a?(Hash)
        if action[:controller] == "issues"
          if action[:action] == "index"
            return context.is_public_project
          elsif action[:action] == "show"
            return context.is_public_project
          end
        end
      elsif action == :view_issues
        return context.is_public_project
      end
      return false
    end
  end
end

User.send(:include, PublicProjectUserPatch)

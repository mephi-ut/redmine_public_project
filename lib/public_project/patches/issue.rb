require_dependency 'issue'

module PublicProjectIssuePatch
    
    def self.included(base)
        base.extend(ClassMethods)
        base.send(:include, InstanceMethods)
        base.class_eval do
            unloadable

            alias_method_chain :visible?, :public_project
            class << self
                alias_method_chain :visible_condition, :public_project
            end
        end

        base.instance_eval do
        end
    end

    module ClassMethods
        def visible_condition_with_public_project(user, options={})
          return "(#{visible_condition_without_public_project(user, options)}) OR (#{Project.table_name}.is_public_project = 1 AND #{Issue.table_name}.is_private != 1)"
        end
    end

    module InstanceMethods
        def visible_with_public_project?(usr=nil)
            return true if project.is_public_project and not is_private
            return visible_without_public_project?(usr)
        end
        
    end

end

Issue.send(:include, PublicProjectIssuePatch)

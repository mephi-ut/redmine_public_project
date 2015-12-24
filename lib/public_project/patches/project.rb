module PublicProjectProjectPatch
  def self.included(base)
    base.send(:include, InstanceMethods)

    base.class_eval do
      unloadable

      safe_attributes :is_public_project
      #before_save :set_public_project
    end
  end

  module InstanceMethods
#    def set_public_project
#    end
  end
end

Project.send(:include, PublicProjectProjectPatch)

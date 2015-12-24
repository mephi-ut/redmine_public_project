require 'redmine'

require 'public_project/patches/project'
require 'public_project/patches/issue'
require 'public_project/patches/user'
require 'public_project/hooks/projects'


Redmine::Plugin.register :redmine_public_project do
  name 'Public project'
  author 'Dmitry Yu Okunev'
  description 'Plugin allows to see issues for non-members.'
  version '0.4'
end

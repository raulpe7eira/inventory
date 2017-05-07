require 'rails_helper'

RSpec.describe 'Routes', :type => :routing do

  context 'devise for users' do
    it { should route(:get, '/users/sign_in').to(:controller => :'devise/sessions', :action => :new) }
    it { should route(:post, '/users/sign_in').to(:controller => :'devise/sessions', :action => :create) }
    it { should route(:delete, '/users/sign_out').to(:controller => :'devise/sessions', :action => :destroy) }

    it { should route(:get, '/users/password/new').to(:controller => :'devise/passwords', :action => :new) }
    it { should route(:get, '/users/password/edit').to(:controller => :'devise/passwords', :action => :edit) }
    it { should route(:patch, '/users/password').to(:controller => :'devise/passwords', :action => :update) }
    it { should route(:put, '/users/password').to(:controller => :'devise/passwords', :action => :update) }
    it { should route(:post, '/users/password').to(:controller => :'devise/passwords', :action => :create) }

    it { should route(:get, '/users/cancel').to(:controller => :'devise/registrations', :action => :cancel) }
    it { should route(:get, '/users/sign_up').to(:controller => :'devise/registrations', :action => :new) }
    it { should route(:get, '/users/edit').to(:controller => :'devise/registrations', :action => :edit) }
    it { should route(:patch, '/users').to(:controller => :'devise/registrations', :action => :update) }
    it { should route(:put, '/users').to(:controller => :'devise/registrations', :action => :update) }
    it { should route(:delete, '/users').to(:controller => :'devise/registrations', :action => :destroy) }
    it { should route(:post, '/users').to(:controller => :'devise/registrations', :action => :create) }
  end

  context 'resources materials' do
    it { should route(:get, '/materials').to(:controller => :materials, :action => :index) }
    it { should route(:get, '/materials/new').to(:controller => :materials, :action => :new) }
    it { should route(:get, '/materials/1/edit').to(:controller => :materials, :action => :edit, :id => 1) }
    it { should route(:post, '/materials').to(:controller => :materials, :action => :create) }
    it { should route(:patch, '/materials/1').to(:controller => :materials, :action => :update, :id => 1) }
    it { should route(:put, '/materials/1').to(:controller => :materials, :action => :update, :id => 1) }
    it { should route(:delete, '/materials/1').to(:controller => :materials, :action => :destroy, :id => 1) }
  end

  context 'root' do
    it { expect(get: '/').to route_to(:controller => 'materials', :action => 'index') }
  end

end

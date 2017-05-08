Rails.application.routes.draw do

  root to: "static_pages#root"

  defaults format: :json do

    concern :nation_attachable do
      get 'world', to: 'nations#index'
    end

    scope 'v1' do
      scope 'topics' do
        get 'national', to: 'states#index'
        concerns :nation_attachable
      end
    end

    scope 'v2' do
      scope 'topics' do
        get 'national', to: 'cities#capitals'
        concerns :nation_attachable
      end
    end

  end
end

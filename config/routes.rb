Rails.application.routes.draw do

  defaults format: :json do

    concern :nation_attachable do
      get 'world', to: 'nations#index'
    end

    namespace :v1 do

      namespace :topics do
        get 'national', to: 'states#names'
        concerns :nation_attachable
      end

      namespace :v2 do
        get 'national', to: 'states#capitals'
        concerns :nation_attachable
      end

    end

  end


end

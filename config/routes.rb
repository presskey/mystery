Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  
  namespace :api, format: true, constraints: { format: 'json' }, except: [:new, :edit] do  
    resources :spells
  end

end

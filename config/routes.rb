Rails.application.routes.draw do
  root 'subs#index'
  resources :subs do 
    resources :topics 
  end

  scope 'topics/:topic_id', as: 'topic' do 
    resources :comments, only: [:new, :create]
  end


  get '/people', to: 'people#index', as: 'all_the_people'
  get '/person/:id', to: 'people#show', as: 'the_one_person'
  delete '/person/:id', to: 'people#destroy', as: 'destroy_the_person'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do

  scope 'api' do
    scope '/v1' do
      scope 'user' do
        scope '/get_user' do
          get '/', to: 'users#show'
        end
      end
      scope 'accounts' do
        get '/', to: 'accounts#index'
      end
    end
  end

  devise_for :users,
             path: '',
             path_names: {
               sign_in: 'login',
               sign_out: 'logout',
               registration: 'signup'
             },
             controllers: {
               sessions: 'sessions',
               registrations: 'registrations'
             }
             
end

# frozen_string_literal: true

RedisWebManager::Engine.routes.draw do
  redises_keys = RedisWebManager.redises.keys
  scope ':instance' do
    # Configuration
    get 'configuration' => 'configuration#index'

    # Information
    get 'information' => 'information#index'

    # Dashboard
    get 'dashboard' => 'dashboard#index'

    # Keys
    get 'keys' => 'keys#index'
    get 'key' => 'keys#show'
    get 'key/edit' => 'keys#edit', as: :edit_key
    put 'keys' => 'keys#update', as: :update_key
    delete 'keys' => 'keys#destroy', as: :destroy_key

    # Clients
    get 'clients' => 'clients#index'

    # Actions
    delete 'reset' => 'actions#reset'
    delete 'flushdb' => 'actions#flushdb'
    delete 'flushall' => 'actions#flushall'
  end

  # Root
  root to: 'dashboard#index'
end

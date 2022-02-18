Rails.application.routes.draw do
  get 'schedules/index' => "schedules#index"
  resources:schedules
end

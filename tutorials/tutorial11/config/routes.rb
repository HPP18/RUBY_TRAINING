Rails.application.routes.draw do
  root "pages#qr_code_generator"
  controller :pages do
    get :qr_code_show
    get :qr_code_download
  end
end

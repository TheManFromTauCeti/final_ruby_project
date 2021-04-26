ActiveAdmin.register Province do
  permit_params :name, :current_PST, :current_HST, :current_GST
end

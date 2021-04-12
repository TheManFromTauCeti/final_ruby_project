ActiveAdmin.register Product do
  permit_params :name, :description, :price, :in_stock, :stock_quantity,
                :image, product_categories_attributes: %i[
                  id product_id category_id _destroy
                ]
  form do |f|
    f.semantic_errors # shows errors on :base
    f.inputs # builds an input field for every attribute
    f.has_many :product_categories, allow_destroy: true do |n_f|
      n_f.input :category
    end
    f.inputs do
      f.input :image, as: :file, hint: f.object.image.present? ? image_tag(f.object.image) : ""
    end
    f.actions # adds the "Submit" and "Cancel" buttons
  end
end

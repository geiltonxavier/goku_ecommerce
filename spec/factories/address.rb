require 'factory_girl'

FactoryGirl.define do
  factory :address do
    zip_code { "06774008" }
    street { "Avenida Governador Mario Covas" }
    state { "São Paulo" }
    city { "Taboão da Serra" }
    neighborhood { "Parque Jacaranda" }
  end
end

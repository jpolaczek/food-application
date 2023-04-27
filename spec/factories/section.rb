FactoryBot.define do
    factory :section do
        name { 'pizza dough' }
        components { [association(:component)] }
    end
end
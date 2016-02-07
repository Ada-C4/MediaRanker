FactoryGirl.define do
  factory :album do
    name "Spiceworld"
    votes 26
  end

  factory :book do
    name "The Name of the Wind"
    votes 2
  end

  factory :movie do
    name "The Little Mermaid"
    votes 0
  end

  mediums = Medium.types.shuffle
  type_one, type_two = mediums.pop, mediums.shift

  factory type_one, class: type_one.downcase, aliases: [:nameless] do
    name nil
  end

  factory type_two, class: type_two.downcase, aliases: [:typeless] do
    name "Generic Test"
    type nil
  end

end

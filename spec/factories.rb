Factory.define :company do |f|
  f.sequence(:email) {|n| "memver#{n}@mycompany.com" }
  f.title                 "My Company"
  f.city                  "Monterrey"
  f.password              "secret"
  f.password_confirmation "secret"
  f.description           "This is my company"
  f.role                  "member"
  f.website               "www.foobar.com"
  f.facebook              "foobar"
  f.twitter               "foobar"
  f.contact_email         "foo@bar.com"
end

Factory.define :job do |f|
  f.title                 "Ruby Programmer"
  f.city                  "Monterrey"
  f.full_time             true
  f.part_time             false
  f.remote                false
  f.flexible              false
  f.description           "We required 3 ruby programmers"
  f.association           :company, :factory => :company
end

Factory.define :required_skill do |rs|
  rs.skill_name           "Ruby"
  rs.skill_category_id    1
end


Factory.define :skill_category do |c|
  c.category              "Ruby"
end

Factory.define :city, :class => Metropoli::CityModel do |f|
  f.name            "Monterrey"
  f.association     :state, :factory => :state
end

Factory.define :state, :class => Metropoli::StateModel do |f|
  f.name           "Nuevo León"
  f.abbr            "NL"
  f.association     :country, :factory => :country
end

Factory.define :country, :class => Metropoli::CountryModel do |f|
  f.name            "México"
  f.abbr            "MX"
end

Factory.define :job_for_seed  do |j|
  f.title                 "Ruby Programmer"
  f.city                  "Monterrey"
  f.full_time             false
  f.part_time             false
  f.remote                false
  f.flexible              false
  f.description           "Faltan required skills!"
  f.association           :company, :factory => :company
  f.required_skills {|rs|[rs.association :required_skill]}
end


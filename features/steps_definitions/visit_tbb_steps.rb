Dado('que faco algo') do
  visit_tbb.load
end

Então('recebo alguma coisa') do
  expect(page).to have_content('THE BEAUTY BOX')
end

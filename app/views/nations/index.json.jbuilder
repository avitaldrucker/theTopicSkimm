@nations.each do |nation|
  json.set! nation.id do
    json.partial! "nations/nation", nation: nation
  end
end

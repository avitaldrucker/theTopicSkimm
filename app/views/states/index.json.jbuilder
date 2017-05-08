@states.each do |state|
  json.set! state.id do
    json.partial! "states/state", state: state
  end
end

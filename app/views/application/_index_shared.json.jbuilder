resources.each do |resource|
  json.set! resource.id do
    class_name = resource.class.to_s.downcase
    folder = resource.is_a?(City) ? "cities" : "#{class_name}s"
    symbol = class_name.to_sym
    json.partial! "#{folder}/#{class_name}", symbol => resource
  end
end

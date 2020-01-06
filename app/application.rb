
class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)


    if req.path.match(/items/)
      request_item = req.path.split("/items/").last
      return_object = @@items.find {|instance_object| instance_object.name == request_item}
      if return_object
        resp.write "#{return_object.price}"
      else
        resp.status = 400
        resp.write "Item not found"
      end
    else
      resp.status = 404
      resp.write "Route not found"
    end
    resp.finish
  end
end

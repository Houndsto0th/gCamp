class TrackerAPI
  def initialize
    @conn = Faraday.new(url: 'https://www.pivotaltracker.com')
  end

  def projects(token)
    return [] if token.nil?
    response = @conn.get do |req|
      req.url "/services/v5/projects"
      req.headers['Content-Type'] = 'application/json'
      req.headers['X-TrackerToken'] = token
    end

    JSON.parse(response.body, symbolize_names: true).map do |parsed_resp|
      TrackerProject.new(parsed_resp[:id], parsed_resp[:name])
    end
    # [ {name: XXX, id: XXX, iteration_length:, fooey: } ]
  end

  def stories(project, token)
    return [] if token.nil?
    response = @conn.get do |req|
      req.url "/services/v5/projects/#{project}/stories?limit=500"
      req.headers['Content-Type'] = 'application/json'
      req.headers['X-TrackerToken'] = token
    end

    JSON.parse(response.body, symbolize_names: true)
  end
end

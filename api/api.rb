require 'sinatra'
require "sinatra/activerecord"
require "sinatra/config_file"
require 'mongo'
require 'json'
require 'mysql2'

include Mongo

class ScaleApi < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  register Sinatra::ConfigFile

  config_file 'config/config.yml'

  before do
    content_type 'application/json'
  end

  configure do
    mongo_conn = MongoClient.new(settings.mongodb_host, settings.mongodb_port)
    @@mongo_db = mongo_conn.db(settings.mongodb_db)
  end

  # Validates a token for a given host
  def validate(uuid,ak,as)
    if Host.joins(:credentials).where('credentials.apikey' => ak, 'credentials.apisecret' => as, :uuid => uuid, :locked => false ).empty?
      return false
    else
      return true
    end
  end

#  get '/' do
#    "Hello, world!"
#  end

#  get '/collections/' do
#    @@mongo_db.collection_names
#  end

  post '/api/tic/?' do
    metrics = JSON.parse(request.env["rack.input"].read)
    if metrics.first['auth'].nil?
      status 401
      return '{"ERROR":"Action requires user authentication."}'
    end
    if validate(metrics.first['auth']['uuid'],metrics.first['auth']['apikey'],metrics.first['auth']['apisecret'])
      if metrics.first['metrics'].nil?
        status 400
        return '{"ERROR":"Malformed data syntax or a bad query."}'
      end
      begin
	# Selection mongodb collection to store metrics
        mongo_collection = @@mongo_db[metrics.first['auth']['uuid']]
	# Append timestamp to metrics
	metrics.first['metrics']['ts'] = Time.now.utc
	# Store metrics
        mongo_collection.insert(metrics.first['metrics'])
      rescue Exception => e
        status 502
        return '{"ERROR":"Backend service failure."}'
      end
      status 201
    else
      status 403
      return '{"ERROR":"Authentication failure"}]'
    end
  end
end

require_relative 'models/host'
require_relative 'models/credential'

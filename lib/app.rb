require 'sinatra'
require 'mqtt'
require 'cf-app-utils'

DATA ||= {}

before do
  unless rabbitmq_creds('uris')
    halt 500, %{You must bind a RabbitMQ service instance to this application.

You can run the following commands to create an instance and bind to it:

  $ cf create-service p-rabbitmq development rabbitmq-instance
  $ cf bind-service <app-name> rabbitmq-instance}
  end
end

get '/ping' do
  begin
    c = MQTT::Client.connect(
      host: rabbitmq_creds('host'), 
      port: rabbitmq_creds('port'),
      username: rabbitmq_creds('username'),
      password: rabbitmq_creds('password'),
      clean_session: false,
      client_id: "test-session"
    )

    status 200
    body 'OK'
  rescue Exception => e
    halt 500, "ERR:#{e}"
  end
end

get '/env' do
  status 200
  body "rabbitmq_url: #{rabbitmq_creds('uris')}\n"
end

put '/queue/:name' do
  q = mq(params[:name])

  if params[:data]
    client.subscribe(q => 1)
    client.publish(q, params[:data], 1)

    status 201
    body 'SUCCESS'
  else
    status 400
    body 'NO-DATA'
  end
end

get '/queue/:name' do
  q = mq(params[:name])

  topic, message = client.get(q)

  status 201
  body "SUCCESS"
end

error do
  halt 500, "ERR:#{env['sinatra.error']}"
end

#############################################

def mq(name)
  "test.mq.#{name}"
end

def rabbitmq_creds(name)
  return nil unless ENV['VCAP_SERVICES']

  JSON.parse(ENV['VCAP_SERVICES'], :symbolize_names => true).values.map do |services|
    services.each do |s|
      begin
        return s[:credentials][:protocols][:mqtt][name.to_sym]
      rescue Exception
      end
    end
  end
  nil
end


def client
  unless $client
    begin
      $client = MQTT::Client.connect(
        host: rabbitmq_creds('host'), 
        port: rabbitmq_creds('port'),
        username: rabbitmq_creds('username'),
        password: rabbitmq_creds('password')
      )
    rescue Exception => e
      halt 500, "ERR:#{e}"
    end
  end
  $client
end

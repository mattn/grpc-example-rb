#!/usr/bin/env ruby

require 'grpc'
require 'customer_service_services'

class MyServer < Proto::CustomerService::Service
  def initialize()
    @customers = []
  end
  def add_person(arg, call)
    @customers << arg
    Proto::ResponseType.new
  end
  def list_person(args, call)
    @customers
  end
end

# main starts an RpcServer that receives requests to GreeterServer at the sample
# server port.
def main
  customers = []
  server = GRPC::RpcServer.new
  server.add_http2_port('0.0.0.0:11111')
  server.handle(MyServer.new)
  server.run
end

main

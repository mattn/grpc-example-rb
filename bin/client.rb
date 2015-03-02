#!/usr/bin/env ruby

require 'grpc'
require 'customer_service_services'

def main
  stub = Proto::CustomerService::Stub.new('localhost:50051')
  if ARGV.size == 2
    stub.add_person(Proto::Person.new(name: ARGV[0], age: ARGV[1].to_i))
  else
    stub.list_person(Proto::RequestType.new).each do |x|
      puts "name=#{x.name}, age=#{x.age}"
    end
  end
end

main

# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: primitives.proto

require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_message "jiji.rpc.Decimal" do
    optional :value, :string, 1
  end
end

module Jiji
  module Rpc
    Decimal = Google::Protobuf::DescriptorPool.generated_pool.lookup("jiji.rpc.Decimal").msgclass
  end
end

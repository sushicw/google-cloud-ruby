# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/spanner/v1/keys.proto


require 'google/protobuf'

require 'google/protobuf/struct_pb'
require 'google/api/annotations_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_message "google.spanner.v1.KeyRange" do
    oneof :start_key_type do
      optional :start_closed, :message, 1, "google.protobuf.ListValue"
      optional :start_open, :message, 2, "google.protobuf.ListValue"
    end
    oneof :end_key_type do
      optional :end_closed, :message, 3, "google.protobuf.ListValue"
      optional :end_open, :message, 4, "google.protobuf.ListValue"
    end
  end
  add_message "google.spanner.v1.KeySet" do
    repeated :keys, :message, 1, "google.protobuf.ListValue"
    repeated :ranges, :message, 2, "google.spanner.v1.KeyRange"
    optional :all, :bool, 3
  end
end

module Google
  module Spanner
  end
end
module Google::Spanner::V1
  KeyRange = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.spanner.v1.KeyRange").msgclass
  KeySet = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.spanner.v1.KeySet").msgclass
end

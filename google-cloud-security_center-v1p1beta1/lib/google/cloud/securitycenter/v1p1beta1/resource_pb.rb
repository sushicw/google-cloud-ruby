# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/cloud/securitycenter/v1p1beta1/resource.proto

require 'google/protobuf'

require 'google/api/annotations_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/cloud/securitycenter/v1p1beta1/resource.proto", :syntax => :proto3) do
    add_message "google.cloud.securitycenter.v1p1beta1.Resource" do
      optional :name, :string, 1
      optional :project, :string, 2
      optional :project_display_name, :string, 3
      optional :parent, :string, 4
      optional :parent_display_name, :string, 5
    end
  end
end

module Google
  module Cloud
    module SecurityCenter
      module V1p1beta1
        Resource = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.securitycenter.v1p1beta1.Resource").msgclass
      end
    end
  end
end

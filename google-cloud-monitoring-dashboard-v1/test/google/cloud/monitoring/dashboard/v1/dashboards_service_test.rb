# frozen_string_literal: true

# Copyright 2020 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require "simplecov"
require "minitest/autorun"

require "gapic/grpc/service_stub"

require "google/monitoring/dashboard/v1/dashboards_service_pb"
require "google/monitoring/dashboard/v1/dashboards_service_services_pb"
require "google/cloud/monitoring/dashboard/v1/dashboards_service"

class Google::Cloud::Monitoring::Dashboard::V1::DashboardsService::ClientTest < Minitest::Test
  class ClientStub
    attr_accessor :call_rpc_count, :requests

    def initialize response, operation, &block
      @response = response
      @operation = operation
      @block = block
      @call_rpc_count = 0
      @requests = []
    end

    def call_rpc *args
      @call_rpc_count += 1

      @requests << @block&.call(*args)

      yield @response, @operation if block_given?

      @response
    end
  end

  def test_create_dashboard
    # Create GRPC objects.
    grpc_response = Google::Cloud::Monitoring::Dashboard::V1::Dashboard.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    parent = "hello world"
    dashboard = {}

    create_dashboard_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :create_dashboard, name
      assert_kind_of Google::Cloud::Monitoring::Dashboard::V1::CreateDashboardRequest, request
      assert_equal "hello world", request.parent
      assert_equal Gapic::Protobuf.coerce({}, to: Google::Cloud::Monitoring::Dashboard::V1::Dashboard), request.dashboard
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, create_dashboard_client_stub do
      # Create client
      client = Google::Cloud::Monitoring::Dashboard::V1::DashboardsService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.create_dashboard({ parent: parent, dashboard: dashboard }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.create_dashboard parent: parent, dashboard: dashboard do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.create_dashboard Google::Cloud::Monitoring::Dashboard::V1::CreateDashboardRequest.new(parent: parent, dashboard: dashboard) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.create_dashboard({ parent: parent, dashboard: dashboard }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.create_dashboard Google::Cloud::Monitoring::Dashboard::V1::CreateDashboardRequest.new(parent: parent, dashboard: dashboard), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, create_dashboard_client_stub.call_rpc_count
    end
  end

  def test_list_dashboards
    # Create GRPC objects.
    grpc_response = Google::Cloud::Monitoring::Dashboard::V1::ListDashboardsResponse.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    parent = "hello world"
    page_size = 42
    page_token = "hello world"

    list_dashboards_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :list_dashboards, name
      assert_kind_of Google::Cloud::Monitoring::Dashboard::V1::ListDashboardsRequest, request
      assert_equal "hello world", request.parent
      assert_equal 42, request.page_size
      assert_equal "hello world", request.page_token
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, list_dashboards_client_stub do
      # Create client
      client = Google::Cloud::Monitoring::Dashboard::V1::DashboardsService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.list_dashboards({ parent: parent, page_size: page_size, page_token: page_token }) do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.list_dashboards parent: parent, page_size: page_size, page_token: page_token do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.list_dashboards Google::Cloud::Monitoring::Dashboard::V1::ListDashboardsRequest.new(parent: parent, page_size: page_size, page_token: page_token) do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.list_dashboards({ parent: parent, page_size: page_size, page_token: page_token }, grpc_options) do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.list_dashboards Google::Cloud::Monitoring::Dashboard::V1::ListDashboardsRequest.new(parent: parent, page_size: page_size, page_token: page_token), grpc_options do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, list_dashboards_client_stub.call_rpc_count
    end
  end

  def test_get_dashboard
    # Create GRPC objects.
    grpc_response = Google::Cloud::Monitoring::Dashboard::V1::Dashboard.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    name = "hello world"

    get_dashboard_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :get_dashboard, name
      assert_kind_of Google::Cloud::Monitoring::Dashboard::V1::GetDashboardRequest, request
      assert_equal "hello world", request.name
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, get_dashboard_client_stub do
      # Create client
      client = Google::Cloud::Monitoring::Dashboard::V1::DashboardsService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.get_dashboard({ name: name }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.get_dashboard name: name do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.get_dashboard Google::Cloud::Monitoring::Dashboard::V1::GetDashboardRequest.new(name: name) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.get_dashboard({ name: name }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.get_dashboard Google::Cloud::Monitoring::Dashboard::V1::GetDashboardRequest.new(name: name), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, get_dashboard_client_stub.call_rpc_count
    end
  end

  def test_delete_dashboard
    # Create GRPC objects.
    grpc_response = Google::Protobuf::Empty.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    name = "hello world"

    delete_dashboard_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :delete_dashboard, name
      assert_kind_of Google::Cloud::Monitoring::Dashboard::V1::DeleteDashboardRequest, request
      assert_equal "hello world", request.name
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, delete_dashboard_client_stub do
      # Create client
      client = Google::Cloud::Monitoring::Dashboard::V1::DashboardsService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.delete_dashboard({ name: name }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.delete_dashboard name: name do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.delete_dashboard Google::Cloud::Monitoring::Dashboard::V1::DeleteDashboardRequest.new(name: name) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.delete_dashboard({ name: name }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.delete_dashboard Google::Cloud::Monitoring::Dashboard::V1::DeleteDashboardRequest.new(name: name), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, delete_dashboard_client_stub.call_rpc_count
    end
  end

  def test_update_dashboard
    # Create GRPC objects.
    grpc_response = Google::Cloud::Monitoring::Dashboard::V1::Dashboard.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    dashboard = {}

    update_dashboard_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :update_dashboard, name
      assert_kind_of Google::Cloud::Monitoring::Dashboard::V1::UpdateDashboardRequest, request
      assert_equal Gapic::Protobuf.coerce({}, to: Google::Cloud::Monitoring::Dashboard::V1::Dashboard), request.dashboard
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, update_dashboard_client_stub do
      # Create client
      client = Google::Cloud::Monitoring::Dashboard::V1::DashboardsService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.update_dashboard({ dashboard: dashboard }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.update_dashboard dashboard: dashboard do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.update_dashboard Google::Cloud::Monitoring::Dashboard::V1::UpdateDashboardRequest.new(dashboard: dashboard) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.update_dashboard({ dashboard: dashboard }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.update_dashboard Google::Cloud::Monitoring::Dashboard::V1::UpdateDashboardRequest.new(dashboard: dashboard), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, update_dashboard_client_stub.call_rpc_count
    end
  end

  def test_configure
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure

    client = block_config = config = nil
    Gapic::ServiceStub.stub :new, nil do
      client = Google::Cloud::Monitoring::Dashboard::V1::DashboardsService::Client.new do |config|
        config.credentials = grpc_channel
      end
    end

    config = client.configure do |c|
      block_config = c
    end

    assert_same block_config, config
    assert_kind_of Google::Cloud::Monitoring::Dashboard::V1::DashboardsService::Client::Configuration, config
  end
end
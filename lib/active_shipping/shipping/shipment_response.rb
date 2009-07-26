module ActiveMerchant #:nodoc:
  module Shipping
    
    class ShipmentResponse < Response
      attr_reader :params
      attr_accessor :message
      attr_reader :test
      attr_reader :identification_number # string
      attr_reader :transportation_charges, :service_options_charges
      attr_reader :total_charges
      attr_reader :billing_weight
      attr_reader :origin, :destination
      attr_reader :shipment_digest
      attr_accessor :packages
      attr_accessor :success
      attr_reader :response, :request
      attr_accessor :final_response, :final_request
      attr_accessor :control_log
      
      def initialize(success, message, params = {}, options = {})
        @identification_number = options[:identification_number]
        @transportation_charges, @service_options_charges = options[:transportation_charges], options[:service_options_charges]
        @total_charges = options[:total_charges]
        @billing_weight = options[:billing_weight]
        @origin, @destination = options[:origin], options[:destination]
        @shipment_digest = options[:shipment_digest]
        @success, @message, @params = success, message, params.stringify_keys
        @test = options[:test] || false
        @response = options[:response]
        @request = options[:request]
        raise ResponseError.new(self) unless success
      end
    
      def success?
        @success ? true : false
      end

      def test?
        @test ? true : false
      end

    end
    
  end
end
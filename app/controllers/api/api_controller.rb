module Api
	class ApiController < ApplicationController
    serialization_scope :current_user
    
		protected

		  def unauthenticated!(error)
        Rails.logger.warn { "Unauthenticated user not granted access" } unless Rails.env.production? || Rails.env.test?

      	api_error(status: 401, errors: error&.message || I18n.t("errors.messages.unauthenticated"))
    	end

    	def unauthorized!
        Rails.logger.warn { "unauthorized for: #{current_user.try(:id)}" } unless Rails.env.production? || Rails.env.test?

      	api_error(status: 403, errors: I18n.t("errors.messages.unauthorized"))
    	end

      def instance_scope
        { params: { current_user: current_user } }
      end

      def meta_attributes(resource, extra_meta = {})
        meta = {
          current_page: resource.current_page,
          next_page: resource.next_page,
          prev_page: resource.prev_page,
          total_pages: resource.total_pages,
          total_count: resource.total_count
        }.merge(extra_meta)

        meta
      end
      
      def api_error(status: 500, errors: [])
      Rails.logger.error(errors.message) if errors.respond_to?(:message)
      Rails.logger.error(errors.full_messages) if errors.respond_to?(:full_messages)

      render json: Api::V1::ErrorSerializer.new(status, errors).as_json,
             status: status
      end
	end
end
module Response
	
	  def json_success(object, serializer, status = :ok)
      render json: serializer.new(object.record, instance_scope),
             status: status
  	end

  	def json_response(object, serializer, fields, includes = [])
      render json: serializer.new(object.record, computed_single(fields, includes)),
             status: :ok
  	end

  	def collection_response(object, serializer, fields, includes = [])
      meta = meta_attributes(object.collection)

      render json: serializer.new(object.collection, computed_collection(fields, includes, meta)),
             status: :ok
  	end

    private
    
    def computed_single(fields, includes)
      fields = {} if fields.blank?
      includes = [] if includes.blank?

      new_instance = instance_scope.merge({
                                            fields: fields.as_json,
                                            includes: includes
                                          })

      new_instance
    end
    
    def computed_collection(fields, includes, meta)
      fields = {} if fields.blank?
      includes = [] if includes.blank?

      new_instance = instance_scope.merge({
                                            fields: fields.as_json,
                                            includes: includes,
                                            is_collection: true,
                                            meta: meta
                                          })

      new_instance
    end
end	
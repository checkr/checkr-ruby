module Checkr
  class APIList < APIClass
    include Enumerable

    attribute :object
    attribute :data
    attr_accessor :api_list_klass

    def [](k)
      data[k]
    end

    def []=(k, v)
      data[k]=v
    end

    def last
      data.last
    end

    def length
      data.length
    end

    def each(&blk)
      data.each(&blk)
    end

    def self.constructor(klass)
      lambda do |json|
        klass = Util.constantize(klass) unless klass.is_a?(Class)

        instance = self.new
        instance.api_list_klass = klass
        instance.refresh_from(json)
      end
    end

    def refresh_from(json)
      self.object = "list"
      self.data ||= []
      self.json = Util.sorta_deep_clone(json)

      if json.is_a?(Hash)
        self.refresh_from_hash(json)
      elsif json.is_a?(Array)
        self.refresh_from_array(json)
      else
        self.clear_changed_attributes
        self
      end
    end

    def refresh_from_hash(json={})
      klass = api_list_klass

      json.each do |k, v|
        if self.class.attribute_writer_names.include?(k.to_sym)
          if k.to_sym == :data
            self.send("#{k}=", v.map{ |i| klass.construct(i) })
          else
            self.send("#{k}=", v)
          end
        end
      end
      self
    end

    def refresh_from_array(array=[])
      klass = api_list_klass
      json = {
        :object => "list",
        :data => array
      }
      refresh_from_hash(json)
    end
  end
end

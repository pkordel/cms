module HstoreAccessor
  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    class << self; attr_accessor :hstore_keys end
    def hstore_accessor(hstore_attribute, *keys)
      my_keys = Array(keys).flatten
      @hstore_keys = []
      @hstore_keys += parent.hstore_keys if parent.respond_to? :hstore_keys
      @hstore_keys += my_keys
      my_keys.each do |key|
        define_method("#{key}=") do |value|
          send("#{hstore_attribute}=", (send(hstore_attribute) || {}).merge(key.to_s => value))
          send("#{hstore_attribute}_will_change!")
        end
        define_method(key) do
          send(hstore_attribute) && send(hstore_attribute)[key.to_s]
        end
      end
    end
    def hstore_keys
      @hstore_keys
    end
  end
end

ActiveRecord::Base.send(:include, HstoreAccessor)

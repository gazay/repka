module Repka
  module Base
    def self.included base
      base.send(:include, InstanceMethods)
    end

    module InstanceMethods
      def rep(field, key=nil, value=nil)
        field = field.to_s
        key = key.to_s if key
        value ||= 1
        
        stat = RepkaStorage.first(:conditions => {:date => Date.today}) || RepkaStorage.create
        storage = stat.storage
        if storage[field].nil?
          storage[field] = set_init(key, value)
        elsif key && storage[field][key].nil?
          storage[field] = storage[field].merge set_init(key, value)
        end

        if key.nil?
          storage[field] += value
        else
          # OMG WTF WITH MONGO?! It can't rewrite hash of hashes
          with_key = storage
          stat.storage = {}
          stat.save!
          with_key[field][key] += value
          stat.write_attribute(:storage, with_key)
        end
        stat.save!
      end
      
      def repka_all_stats
        RepkaStorage.all
      end
      
      def repka_today_stats
        RepkaStorage.first(:conditions => {:date => Date.today}) || RepkaStorage.create
      end
      
      private
      
      def set_init(key=nil, value)
        if key.nil?
          if value.is_a? Integer
            0
          elsif value.is_a? Float
            0.0
          end
        else
          if value.is_a? Integer
            { key => 0 }
          elsif value.is_a? Float
            { key => 0.0 }
          end
        end
      end
    end

  end
end

class ActionController::Base
  include Repka::Base
end

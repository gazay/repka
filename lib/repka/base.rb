module RepkaBase
  module Base
    def self.included base
      base.send(:include, InstanceMethods)
    end

    module InstanceMethods
      def rep(field, key=nil, value=nil)
        stat = Repka.first(:conditions => {:date => Date.today}) || Repka.create
        if value.nil?
          if key.nil?
            stat[field] += 1
          else
            stat[field][key] = (stat[field][key].nil?) ? 1 : stat[field][key] + 1
          end
        else
          if key.nil?
            stat[field] += value
          else
            stat[field][key] = (stat[field][key].nil?) ? value : stat[field][key] + value
          end
        end
        stat.save!
      end
    end

  end
end

module ActionController::Base
  include RepkaBase::Base
end

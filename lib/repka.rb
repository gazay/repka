# encoding: utf-8

require 'action_controller'
require 'repka/base'

class RepkaStorage
  include Mongoid::Document

  field :date, type: Date, default: -> { Date.today }
  field :storage, type: Hash, default: -> { Hash.new }
end
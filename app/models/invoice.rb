class Invoice < ActiveRecord::Base
  attr_accessible   :description,
                    :client_id,
                    :created,
                    :due

  has_many :tasks,
    :foreign_key => "invoice_id"

  belongs_to :client

  validates_presence_of :description,
                        :client_id,
                        :created
end

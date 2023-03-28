class Game < ApplicationRecord
    #validates checks the specific attribute for certain parameters before putting into the database, If any fail then the error condition is relayed back.
    #presence checks if the attribute is blank or not
    #uniqueness checks if the attribute is not the same an another attribute in the databse
    #numericality is to set ranges for numbers
    validates :title, presence: true, uniqueness: true
    validates :rating, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 10 }
    validates :hours, presence: true
    validates :review, presence: true

end

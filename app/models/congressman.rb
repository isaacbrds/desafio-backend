require 'open-uri'
class Congressman < ApplicationRecord
  has_many :expenses, dependent: :destroy
  paginates_per 10

  validates :cpf, uniqueness: true

  before_save :grab_image

  def grab_image
    url = URI.parse("http://www.camara.leg.br/internet/deputado/bandep/#{self.cod_register}.jpg")
    filename = File.basename(url.path)
    file = URI.open(url)
    self.avatar.attach(io: file, filename: filename)
  end

  scope :from_cpf, -> (cpf) {
    where(cpf: cpf)
   }
end

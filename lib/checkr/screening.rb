module Checkr
  class Screening < APIResource

    attribute :type
    attribute :subtype

    APIClass.register_subclass(self, "screening")
  end
end

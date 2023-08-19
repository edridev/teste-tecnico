class Vagas::Index
  include Interactor::Organizer

  organize Domain::SetPagination, Vagas::GetAll, Domain::StatusOk
end

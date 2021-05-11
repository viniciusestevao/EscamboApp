
require "prawn"

prawn_document(page_layout: :portrait) do |pdf|
    pdf.text "Listando Categorias"
    pdf.move_down 20
    pdf.tabel @products.collect{|p| [p.name,p.price]}
end
// require jquery-rails
// require jquery
//= require jquery_ujs
//= require bootstrap_sb_admin_base_v2
//= require bootbox
//= require jquery-ui/widgets/datepicker
//= require jquery-ui/i18n/datepicker-pt-BR
//= require bootstrap-markdown
//= require marked
// require wiselinks // Não funciona com esse Rails
//= require jquery.raty
//= require ratyrate

/** Wiselinks Gem **/ 
//$(function(){
//  window.wiselinks = new Wiselinks();
//});


(function ($) {
  $.fn.markdown.messages.ptBR = {
    'Bold': "Negrito",
    'Italic': "Itálico",
    'Heading': "Título",
    'URL/Link': "Inserir link",
    'Image': "Inserir uma imagem",
    'List': "Lista",
    'Preview': "Visualizar",
    'strong text': "Texto importante",
    'emphasized text': "Texto em itálico",
    'heading text': "Texto de título",
    'enter link description here': "Insira a descrição do link aqui",
    'Insert Hyperlink': "Inserir um hyperlink",
    'enter image description here': "Insira a descrição da imagem aqui",
    'Insert Image Hyperlink': "Insira o link da imagem aqui",
    'enter image title here': "Insira o título da imagem aqui",
    'list text here': "Texto da lista aqui",
    'Save': "Salvar",
    'Ordered List': "Lista ordenada",
    'Unordered List': "Lista",
    'Quote': "Citação",
    'quote here': "Escreva a citação",
    'Code': "Código",
    'code text here': "Escreva o código aqui"
  };

  $("#ad_description_md").markdown({language:'ptBR'});
}(jQuery));



/* Sobrescreve o data-confirm do Rails:  
$.rails.allowAction = function(element) {
    var message = element.attr('data-confirm');
    if (!message) { return true; }
  
    var opts = {
      title: "Confirmação",
      message: message,
      buttons: {
          confirm: {
              label: 'Sim',
              className: 'btn-success'
          },
          cancel: {
              label: 'Não',
              className: 'btn-danger'
          }
      },
      callback: function(result) {
        if (result) {
          element.removeAttr('data-confirm');
          element.trigger('click.rails')
        }
      }
    };
  
    bootbox.confirm(opts);
  
    return false;
  }*/
  
